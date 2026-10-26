import java.io.FileInputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import org.hl7.fhir.model.core.OperationOutcome;
import org.hl7.fhir.model.utilities.formats.FhirFormat;
import org.hl7.fhir.validation.ValidationEngine;

class ValidateNestedResponses {
  public static void main(String[] args) throws Exception {
    if (args.length != 1) {
      throw new IllegalArgumentException("Pass the IG package .tgz path");
    }

    var engine = new ValidationEngine.ValidationEngineBuilder()
        .withVersion("4.0.1")
        .withNoTerminologyServer()
        .fromSource("hl7.fhir.r4.core#4.0.1");
    engine.loadPackage(args[0], null);

    String canonical = Files.readAllLines(Path.of("sushi-config.yaml")).stream()
        .map(String::trim)
        .filter(line -> line.startsWith("canonical:"))
        .findFirst()
        .orElseThrow()
        .substring("canonical:".length())
        .trim();

    String[][] cases = {
      {"MASQuestionnaireResponseExample", "MASQuestionnaireResponse"},
      {"brsa-response-example-001", "BRSArmQuestionnaireResponse"},
      {"mmt-ue-response-example-001", "MMTUEQuestionnaireResponse"}
    };
    int total = 0;
    for (String[] testCase : cases) {
      String file = "fsh-generated/resources/QuestionnaireResponse-" + testCase[0] + ".json";
      try (var input = new FileInputStream(file)) {
        OperationOutcome outcome = engine.validate(
            FhirFormat.JSON, input, List.of(canonical + "/StructureDefinition/" + testCase[1]));
        long count = outcome.getIssueList().stream()
            .map(issue -> issue.getDetails().getText())
            .filter(message -> message != null && message.contains("not allowed by the profile"))
            .count();
        System.out.println(testCase[1] + ": " + count + " nested profile errors");
        total += count;
      }
    }
    if (total > 0) System.exit(1);
  }
}
