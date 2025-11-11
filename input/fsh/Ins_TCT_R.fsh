Instance: TCTQuestionnaireResponseInstance
InstanceOf: SPACQuestionnaireResponse
Usage: #example
Title: "Trunk Control Test (TCT) 評估量表問卷回覆"
Description: "Trunk Control Test (TCT) 評估量表問卷回覆範例"
* questionnaire = Canonical(TCTQuestionnaireInstance)
* status = #completed
* subject = Reference(Patient/PatientExample) 
* authored = "2025-11-10"
// ====項目1: 滾向弱側答案====
* item[0].linkId = "roll-to-weak-side"
* item[=].text = " 滾向弱側"
* item[=].answer[0].valueCoding = CSTCT#12
// ====項目2: 滾向強側答案====
* item[+].linkId = "roll-to-strong-side"
* item[=].text = "滾向強側"
* item[=].answer[0].valueCoding = CSTCT#25
// ====項目3: 從床邊緣將腳抬起來之平衡項目答案====
* item[+].linkId = "balance-sitting"
* item[=].text = "將雙腳從床邊緣抬起來至少30秒"
* item[=].answer[0].valueCoding = CSTCT#0
// ====項目4: 從躺姿到坐姿答案====
* item[+].linkId = "sit-from-lying-down"
* item[=].text = "從躺姿移動到坐姿"
* item[=].answer[0].valueCoding = CSTCT#12
// ====總分====
* item[+].linkId = "tct-total"
* item[=].text = "D.FMAUE動作總分"
* item[=].answer[0].valueInteger = 49


