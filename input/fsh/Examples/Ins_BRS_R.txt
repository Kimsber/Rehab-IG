// ============================================
// BRS-A QuestionnaireResponse 實例範例
// ============================================
Instance: BRSArmQuestionnaireResponseExample
InstanceOf: BRSArmQuestionnaireResponse
Usage: #example
Title: "BRS-A問卷回覆範例"
Description: "一位中風患者進行手臂布朗斯壯動作分期（BRS-A）的完整問卷回覆範例，包含評估側、上肢近端與上肢遠端分期。"

* id = "brsa-response-example-001"
* questionnaire = Canonical(BRSArmQuestionnaireInstance)
* status = #completed
* subject = Reference(stroke-patient-001) "王小姐"
* authored = "2025-10-11T14:45:00+08:00"
* author = Reference(ot-therapist-001) "復健治療師 - 李小姐"

// ============================================
// 評估側別
// ============================================
* item[assessmentSide].linkId = "assessment-side-brs-a"
* item[assessmentSide].text = "患側手"
* item[assessmentSide].answer.valueCoding = http://snomed.info/sct#24028007 "Right"

// ============================================
// BRS-A
// ============================================
* item[brsASection].linkId = "brs-a"
* item[brsASection].text = "手臂布朗斯壯動作分期（Brunnstrom Recovery Stage of Arm, BRS-A）"

// 範例值：上肢近端 = 4
* item[brsASection].item[proximalUpperExtremity].linkId = "brs-a-proximal-upper-extremity"
* item[brsASection].item[proximalUpperExtremity].text = "上肢近端"
* item[brsASection].item[proximalUpperExtremity].answer.valueInteger = 4

// 範例值：上肢遠端 = 3
* item[brsASection].item[distalUpperExtremity].linkId = "brs-a-distal-upper-extremity"
* item[brsASection].item[distalUpperExtremity].text = "上肢遠端"
* item[brsASection].item[distalUpperExtremity].answer.valueInteger = 3
