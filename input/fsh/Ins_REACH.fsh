Instance: REACHQuestionnaireInstance
InstanceOf: SPACQuestionnaire
Usage: #definition
Title: "Rating of Everyday Arm-use in the Community and at Home (REACH)評估量表"
Description: "REACH評估量表用於評估病患在日常生活中使用上肢的頻率與能力。"
* status = #active
* subjectType = #Patient
* date = "2025-11-10"
* publisher = "富伯生醫科技股份有限公司"
* purpose = "評估病患在日常生活中使用上肢的頻率與能力，協助臨床決策。"

// 選擇左、右手
* item[0].linkId = "reach-side"
* item[=].text = "請選擇評估側"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].valueCoding.system = $snomed
* item[=].answerOption[=].valueCoding.code = $snomed#24028007
* item[=].answerOption[=].valueCoding.display = "患者左側"
* item[=].answerOption[+].valueCoding.system = $snomed
* item[=].answerOption[=].valueCoding.code = $snomed#7771000
* item[=].answerOption[=].valueCoding.display = "患者右側"


// 2️⃣ 左手評估(啟用條件: 選擇左手)
* item[+].linkId = "reach-left"
* item[=].text = "左上肢 REACH 評分"
* item[=].type = #choice
* item[=].enableWhen[0].question = "reach-side"
* item[=].enableWhen[0].operator = #=
* item[=].enableWhen[0].answerCoding.code = $snomed#24028007
* item[=].answerValueSet = Canonical(VSReach)

// 3️⃣ 右手評估(啟用條件: 選擇右手)
* item[+].linkId = "reach-right"
* item[=].text = "右上肢 REACH 評分"
* item[=].type = #choice
* item[=].enableWhen[0].question = "reach-side"
* item[=].enableWhen[0].operator = #=
* item[=].enableWhen[0].answerCoding.code = $snomed#7771000
* item[=].answerValueSet = Canonical(VSReach)


