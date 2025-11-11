Instance: TCTQuestionnaireInstance
InstanceOf: SPACQuestionnaire
Usage: #definition
Title: "Trunk Control Test (TCT) 評估量表"
Description: "軀幹控制測試，病患需接受四種姿勢測試，以評估軀幹控制功能"
// 基本欄位資訊
* url = "http://example.org/fhir/Questionnaire/TCTQuestionnaire"
* version = "1.0.0"
* status = #active
* date = "2025-11-10"
* publisher = "富伯生醫科技股份有限公司"
* purpose = "用於評估病患的軀幹功能狀況，協助臨床決策。"
* subjectType = #Patient

// 問卷內容
// ====項目1: 滾向弱側====
* item[0].linkId = "roll-to-weak-side"
* item[=].text = " 滾向弱側"
* item[=].type = #choice
* item[=].answerValueSet = Canonical(VSTCT)
// ====項目2: 滾向強側====
* item[+].linkId = "roll-to-strong-side"
* item[=].text = "滾向強側"
* item[=].type = #choice
* item[=].answerValueSet = Canonical(VSTCT)
// ====項目3: 從床邊緣將腳抬起來之平衡項目====
* item[+].linkId = "balance-sitting"
* item[=].text = "將雙腳從床邊緣抬起來至少30秒"
* item[=].type = #choice
* item[=].answerValueSet = Canonical(VSTCT)
// ====項目4: 從躺姿到坐姿====
* item[+].linkId = "sit-from-lying-down"
* item[=].text = "從躺姿移動到坐姿"
* item[=].type = #choice
* item[=].answerValueSet = Canonical(VSTCT)
// ====總分====
* item[+].linkId = "tct-total"
* item[=].text = "TCT 總分"
* item[=].type = #integer
* item[=].readOnly = true
* item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].extension[0].valueExpression.language = #text/fhirpath
* item[=].extension[0].valueExpression.expression =
    "item.where(linkId in ('roll-to-weak-side','roll-to-strong-side','balance-sitting','sit-from-lying-down'))
     .answer.valueCoding.code.toInteger().sum()"



