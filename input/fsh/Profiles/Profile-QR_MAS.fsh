// ============================================
// MAS QuestionnaireResponse Profile
// Updated to match Ins_MAS_updated.fsh
// ============================================

Profile: MASQuestionnaireResponse
Parent: SPACQuestionnaireResponse
Id: MASQuestionnaireResponse
Title: "MAS 量表問卷回覆"
Description: "Modified Ashworth Scale (MAS) 評估量表問卷回覆；結構對應 MASQuestionnaireInstance。"

// 固定問卷參考
* questionnaire = Canonical(MASQuestionnaireInstance) (exactly)

// 基本欄位
* status = #completed (exactly)
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
* item ^slicing.description = "根據 linkId 區分 MAS 問卷的評估側與 MAS 評估區塊"

* item contains
    assessmentSide 1..1 MS and
    masSection 1..1 MS

// ============================================
// 評估側別
// ============================================
* item[assessmentSide].linkId = "assessment-side-mas" (exactly)
* item[assessmentSide].text = "患側手"
* item[assessmentSide].answer 1..1
* item[assessmentSide].answer.value[x] only Coding
* item[assessmentSide].answer.valueCoding from AssessmentSideValueSet (required)

// ============================================
// MAS 區塊
// ============================================
* item[masSection].linkId = "mas" (exactly)
* item[masSection].text = "修正式艾許瓦式量表(MAS)"
* item[masSection].answer 0..0

// ============================================
// MAS 子項目 slicing
// ============================================
* item[masSection].item.linkId 1..1 MS
* item[masSection].item.text 0..1 MS
* item[masSection].item.answer 0..* MS

* item[masSection].item ^slicing.discriminator.type = #value
* item[masSection].item ^slicing.discriminator.path = "linkId"
* item[masSection].item ^slicing.rules = #closed
* item[masSection].item ^slicing.ordered = false
* item[masSection].item ^slicing.description = "根據 linkId 區分醫師評估表中的 10 個 MAS 評估項目"

* item[masSection].item contains
    shoulderF 1..1 MS and
    shoulderAB 1..1 MS and
    shoulderER 1..1 MS and
    shoulderIR 1..1 MS and
    elbowF 1..1 MS and
    elbowE 1..1 MS and
    elbowP 1..1 MS and
    elbowS 1..1 MS and
    fingerF 1..1 MS and
    fingerE 1..1 MS

// 肩-F
* item[masSection].item[shoulderF].linkId = "mas-shoulder-f" (exactly)
* item[masSection].item[shoulderF].text = "肩-F"
* item[masSection].item[shoulderF].answer 1..1 MS
* item[masSection].item[shoulderF].answer.value[x] only Coding
* item[masSection].item[shoulderF].answer.valueCoding from VSMAScore (required)

// 肩-AB
* item[masSection].item[shoulderAB].linkId = "mas-shoulder-ab" (exactly)
* item[masSection].item[shoulderAB].text = "肩-AB"
* item[masSection].item[shoulderAB].answer 1..1 MS
* item[masSection].item[shoulderAB].answer.value[x] only Coding
* item[masSection].item[shoulderAB].answer.valueCoding from VSMAScore (required)

// 肩-ER
* item[masSection].item[shoulderER].linkId = "mas-shoulder-er" (exactly)
* item[masSection].item[shoulderER].text = "肩-ER"
* item[masSection].item[shoulderER].answer 1..1 MS
* item[masSection].item[shoulderER].answer.value[x] only Coding
* item[masSection].item[shoulderER].answer.valueCoding from VSMAScore (required)

// 肩-IR
* item[masSection].item[shoulderIR].linkId = "mas-shoulder-ir" (exactly)
* item[masSection].item[shoulderIR].text = "肩-IR"
* item[masSection].item[shoulderIR].answer 1..1 MS
* item[masSection].item[shoulderIR].answer.value[x] only Coding
* item[masSection].item[shoulderIR].answer.valueCoding from VSMAScore (required)

// 肘-F
* item[masSection].item[elbowF].linkId = "mas-elbow-f" (exactly)
* item[masSection].item[elbowF].text = "肘-F"
* item[masSection].item[elbowF].answer 1..1 MS
* item[masSection].item[elbowF].answer.value[x] only Coding
* item[masSection].item[elbowF].answer.valueCoding from VSMAScore (required)

// 肘-E
* item[masSection].item[elbowE].linkId = "mas-elbow-e" (exactly)
* item[masSection].item[elbowE].text = "肘-E"
* item[masSection].item[elbowE].answer 1..1 MS
* item[masSection].item[elbowE].answer.value[x] only Coding
* item[masSection].item[elbowE].answer.valueCoding from VSMAScore (required)

// 肘-P
* item[masSection].item[elbowP].linkId = "mas-elbow-p" (exactly)
* item[masSection].item[elbowP].text = "肘-P"
* item[masSection].item[elbowP].answer 1..1 MS
* item[masSection].item[elbowP].answer.value[x] only Coding
* item[masSection].item[elbowP].answer.valueCoding from VSMAScore (required)

// 肘-S
* item[masSection].item[elbowS].linkId = "mas-elbow-s" (exactly)
* item[masSection].item[elbowS].text = "肘-S"
* item[masSection].item[elbowS].answer 1..1 MS
* item[masSection].item[elbowS].answer.value[x] only Coding
* item[masSection].item[elbowS].answer.valueCoding from VSMAScore (required)

// 指-F
* item[masSection].item[fingerF].linkId = "mas-finger-f" (exactly)
* item[masSection].item[fingerF].text = "指-F"
* item[masSection].item[fingerF].answer 1..1 MS
* item[masSection].item[fingerF].answer.value[x] only Coding
* item[masSection].item[fingerF].answer.valueCoding from VSMAScore (required)

// 指-E
* item[masSection].item[fingerE].linkId = "mas-finger-e" (exactly)
* item[masSection].item[fingerE].text = "指-E"
* item[masSection].item[fingerE].answer 1..1 MS
* item[masSection].item[fingerE].answer.value[x] only Coding
* item[masSection].item[fingerE].answer.valueCoding from VSMAScore (required)
