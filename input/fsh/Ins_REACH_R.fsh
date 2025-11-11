Instance: REACHQuestionnaireResponseExample
InstanceOf: SPACQuestionnaireResponse
Usage: #example
Title: "Rating of Everyday Arm-use in the Community and at Home (REACH) 評估量表問卷回覆範例"
Description: "REACH 評估量表問卷回覆範例"
* questionnaire = Canonical(REACHQuestionnaireInstance)
* status = #completed
* subject = Reference(Patient/PatientExample) 
* authored = "2025-11-10"
// ====評估側: 右手====
* item[0].linkId = "reach-left"
* item[=].text = "左上肢 REACH 評分"
* item[=].answer[0].valueCoding = #3
// ====評估側: 右手====
* item[+].linkId = "reach-right"
* item[=].text = "右上肢 REACH 評分"
* item[=].answer[0].valueCoding = #4

