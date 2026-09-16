Alias: $SCT = http://snomed.info/sct

// ============================================
// Modified Ashworth Scale (MAS)
// Updated to match 醫師評估表.pdf
// ============================================
//
// The source form contains:
//   患側手：右手 / 左手
//   MAS:
//     肩-F, 肩-AB, 肩-ER, 肩-IR,
//     肘-F, 肘-E, 肘-P, 肘-S,
//     指-F, 指-E
//
// The PDF does not expand these abbreviations, so the Questionnaire
// preserves the labels exactly as printed on the source form.

Instance: MASQuestionnaireInstance
InstanceOf: SPACQuestionnaire
Usage: #definition
Title: "修正式艾許瓦式量表（MAS）"
Description: "依醫師評估表記錄患側手之修正式艾許瓦式量表（Modified Ashworth Scale, MAS）評估結果。"

* name = "MASQuestionnaire"
* title = "修正式艾許瓦式量表（MAS）"
* description = "記錄肩、肘與手指各動作項目的 MAS 分級。"
* status = #active
* purpose = "用於記錄患側上肢之肌張力評估。"
* subjectType = #Patient

// ============================================
// 評估側
// ============================================
* item[0].linkId = "assessment-side-mas"
* item[=].text = "患側手"
* item[=].type = #choice
* item[=].required = true

// Keep the same laterality coding convention used by the other
// rehabilitation questionnaires in this IG.
* item[=].answerOption[0].valueCoding.system = $SCT
* item[=].answerOption[=].valueCoding.code = #24028007
* item[=].answerOption[=].valueCoding.display = "Right"
* item[=].answerOption[+].valueCoding.system = $SCT
* item[=].answerOption[=].valueCoding.code = #7771000
* item[=].answerOption[=].valueCoding.display = "Left"

// ============================================
// MAS
// ============================================
* item[+].linkId = "mas"
* item[=].text = "修正式艾許瓦式量表(MAS)"
* item[=].type = #group
* item[=].required = true

// 肩-F
* item[=].item[0].linkId = "mas-shoulder-f"
* item[=].item[=].text = "肩-F"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = Canonical(VSMAScore)

// 肩-AB
* item[=].item[+].linkId = "mas-shoulder-ab"
* item[=].item[=].text = "肩-AB"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = Canonical(VSMAScore)

// 肩-ER
* item[=].item[+].linkId = "mas-shoulder-er"
* item[=].item[=].text = "肩-ER"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = Canonical(VSMAScore)

// 肩-IR
* item[=].item[+].linkId = "mas-shoulder-ir"
* item[=].item[=].text = "肩-IR"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = Canonical(VSMAScore)

// 肘-F
* item[=].item[+].linkId = "mas-elbow-f"
* item[=].item[=].text = "肘-F"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = Canonical(VSMAScore)

// 肘-E
* item[=].item[+].linkId = "mas-elbow-e"
* item[=].item[=].text = "肘-E"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = Canonical(VSMAScore)

// 肘-P
* item[=].item[+].linkId = "mas-elbow-p"
* item[=].item[=].text = "肘-P"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = Canonical(VSMAScore)

// 肘-S
* item[=].item[+].linkId = "mas-elbow-s"
* item[=].item[=].text = "肘-S"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = Canonical(VSMAScore)

// 指-F
* item[=].item[+].linkId = "mas-finger-f"
* item[=].item[=].text = "指-F"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = Canonical(VSMAScore)

// 指-E
* item[=].item[+].linkId = "mas-finger-e"
* item[=].item[=].text = "指-E"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = Canonical(VSMAScore)

// SDC 4 requires versionAlgorithm when version is present.
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
* extension[=].valueCoding = http://hl7.org/fhir/version-algorithm#semver "SemVer"
