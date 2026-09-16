Alias: $mas = https://build.fhir.org/ig/Kimsber/Rehab-IG/CodeSystem/mas-score
Alias: $SCT = http://snomed.info/sct

// ============================================
// MAS QuestionnaireResponse Example
// Updated to match Ins_MAS_updated.fsh
// ============================================

Instance: MASQuestionnaireResponseExample
InstanceOf: MASQuestionnaireResponse
Usage: #example
Title: "MAS 問卷回覆範例"
Description: "修正式艾許瓦式量表（MAS）QuestionnaireResponse 範例；包含患側手與醫師評估表中的 10 個 MAS 評估項目。"

* questionnaire = Canonical(MASQuestionnaireInstance)
* status = #completed
* subject = Reference(Patient/stroke-patient-001) "張先生"
* authored = "2025-10-21T14:30:00+08:00"
* author = Reference(Practitioner/ot-therapist-001) "復健治療師 - 李小姐"

// ============================================
// 評估側別
// ============================================
* item[assessmentSide].linkId = "assessment-side-mas"
* item[assessmentSide].text = "患側手"
* item[assessmentSide].answer.valueCoding = $SCT#24028007 "Right"

// ============================================
// MAS
// ============================================
* item[masSection].linkId = "mas"
* item[masSection].text = "修正式艾許瓦式量表(MAS)"

// 肩-F = 1
* item[masSection].item[shoulderF].linkId = "mas-shoulder-f"
* item[masSection].item[shoulderF].text = "肩-F"
* item[masSection].item[shoulderF].answer.valueCoding = $mas#1

// 肩-AB = 1+
* item[masSection].item[shoulderAB].linkId = "mas-shoulder-ab"
* item[masSection].item[shoulderAB].text = "肩-AB"
* item[masSection].item[shoulderAB].answer.valueCoding = $mas#1+

// 肩-ER = 2
* item[masSection].item[shoulderER].linkId = "mas-shoulder-er"
* item[masSection].item[shoulderER].text = "肩-ER"
* item[masSection].item[shoulderER].answer.valueCoding = $mas#2

// 肩-IR = 2
* item[masSection].item[shoulderIR].linkId = "mas-shoulder-ir"
* item[masSection].item[shoulderIR].text = "肩-IR"
* item[masSection].item[shoulderIR].answer.valueCoding = $mas#2

// 肘-F = 3
* item[masSection].item[elbowF].linkId = "mas-elbow-f"
* item[masSection].item[elbowF].text = "肘-F"
* item[masSection].item[elbowF].answer.valueCoding = $mas#3

// 肘-E = 2
* item[masSection].item[elbowE].linkId = "mas-elbow-e"
* item[masSection].item[elbowE].text = "肘-E"
* item[masSection].item[elbowE].answer.valueCoding = $mas#2

// 肘-P = 1+
* item[masSection].item[elbowP].linkId = "mas-elbow-p"
* item[masSection].item[elbowP].text = "肘-P"
* item[masSection].item[elbowP].answer.valueCoding = $mas#1+

// 肘-S = 1
* item[masSection].item[elbowS].linkId = "mas-elbow-s"
* item[masSection].item[elbowS].text = "肘-S"
* item[masSection].item[elbowS].answer.valueCoding = $mas#1

// 指-F = 3
* item[masSection].item[fingerF].linkId = "mas-finger-f"
* item[masSection].item[fingerF].text = "指-F"
* item[masSection].item[fingerF].answer.valueCoding = $mas#3

// 指-E = 2
* item[masSection].item[fingerE].linkId = "mas-finger-e"
* item[masSection].item[fingerE].text = "指-E"
* item[masSection].item[fingerE].answer.valueCoding = $mas#2
