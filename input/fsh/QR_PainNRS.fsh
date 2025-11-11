Profile: PainNRSQuestionnaireResponse
Parent: SPACQuestionnaireResponse
Title: "Pain NRS 問卷回覆profile"
Description: "Pain NRS 問卷回覆，用於記錄患者的疼痛強度評分。"
* status = #completed
* subject 1..1
* subject only Reference(Patient)
* authored 1..1
* questionnaire = Canonical(PainNRSQuestionnaireInstance) (exactly)

