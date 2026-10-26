Alias: $snomed = http://snomed.info/sct

// ARAT 上肢功能評估問卷
// ============================================
Instance: ARATQuestionnaireInstance
InstanceOf: SPACQuestionnaire
Usage: #definition
Title: "ARAT上肢功能評估問卷"
Description: "ARAT上肢功能評估問卷的完整實例，根據Yozbatiran, Der-Yeghiaian, and Cramer(2008)建立，可提供實際使用 。亦可依據Profile: QuestionnaireProfile內容做為範本進行擴充"

* name = "ARATQuestionnaire"
* title = "ARAT上肢功能評評估問卷"
* description = "ARAT上肢功能評評估問卷(Yozbatiran, Der-Yeghiaian, and Cramer, 2008)，分左右邊各57分"
* status = #active
* purpose = "提供標準化的上肢感覺評估工具，用於中風復健評估"
* subjectType = #Patient

// ============================================
// 變數定義 - 用於計算各分量表分數
// ============================================
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "graspScore"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%resource.descendants().where(linkId in ('a-block-10cm3' | 'a-block-2.5cm3' | 'a-block-5cm3' | 'a-block-7.5cm3' | 'a-cricket-ball' | 'a-sharpening-stone')).answer.value.sum()"

* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "gripScore"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%resource.descendants().where(linkId in ('b-pour-water-from-one-glass-to-another' | 'b-displace-2.25-cm-alloy-tube-from-one-side-oftable-to-the-other' | 'b-displace-1-cm-alloy-tube-from-one-side-of-table-to-the-other' | 'b-put-washer-over-bolt')).answer.value.sum()"

* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "pinchScore"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%resource.descendants().where(linkId in ('c-ball-bearing-held-between-ring-finger-and-thumb' | 'c-marble-held-between-index-finger-and-thumb' | 'c-ball-bearing-held-between-middle-finger-and-thumb' | 'c-ball-bearing-held-between-index-finger-and-thumb' | 'c-marble-held-between-ring-finger-and-thumb' | 'c-marble-held-between-middle-finger-and-thumb')).answer.value.sum()"

* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "movementScore"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%resource.descendants().where(linkId in ('d-hand-to-behind-the-head' | 'd-hand-to-top-ofhead' | 'd-hand-to-mouth')).answer.value.sum()"

// 選擇左、右手
* item[0].linkId = "assessment-side-arat"
* item[=].text = "請選擇評估側"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].valueCoding.system = $snomed 
* item[=].answerOption[=].valueCoding.code = $snomed#24028007
* item[=].answerOption[=].valueCoding.display = "Right"
* item[=].answerOption[+].valueCoding.system = $snomed
* item[=].answerOption[=].valueCoding.code = $snomed#7771000
* item[=].answerOption[=].valueCoding.display = "Left"

// Whether the selected assessment side is affected
* item[+].linkId = "assessment-side-affected-arat"
* item[=].text = "評估側是否為患側"
* item[=].type = #boolean
* item[=].required = true

// ============================================
// Section A：掌握分量表 (6個項目)
// ============================================
* item[+].linkId = "A-grasp-subscale"
* item[=].text = "A.抓力分量表"
* item[=].type = #group
* item[=].required = true

// A1. Block,10 cm3
* item[=].item[0].linkId = "A-I-block-10cm3"
* item[=].item[=].text = "方塊積木, 10 立方公分"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// A2. Block,2.5 cm3 
* item[=].item[+].linkId = "A-I-block-2.5cm3"
* item[=].item[=].text = "方塊積木, 2.5 立方公分"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// A3. Block,5 cm3 
* item[=].item[+].linkId = "A-I-block-5cm3"
* item[=].item[=].text = "方塊積木, 5 立方公分"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// A4. Block,7.5 cm3 
* item[=].item[+].linkId = "A-I-block-7.5cm3"
* item[=].item[=].text = "方塊積木, 7.5 立方公分"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// A5. Cricket ball 
* item[=].item[+].linkId = "A-I-cricket-ball"
* item[=].item[=].text = "板球"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// A6. Sharpening stone 
* item[=].item[+].linkId = "A-I-sharpening-stone"
* item[=].item[=].text = "磨刀石"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// A 分量表分數顯示
* item[=].item[+].linkId = "A-grasp-subscale-subscore"
* item[=].item[=].text = "A.抓力分數"
* item[=].item[=].type = #integer
* item[=].item[=].readOnly = true
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%graspScore"

// 轉換為Observation
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true

// ============================================
// Section B：握力分量表 (4個項目)
// ============================================
* item[+].linkId = "B-grip-subscale"
* item[=].text = "B.握力分量表"
* item[=].type = #group
* item[=].required = true

