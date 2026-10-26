$igPath = Join-Path $PSScriptRoot '../fsh-generated/resources/ImplementationGuide-fhir.rehabig.json'
$resourceDir = Join-Path $PSScriptRoot '../fsh-generated/resources'

if (-not (Test-Path -LiteralPath $igPath)) {
    Write-Error "Generated ImplementationGuide is missing: $igPath"
    exit 1
}

$ig = [IO.File]::ReadAllText($igPath, [Text.Encoding]::UTF8) | ConvertFrom-Json
$missing = @()

foreach ($entry in $ig.definition.resource) {
    $reference = $entry.reference.reference
    if ($reference -notmatch '^QuestionnaireResponse/([^/]+)$') {
        continue
    }

    $source = Join-Path $resourceDir "QuestionnaireResponse-$($Matches[1]).json"
    if (-not (Test-Path -LiteralPath $source)) {
        $missing += "$reference -> $source"
    }
}

if ($missing.Count -gt 0) {
    $missing | ForEach-Object { Write-Output "FAIL Missing Publisher source: $_" }
    exit 1
}

Write-Output 'PASS All QuestionnaireResponse references have generated source files.'
