param(
    [string]$Package = 'output/package.tgz',
    [string]$ProfileJson = 'fsh-generated/resources/StructureDefinition-WMFTQuestionnaireResponse.json'
)

$publisherJar = if ($env:PUBLISHER_JAR) {
    $env:PUBLISHER_JAR
} elseif (Test-Path -LiteralPath 'input-cache/publisher.jar') {
    'input-cache/publisher.jar'
} else {
    Join-Path $env:USERPROFILE '.fhir/tools/publisher/publisher.jar'
}

if (-not (Test-Path -LiteralPath $publisherJar)) {
    Write-Error "Publisher JAR not found: $publisherJar"
    exit 1
}

java "-Duser.home=$env:USERPROFILE" --class-path $publisherJar `
    (Join-Path $PSScriptRoot 'ValidateWMFTProfile.java') $Package $ProfileJson
exit $LASTEXITCODE
