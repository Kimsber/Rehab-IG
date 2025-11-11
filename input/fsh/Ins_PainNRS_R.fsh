Instance: PainNRSQuestionnaireResponseExample
InstanceOf: PainNRSQuestionnaireResponse
Usage: #example
Title: "Pain NRS 量表問卷回覆範例"
Description: "Pain NRS 完整範例"
* status = #completed
* subject = Reference(Patient/PatientExample)
* questionnaire = Canonical(PainNRSQuestionnaireInstance)   
* authored = "2025-11-11"
// ====肩膀====
* item[0].linkId = "pain-nrs-shoulder"
* item[=].text = "肩膀"
* item[=].answer.valueCoding = CSPainNRS#7

// ====手肘====
* item[+].linkId = "pain-nrs-elbow"
* item[=].text = "手肘"
* item[=].answer.valueCoding = CSPainNRS#4
// ====手腕====
* item[+].linkId = "pain-nrs-wrist"
* item[=].text = "手腕"
* item[=].answer.valueCoding = CSPainNRS#2


