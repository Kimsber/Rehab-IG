
// ============================================
// ARAT QuestionnaireResponse Profile
// ============================================
Profile: ARATQuestionnaireResponse
Parent: SPACQuestionnaireResponse
Id: ARATQuestionnaireResponse
Title: "ARAT上肢功能評估問卷回覆"
Description: "針對ARAT上肢功能評估問卷的QuestionnaireResponse Profile，強制回傳格式符合問卷結構"

// 固定問卷參考
* questionnaire = Canonical(ARATQuestionnaireInstance) (exactly)

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
* item ^slicing.description = "根據linkId區分ARAT問卷的主要區塊"

* item contains
    assessmentSide 1..1 MS and
    assessmentSideAffected 1..1 MS and
    graspSubscale 1..1 MS and
    gripSubscale 1..1 MS and
    pinchSubscale 1..1 MS and
    grossMovementSubscale 1..1 MS and
    totalScoreSection 1..1 MS

// ============================================
// 評估側別選擇
// ============================================
* item[assessmentSide].linkId = "assessment-side-arat" (exactly)
* item[assessmentSide].text = "請選擇評估側"
* item[assessmentSide].answer 1..1
* item[assessmentSide].answer.value[x] only Coding
* item[assessmentSide].answer.valueCoding from AssessmentSideValueSet (required)

* item[assessmentSideAffected].linkId = "assessment-side-affected-arat" (exactly)
* item[assessmentSideAffected].text = "評估側是否為患側"
* item[assessmentSideAffected].answer 1..1
* item[assessmentSideAffected].answer.value[x] only boolean

// ============================================
// Section A+B+C+D
// ============================================
* item[graspSubscale].linkId = "A-grasp-subscale" 
* item[graspSubscale].text = "A.抓力分量表"
* item[gripSubscale].linkId = "B-grip-subscale"
* item[gripSubscale].text = "B.握力分量表"
* item[pinchSubscale].linkId = "C-pinch-subscale"
* item[pinchSubscale].text = "C.捏取分量表"
* item[grossMovementSubscale].linkId = "D-gross-movement-subscale"
* item[grossMovementSubscale].text = "D.粗大動作分量表"
* item[totalScoreSection].linkId = "E-total-score-ARAT" (exactly)
* item[totalScoreSection].text = "E.ARAT總分計算"


// ============================================
// 限制各section 只能填整數integer
// ============================================
* item[graspSubscale].item.answer.value[x] only integer
* item[gripSubscale].item.answer.value[x] only integer
* item[pinchSubscale].item.answer.value[x] only integer
* item[grossMovementSubscale].item.answer.value[x] only integer
* item[totalScoreSection].item.answer.value[x] only integer



// ============================================
// ValueSet 定義
// ============================================
ValueSet: AssessmentSideValueSet
Id: assessment-side-valueset
Title: "評估側別選項"
Description: "受試者評估側別選項"
* $SCT#24028007 "患者右側"
* $SCT#7771000 "患者左側"
