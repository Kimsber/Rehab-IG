Alias: $snomed = http://snomed.info/sct
Alias: $rehab = https://build.fhir.org/ig/Kimsber/Rehab-IG/CodeSystem/rehab-assessment-codes
Alias: $obs-category = http://terminology.hl7.org/CodeSystem/observation-category

// Manual Muscle Test for Upper Extremity (MMT for UE)
// Items follow 醫師評估表.pdf:
//   - 肩膀外展
//   - 肩膀內收
//   - 手肘屈曲
//   - 手肘伸直
//   - 手腕屈曲
//   - 手腕伸直
//   - 手指屈曲
//   - 手指伸直
//
// The source form labels the result as "數字分級" but does not contain the
// grading legend. This draft uses the commonly used 0–5 MMT/MRC numeric scale.

Instance: MMTUEQuestionnaireInstance
InstanceOf: SPACQuestionnaire
Usage: #definition
Title: "徒手肌力檢查（MMT for UE）"
Description: "上肢徒手肌力檢查（Manual Muscle Test, MMT for UE）問卷實例，依關節動作記錄數字分級。"

* name = "MMTUEQuestionnaire"
* title = "徒手肌力檢查（MMT for UE）"
* description = "依序記錄肩膀、手肘、手腕與手指動作之徒手肌力數字分級。"
* status = #active
* purpose = "用於記錄上肢各關節動作的徒手肌力分級。"
* subjectType = #Patient

// ============================================
// SDC Observation-based extraction
// ============================================
// Each MMT movement item has:
//   1) Questionnaire.item.code -> becomes Observation.code
//   2) sdc-questionnaire-observationExtract = true
//   3) Observation category = survey
//
// The selected integer grade becomes Observation.value[x].
// "患側手" remains in QuestionnaireResponse. Observation-based extraction alone
// does NOT map that separate answer to Observation.bodySite; use a StructureMap
// or custom extraction rule later if laterality must be copied into each Observation.

// ============================================
// 評估側
// ============================================
* item[0].linkId = "assessment-side-mmt-ue"
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
// MMT for UE
// ============================================
* item[+].linkId = "mmt-ue"
* item[=].text = "徒手肌力檢查 Manual Muscle Test; MMT for UE"
* item[=].type = #group
* item[=].required = true

// 0–5 共用選項:
// 0 = 無可見/可觸及肌肉收縮
// 1 = 可見或可觸及收縮，但無關節動作
// 2 = 去除重力下可完成動作
// 3 = 可對抗重力完成動作
// 4 = 可對抗重力及部分阻力
// 5 = 可對抗重力及最大/完整阻力

// 肩膀外展
* item[=].item[0].linkId = "mmt-shoulder-abduction"
* item[=].item[=].text = "肩膀外展"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].code[0] = $rehab#mmt-shoulder-abduction "Shoulder abduction manual muscle test grade"

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
* item[=].item[=].extension[=].valueCodeableConcept.coding[0].system = $obs-category
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].code = #survey
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].display = "Survey"
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
* item[=].item[=].answerOption[+].valueInteger = 4
* item[=].item[=].answerOption[+].valueInteger = 5

// 肩膀內收
* item[=].item[+].linkId = "mmt-shoulder-adduction"
* item[=].item[=].text = "肩膀內收"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].code[0] = $rehab#mmt-shoulder-adduction "Shoulder adduction manual muscle test grade"

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
* item[=].item[=].extension[=].valueCodeableConcept.coding[0].system = $obs-category
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].code = #survey
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].display = "Survey"
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
* item[=].item[=].answerOption[+].valueInteger = 4
* item[=].item[=].answerOption[+].valueInteger = 5

// 手肘屈曲
* item[=].item[+].linkId = "mmt-elbow-flexion"
* item[=].item[=].text = "手肘屈曲"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].code[0] = $rehab#mmt-elbow-flexion "Elbow flexion manual muscle test grade"

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
* item[=].item[=].extension[=].valueCodeableConcept.coding[0].system = $obs-category
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].code = #survey
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].display = "Survey"
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
* item[=].item[=].answerOption[+].valueInteger = 4
* item[=].item[=].answerOption[+].valueInteger = 5

// 手肘伸直
* item[=].item[+].linkId = "mmt-elbow-extension"
* item[=].item[=].text = "手肘伸直"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].code[0] = $rehab#mmt-elbow-extension "Elbow extension manual muscle test grade"

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
* item[=].item[=].extension[=].valueCodeableConcept.coding[0].system = $obs-category
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].code = #survey
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].display = "Survey"
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
* item[=].item[=].answerOption[+].valueInteger = 4
* item[=].item[=].answerOption[+].valueInteger = 5

// 手腕屈曲
* item[=].item[+].linkId = "mmt-wrist-flexion"
* item[=].item[=].text = "手腕屈曲"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].code[0] = $rehab#mmt-wrist-flexion "Wrist flexion manual muscle test grade"

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
* item[=].item[=].extension[=].valueCodeableConcept.coding[0].system = $obs-category
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].code = #survey
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].display = "Survey"
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
* item[=].item[=].answerOption[+].valueInteger = 4
* item[=].item[=].answerOption[+].valueInteger = 5

// 手腕伸直
* item[=].item[+].linkId = "mmt-wrist-extension"
* item[=].item[=].text = "手腕伸直"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].code[0] = $rehab#mmt-wrist-extension "Wrist extension manual muscle test grade"

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
* item[=].item[=].extension[=].valueCodeableConcept.coding[0].system = $obs-category
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].code = #survey
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].display = "Survey"
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
* item[=].item[=].answerOption[+].valueInteger = 4
* item[=].item[=].answerOption[+].valueInteger = 5

// 手指屈曲
* item[=].item[+].linkId = "mmt-finger-flexion"
* item[=].item[=].text = "手指屈曲"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].code[0] = $rehab#mmt-finger-flexion "Finger flexion manual muscle test grade"

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
* item[=].item[=].extension[=].valueCodeableConcept.coding[0].system = $obs-category
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].code = #survey
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].display = "Survey"
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
* item[=].item[=].answerOption[+].valueInteger = 4
* item[=].item[=].answerOption[+].valueInteger = 5

// 手指伸直
* item[=].item[+].linkId = "mmt-finger-extension"
* item[=].item[=].text = "手指伸直"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].code[0] = $rehab#mmt-finger-extension "Finger extension manual muscle test grade"

* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observation-extract-category"
* item[=].item[=].extension[=].valueCodeableConcept.coding[0].system = $obs-category
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].code = #survey
* item[=].item[=].extension[=].valueCodeableConcept.coding[=].display = "Survey"
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
* item[=].item[=].answerOption[+].valueInteger = 4
* item[=].item[=].answerOption[+].valueInteger = 5
