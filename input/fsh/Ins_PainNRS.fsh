Alias: $SCT = http://snomed.info/sct
Instance: PainNRSQuestionnaireInstance
InstanceOf: SPACQuestionnaire
Usage: #definition
Title: "Pain Numeric Rating Scale (NRS) 評估量表問卷"
Description: "Pain NRS 評估量表問卷，用於評估患者的疼痛強度。"
* version = "1.0.0"
* status = #active

// ====評估內容: 疼痛強度評分====
// ====部位:Shoulder====
* item[0].linkId = "pain-nrs-shoulder"
* item[=].text = "肩膀"
* item[=].code = $SCT#91775009
* item[=].type = #choice
* item[=].answerValueSet = Canonical(VSPainNRS)
// ====部位:Elbow====
* item[+].linkId = "pain-nrs-elbow"
* item[=].text = "手肘"
* item[=].code = $SCT#127949000
* item[=].type = #choice
* item[=].answerValueSet = Canonical(VSPainNRS)
// ====部位: Wrist====
* item[+].linkId = "pain-nrs-wrist"
* item[=].text = "手腕"
* item[=].code = $SCT#8205005
* item[=].type = #choice
* item[=].answerValueSet = Canonical(VSPainNRS)
