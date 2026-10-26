import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import org.hl7.fhir.model.core.OperationOutcome;
import org.hl7.fhir.model.utilities.formats.FhirFormat;
import org.hl7.fhir.validation.ValidationEngine;

class ValidateWMFTProfile {
  public static void main(String[] args) throws Exception {
    if (args.length < 1 || args.length > 2) {
      throw new IllegalArgumentException("Pass the IG package .tgz path and optional profile JSON path");
    }
    var engine = new ValidationEngine.ValidationEngineBuilder()
        .withVersion("4.0.1")
        .withNoTerminologyServer()
        .fromSource("hl7.fhir.r4.core#4.0.1");
    engine.loadPackage(args[0], null);

    String profileFile = args.length == 2 ? args[1]
        : "fsh-generated/resources/StructureDefinition-WMFTQuestionnaireResponse.json";
    int bindingErrors;
    try (var input = new FileInputStream(profileFile)) {
      OperationOutcome outcome = engine.validate(FhirFormat.JSON, input, List.of());
      bindingErrors = (int) outcome.getIssueList().stream()
          .map(issue -> issue.getDetails().getText())
          .filter(message -> message != null && message.toLowerCase().contains("binding")
              && message.toLowerCase().contains("integer"))
          .count();
    }

    String canonical = Files.readAllLines(Path.of("sushi-config.yaml")).stream()
        .map(String::trim)
        .filter(line -> line.startsWith("canonical:"))
        .findFirst()
        .orElseThrow()
        .substring("canonical:".length())
        .trim();
    String profile = canonical + "/StructureDefinition/WMFTQuestionnaireResponse";
    String original = Files.readString(Path.of(
        "fsh-generated/resources/QuestionnaireResponse-WMFTQuestionnaireResponseExample.json"));
    String invalid = original.replaceFirst("\\\"valueInteger\\\"\\s*:\\s*\\d+",
        "\"valueString\": \"invalid score\"");
    if (original.equals(invalid)) throw new IllegalStateException("No integer answer found to mutate");

    int validErrors = invariantErrors(engine, original, profile);
    int invalidErrors = invariantErrors(engine, invalid, profile);
    System.out.println("WMFT integer binding errors: " + bindingErrors);
    System.out.println("WMFT original answer invariant errors: " + validErrors);
    System.out.println("WMFT invalid answer invariant errors: " + invalidErrors);
    if (bindingErrors != 0 || validErrors != 0 || invalidErrors == 0) System.exit(1);
  }

  private static int invariantErrors(ValidationEngine engine, String json, String profile)
      throws Exception {
    try (var input = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8))) {
      OperationOutcome outcome = engine.validate(FhirFormat.JSON, input, List.of(profile));
      return (int) outcome.getIssueList().stream()
          .map(issue -> issue.getDetails().getText())
          .filter(message -> message != null && message.contains("wmft-answer-integer"))
          .count();
    }
  }
}
