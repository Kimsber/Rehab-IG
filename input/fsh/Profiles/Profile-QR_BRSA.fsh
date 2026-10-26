// ============================================
// BRS-A QuestionnaireResponse Profile
// ============================================
Profile: BRSArmQuestionnaireResponse
Parent: SPACQuestionnaireResponse
Id: BRSArmQuestionnaireResponse
Title: "手臂布朗斯壯動作分期（BRS-A）問卷回覆"
Description: "針對手臂布朗斯壯動作分期（BRS-A）問卷的 QuestionnaireResponse Profile，強制回傳格式符合問卷結構。"

// 固定問卷參考
* questionnaire = Canonical(BRSArmQuestionnaireInstance) (exactly)

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
* item ^slicing.description = "根據 linkId 區分 BRS-A 問卷的主要區塊"

* item contains
    assessmentSide 1..1 MS and
    brsASection 1..1 MS

// ============================================
// 評估側別
// ============================================
* item[assessmentSide].linkId = "assessment-side-brs-a" (exactly)
* item[assessmentSide].text = "患側手"
* item[assessmentSide].answer 1..1
* item[assessmentSide].answer.value[x] only Coding
* item[assessmentSide].answer.valueCoding from AssessmentSideValueSet (required)

// ============================================
// BRS-A Section
// ============================================
* item[brsASection].linkId = "brs-a" (exactly)
* item[brsASection].text = "手臂布朗斯壯動作分期（Brunnstrom Recovery Stage of Arm, BRS-A）"
* item[brsASection].answer 0..0

// ============================================
// BRS-A 子項目 slicing
// ============================================
* item[brsASection].item.linkId 1..1 MS
* item[brsASection].item.text 0..1 MS
* item[brsASection].item.answer 0..* MS

* item[brsASection].item ^slicing.discriminator.type = #value
* item[brsASection].item ^slicing.discriminator.path = "linkId"
* item[brsASection].item ^slicing.rules = #closed
* item[brsASection].item ^slicing.ordered = false
* item[brsASection].item ^slicing.description = "根據 linkId 區分 BRS-A 上肢近端與上肢遠端分期"

* item[brsASection].item contains
    proximalUpperExtremity 1..1 MS and
    distalUpperExtremity 1..1 MS

// 上肢近端
* item[brsASection].item[proximalUpperExtremity].linkId = "brs-a-proximal-upper-extremity" (exactly)
* item[brsASection].item[proximalUpperExtremity].text = "上肢近端"
* item[brsASection].item[proximalUpperExtremity].answer 1..1
* item[brsASection].item[proximalUpperExtremity].answer.value[x] only integer

// 上肢遠端
* item[brsASection].item[distalUpperExtremity].linkId = "brs-a-distal-upper-extremity" (exactly)
* item[brsASection].item[distalUpperExtremity].text = "上肢遠端"
* item[brsASection].item[distalUpperExtremity].answer 1..1
* item[brsASection].item[distalUpperExtremity].answer.value[x] only integer
