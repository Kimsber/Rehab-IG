// ============================================
// TCT QuestionnaireResponse Profile
// ============================================
Profile: TCTQuestionnaireResponse
Parent: SPACQuestionnaireResponse
Title: "Trunk Control Test (TCT) 評估量表profile"
Description: "軀幹控制測試問卷回應，用於記錄病患在TCT評估中的表現結果。"
* status = #completed
* subject 1..1
* subject only Reference(Patient)
* authored 1..1

// 每題都要有一個答案，答案型別限定為 Coding，並綁定到 TCT 分數值集
* item.answer 1..1 MS
* item.answer.value[x] only Coding
* item.answer.valueCoding from VSTCT (required)
