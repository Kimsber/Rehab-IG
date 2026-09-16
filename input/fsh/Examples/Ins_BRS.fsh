Alias: $snomed = http://snomed.info/sct
Alias: $rehab = https://build.fhir.org/ig/Kimsber/Rehab-IG/CodeSystem/rehab-assessment-codes
Alias: $obs-category = http://terminology.hl7.org/CodeSystem/observation-category

// Brunnstrom Recovery Stage of Arm (BRS-A)
// Based on the fields shown in 醫師評估表.pdf:
//   - 上肢近端
//   - 上肢遠端
//
// NOTE:
// The source form does not provide the textual definition of each Brunnstrom stage.
// Therefore this instance records the stage as an integer choice (1–6) without
// adding stage descriptions that are not present in the source document.

Instance: BRSArmQuestionnaireInstance
InstanceOf: SPACQuestionnaire
Usage: #definition
Title: "手臂布朗斯壯動作分期（BRS-A）"
Description: "手臂布朗斯壯動作分期（Brunnstrom Recovery Stage of Arm, BRS-A）評估問卷實例，包含上肢近端與上肢遠端分期。"

* name = "BRSArmQuestionnaire"
* title = "手臂布朗斯壯動作分期（BRS-A）"
* description = "記錄患側上肢近端與上肢遠端的 Brunnstrom Recovery Stage。"
* status = #active
* purpose = "用於記錄上肢動作恢復分期。"
* subjectType = #Patient

// ============================================
// SDC Observation-based extraction
// ============================================
// Each BRS result item has:
//   1) Questionnaire.item.code -> becomes Observation.code
//   2) sdc-questionnaire-observationExtract = true
//   3) Observation category = survey
//
// The selected integer stage becomes Observation.value[x].
// "患側手" remains in QuestionnaireResponse. Observation-based extraction alone
// does NOT map that separate answer to Observation.bodySite; use a StructureMap
// or custom extraction rule later if laterality must be copied into each Observation.

// ============================================
// 評估側
// ============================================
* item[0].linkId = "assessment-side-brs-a"
* item[=].text = "患側手"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].valueCoding.system = $snomed
* item[=].answerOption[=].valueCoding.code = #24028007
* item[=].answerOption[=].valueCoding.display = "Right"
* item[=].answerOption[+].valueCoding.system = $snomed
* item[=].answerOption[=].valueCoding.code = #7771000
* item[=].answerOption[=].valueCoding.display = "Left"

// ============================================
// BRS-A
// ============================================
* item[+].linkId = "brs-a"
* item[=].text = "手臂布朗斯壯動作分期（Brunnstrom Recovery Stage of Arm, BRS-A）"
* item[=].type = #group
* item[=].required = true

// 上肢近端
* item[=].item[0].linkId = "brs-a-proximal-upper-extremity"
* item[=].item[=].text = "上肢近端"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].code[0] = $rehab#brs-a-proximal-upper-extremity "BRS-A proximal upper extremity stage"

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
* item[=].item[=].extension[=].valueCodeableConcept.coding[0].system = $obs-category
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].code = #survey
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].display = "Survey"
* item[=].item[=].answerOption[0].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
* item[=].item[=].answerOption[+].valueInteger = 4
* item[=].item[=].answerOption[+].valueInteger = 5
* item[=].item[=].answerOption[+].valueInteger = 6

// 上肢遠端
* item[=].item[+].linkId = "brs-a-distal-upper-extremity"
* item[=].item[=].text = "上肢遠端"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].code[0] = $rehab#brs-a-distal-upper-extremity "BRS-A distal upper extremity stage"

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
* item[=].item[=].extension[=].valueCodeableConcept.coding[0].system = $obs-category
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].code = #survey
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].display = "Survey"
* item[=].item[=].answerOption[0].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
* item[=].item[=].answerOption[+].valueInteger = 4
* item[=].item[=].answerOption[+].valueInteger = 5
* item[=].item[=].answerOption[+].valueInteger = 6
