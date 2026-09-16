// ============================================
// MMT for UE QuestionnaireResponse Profile
// ============================================
Profile: MMTUEQuestionnaireResponse
Parent: SPACQuestionnaireResponse
Id: MMTUEQuestionnaireResponse
Title: "徒手肌力檢查（MMT for UE）問卷回覆"
Description: "針對上肢徒手肌力檢查（Manual Muscle Test, MMT for UE）問卷的 QuestionnaireResponse Profile，強制回傳格式符合問卷結構。"

// 固定問卷參考
* questionnaire = Canonical(MMTUEQuestionnaireInstance) (exactly)

// 基本約束
* status = #completed
* subject 1..1
* subject only Reference(Patient)
* authored 1..1

// ============================================
// 第一層 item slicing
// ============================================
* item ^slicing.discriminator.type = #value
* item ^slicing.discriminator.path = "linkId"
* item ^slicing.rules = #closed
* item ^slicing.ordered = false
* item ^slicing.description = "根據 linkId 區分 MMT for UE 問卷的主要區塊"

* item contains
    assessmentSide 1..1 MS and
    mmtUESection 1..1 MS

// ============================================
// 評估側別
// ============================================
* item[assessmentSide].linkId = "assessment-side-mmt-ue" (exactly)
* item[assessmentSide].text = "患側手"
* item[assessmentSide].answer 1..1
* item[assessmentSide].answer.value[x] only Coding
* item[assessmentSide].answer.valueCoding from AssessmentSideValueSet (required)

// ============================================
// MMT for UE Section
// ============================================
* item[mmtUESection].linkId = "mmt-ue" (exactly)
* item[mmtUESection].text = "徒手肌力檢查 Manual Muscle Test; MMT for UE"
* item[mmtUESection].answer 0..0

// ============================================
// MMT 子項目 slicing
// ============================================
* item[mmtUESection].item ^slicing.discriminator.type = #value
* item[mmtUESection].item ^slicing.discriminator.path = "linkId"
* item[mmtUESection].item ^slicing.rules = #closed
* item[mmtUESection].item ^slicing.ordered = false
* item[mmtUESection].item ^slicing.description = "根據 linkId 區分上肢各關節動作之 MMT 數字分級"

* item[mmtUESection].item contains
    shoulderAbduction 1..1 MS and
    shoulderAdduction 1..1 MS and
    elbowFlexion 1..1 MS and
    elbowExtension 1..1 MS and
    wristFlexion 1..1 MS and
    wristExtension 1..1 MS and
    fingerFlexion 1..1 MS and
    fingerExtension 1..1 MS

// 肩膀外展
* item[mmtUESection].item[shoulderAbduction].linkId = "mmt-shoulder-abduction" (exactly)
* item[mmtUESection].item[shoulderAbduction].text = "肩膀外展"
* item[mmtUESection].item[shoulderAbduction].answer 1..1
* item[mmtUESection].item[shoulderAbduction].answer.value[x] only integer

// 肩膀內收
* item[mmtUESection].item[shoulderAdduction].linkId = "mmt-shoulder-adduction" (exactly)
* item[mmtUESection].item[shoulderAdduction].text = "肩膀內收"
* item[mmtUESection].item[shoulderAdduction].answer 1..1
* item[mmtUESection].item[shoulderAdduction].answer.value[x] only integer

// 手肘屈曲
* item[mmtUESection].item[elbowFlexion].linkId = "mmt-elbow-flexion" (exactly)
* item[mmtUESection].item[elbowFlexion].text = "手肘屈曲"
* item[mmtUESection].item[elbowFlexion].answer 1..1
* item[mmtUESection].item[elbowFlexion].answer.value[x] only integer

// 手肘伸直
* item[mmtUESection].item[elbowExtension].linkId = "mmt-elbow-extension" (exactly)
* item[mmtUESection].item[elbowExtension].text = "手肘伸直"
* item[mmtUESection].item[elbowExtension].answer 1..1
* item[mmtUESection].item[elbowExtension].answer.value[x] only integer

// 手腕屈曲
* item[mmtUESection].item[wristFlexion].linkId = "mmt-wrist-flexion" (exactly)
* item[mmtUESection].item[wristFlexion].text = "手腕屈曲"
* item[mmtUESection].item[wristFlexion].answer 1..1
* item[mmtUESection].item[wristFlexion].answer.value[x] only integer

// 手腕伸直
* item[mmtUESection].item[wristExtension].linkId = "mmt-wrist-extension" (exactly)
* item[mmtUESection].item[wristExtension].text = "手腕伸直"
* item[mmtUESection].item[wristExtension].answer 1..1
* item[mmtUESection].item[wristExtension].answer.value[x] only integer

// 手指屈曲
* item[mmtUESection].item[fingerFlexion].linkId = "mmt-finger-flexion" (exactly)
* item[mmtUESection].item[fingerFlexion].text = "手指屈曲"
* item[mmtUESection].item[fingerFlexion].answer 1..1
* item[mmtUESection].item[fingerFlexion].answer.value[x] only integer

// 手指伸直
* item[mmtUESection].item[fingerExtension].linkId = "mmt-finger-extension" (exactly)
* item[mmtUESection].item[fingerExtension].text = "手指伸直"
* item[mmtUESection].item[fingerExtension].answer 1..1
* item[mmtUESection].item[fingerExtension].answer.value[x] only integer