// B1. Pour water from one glass to another
* item[=].item[0].linkId = "B-I-pour-water-from-one-glass-to-another"
* item[=].item[=].text = "將水從一個杯子倒到另一個杯子"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// B2. Displace 2.25-cm alloy tube from one side oftable to the other 
* item[=].item[+].linkId = "B-I-displace-2.25-cm-alloy-tube-from-one-side-oftable-to-the-other"
* item[=].item[=].text = "將 2.25 公分合金管從桌子的一側移到另一側"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// B3. Displace 1-cm alloy tube from one side of table to the other
* item[=].item[+].linkId = "B-I-displace-1-cm-alloy-tube-from-one-side-of-table-to-the-other"
* item[=].item[=].text = "將 1 公分合金管從桌子的一側移到另一側"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// B4. Put washer over bolt
* item[=].item[+].linkId = "B-I-put-washer-over-bolt"
* item[=].item[=].text = "將墊圈放在螺栓上"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// B 分量表分數顯示
* item[=].item[+].linkId = "B-grip-subscale-subscore"
* item[=].item[=].text = "B.握力分數"
* item[=].item[=].type = #integer
* item[=].item[=].readOnly = true
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%gripScore"

// 轉換為Observation
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true

// ============================================
// Section C：捏量表 (6個項目)
// ============================================
* item[+].linkId = "C-pinch-subscale"
* item[=].text = "C.捏取分量表"
* item[=].type = #group
* item[=].required = true

// C1. Ball bearing,held between ring finger and thumb
* item[=].item[0].linkId = "C-I-ball-bearing-held-between-ring-finger-and-thumb"
* item[=].item[=].text = "滾珠軸承，握在無名指與大拇指之間"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// C2. Marble,held between index finger and thumb 
* item[=].item[+].linkId = "C-I-marble-held-between-index-finger-and-thumb"
* item[=].item[=].text = "大理石，握在食指與大拇指之間"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// C3. Ball bearing,held between middle finger and thumb
* item[=].item[+].linkId = "C-I-ball-bearing-held-between-middle-finger-and-thumb"
* item[=].item[=].text = "滾珠軸承，握在中指與拇指之間"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// C4. Ball bearing,held between index finger and thumb
* item[=].item[+].linkId = "C-I-ball-bearing-held-between-index-finger-and-thumb"
* item[=].item[=].text = "滾珠軸承，握在食指與拇指之間"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// C5. Marble,held between ring finger and thumb
* item[=].item[+].linkId = "C-I-marble-held-between-ring-finger-and-thumb"
* item[=].item[=].text = "大理石，握在無名指和大拇指之間"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// C6. Marble,held between middle finger and thumb
* item[=].item[+].linkId = "C-I-marble-held-between-middle-finger-and-thumb"
* item[=].item[=].text = "大理石，握在中指與大拇指之間"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// C 分量表分數顯示
* item[=].item[+].linkId = "C-pinch-subscale-subscore"
* item[=].item[=].text = "C.捏取分數"
* item[=].item[=].type = #integer
* item[=].item[=].readOnly = true
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%pinchScore"

// 轉換為Observation
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true

// ============================================
// Section D：大運動分量表 (3個項目)
// ============================================
* item[+].linkId = "D-gross-movement-subscale"
* item[=].text = "D.粗大動作分量表"
* item[=].type = #group
* item[=].required = true

// D1. Hand to behind the head
* item[=].item[0].linkId = "D-I-hand-to-behind-the-head"
* item[=].item[=].text = "手放在腦後"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// D2. Hand to top of head
* item[=].item[+].linkId = "D-I-hand-to-top-of-head"
* item[=].item[=].text = "手放在頭頂"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// D3. Hand to mouth
* item[=].item[+].linkId = "D-I-hand-to-mouth"
* item[=].item[=].text = "手到嘴"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[0].valueInteger = 0
* item[=].item[=].answerOption[+].valueInteger = 1
* item[=].item[=].answerOption[+].valueInteger = 2
* item[=].item[=].answerOption[+].valueInteger = 3
//* item[=].item[=].extension.url = "https://build.fhir.org/ig/Kimsber/Rehab-IG/StructureDefinition-test-time-extension"

// D 分量表分數顯示
* item[=].item[+].linkId = "D-gross-movement-subscale-subscore"
* item[=].item[=].text = "D.粗大動作分數"
* item[=].item[=].type = #integer
* item[=].item[=].readOnly = true
* item[=].item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%movementScore"

// 轉換為Observation
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].item[=].extension[=].valueBoolean = true

// ============================================
// Section E：總分計算
// ============================================
* item[+].linkId = "E-total-score-ARAT"
* item[=].text = "E.ARAT總分計算"
* item[=].type = #integer
* item[=].required = false
* item[=].readOnly = true
* item[=].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "%graspScore + %gripScore + %pinchScore + %movementScore"

// 轉換為Observation
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
* item[=].extension[=].valueBoolean = true

// SDC 4 requires versionAlgorithm when version is present.
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
* extension[=].valueCoding = http://hl7.org/fhir/version-algorithm#semver "SemVer"
