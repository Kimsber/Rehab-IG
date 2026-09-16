// ============================================
// MMT for UE QuestionnaireResponse 實例範例
// ============================================
Instance: MMTUEQuestionnaireResponseExample
InstanceOf: MMTUEQuestionnaireResponse
Usage: #example
Title: "MMT for UE問卷回覆範例"
Description: "一位中風患者進行上肢徒手肌力檢查（MMT for UE）的完整問卷回覆範例，包含評估側與八個上肢動作的數字分級。"

* id = "mmt-ue-response-example-001"
* questionnaire = Canonical(MMTUEQuestionnaireInstance)
* status = #completed
* subject = Reference(stroke-patient-001) "王小姐"
* authored = "2025-10-11T15:00:00+08:00"
* author = Reference(ot-therapist-001) "復健治療師 - 李小姐"

// ============================================
// 評估側別
// ============================================
* item[assessmentSide].linkId = "assessment-side-mmt-ue"
* item[assessmentSide].text = "患側手"
* item[assessmentSide].answer.valueCoding = http://snomed.info/sct#24028007 "Right"

// ============================================
// MMT for UE
// ============================================
* item[mmtUESection].linkId = "mmt-ue"
* item[mmtUESection].text = "徒手肌力檢查 Manual Muscle Test; MMT for UE"

// 肩膀外展 = 4
* item[mmtUESection].item[shoulderAbduction].linkId = "mmt-shoulder-abduction"
* item[mmtUESection].item[shoulderAbduction].text = "肩膀外展"
* item[mmtUESection].item[shoulderAbduction].answer.valueInteger = 4

// 肩膀內收 = 3
* item[mmtUESection].item[shoulderAdduction].linkId = "mmt-shoulder-adduction"
* item[mmtUESection].item[shoulderAdduction].text = "肩膀內收"
* item[mmtUESection].item[shoulderAdduction].answer.valueInteger = 3

// 手肘屈曲 = 5
* item[mmtUESection].item[elbowFlexion].linkId = "mmt-elbow-flexion"
* item[mmtUESection].item[elbowFlexion].text = "手肘屈曲"
* item[mmtUESection].item[elbowFlexion].answer.valueInteger = 5

// 手肘伸直 = 4
* item[mmtUESection].item[elbowExtension].linkId = "mmt-elbow-extension"
* item[mmtUESection].item[elbowExtension].text = "手肘伸直"
* item[mmtUESection].item[elbowExtension].answer.valueInteger = 4

// 手腕屈曲 = 3
* item[mmtUESection].item[wristFlexion].linkId = "mmt-wrist-flexion"
* item[mmtUESection].item[wristFlexion].text = "手腕屈曲"
* item[mmtUESection].item[wristFlexion].answer.valueInteger = 3

// 手腕伸直 = 3
* item[mmtUESection].item[wristExtension].linkId = "mmt-wrist-extension"
* item[mmtUESection].item[wristExtension].text = "手腕伸直"
* item[mmtUESection].item[wristExtension].answer.valueInteger = 3

// 手指屈曲 = 2
* item[mmtUESection].item[fingerFlexion].linkId = "mmt-finger-flexion"
* item[mmtUESection].item[fingerFlexion].text = "手指屈曲"
* item[mmtUESection].item[fingerFlexion].answer.valueInteger = 2

// 手指伸直 = 2
* item[mmtUESection].item[fingerExtension].linkId = "mmt-finger-extension"
* item[mmtUESection].item[fingerExtension].text = "手指伸直"
* item[mmtUESection].item[fingerExtension].answer.valueInteger = 2
