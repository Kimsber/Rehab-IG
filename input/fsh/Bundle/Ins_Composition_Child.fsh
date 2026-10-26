RuleSet: CompositionNarrative(compositionTitle, compositionStatus, compDate)
* text.status = #generated
* text.div = """<div xmlns="http://www.w3.org/1999/xhtml">
  <h2><b>{compositionTitle}</b></h2>
  <p><b>狀態：</b> {compositionStatus}</p>
  <p><b>日期：</b> {compDate}</p>
  <p><b>臨床意義：</b> 本文件包含病人的醫療紀錄、診斷及用藥資訊</p>
</div>"""

Instance: ChildDocumentComposition
InstanceOf: TWCoreComposition
Usage: #inline
Title: "兒童職能治療臨床文件"
Description: "顯示臨床文件(Composition)實際範例"
* status = #final
* type = $loinc#100495-1 //Occupational Therapy Outpatient progress note 
* category = $loinc#47039-3
* subject = Reference(PatientExample)
* date = "2025-12-26T10:30:00Z"
* author = Reference(ot-therapist-001)
* title = "兒童職能治療接案紀錄範本"

* confidentiality = #R
* attester.mode = #personal
* attester.time = "2023-09-10T11:00:00Z"
* attester.party = Reference(ot-therapist-001)
* custodian = Reference(OrganizationExample)
* event.period.start = "2025-12-26T10:30:00Z"
* event.period.end = "2025-12-26T13:30:00Z"
* section.entry[0] = Reference(PractitionerExample)
* section.entry[+] = Reference(ConditionExample01)
* section.entry[+] = Reference(CarePlanExample01)
* insert CompositionNarrative("張先生的病摘", "最終版", "2025-12-26")
