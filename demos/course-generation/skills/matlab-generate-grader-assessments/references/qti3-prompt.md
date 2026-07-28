# QTI 3 Export Prompt

This reference defines how to generate optional QTI 3 interchange files from generated MATLAB
Grader assessment item artifacts.

## Purpose

QTI 3 output is a companion interchange representation. It is for portability, review, and
future import/export workflows. It does not replace the native MATLAB Grader assessment item files and
does not imply that a generic QTI player can execute MATLAB code or MATLAB Grader assessment
tests.

## Package Shape

When QTI export is enabled, create the QTI 3 package inside the same assessment item folder
that contains the native MATLAB Grader files. The package contains one manifest file and
one item XML file.

For Object usage assessment items, `supporting_class.m` also lives at the assessment item folder root.
Use one QTI item XML file and one manifest file per assessment item folder.

## QTI Item System Prompt

```text
You are creating a QTI 3 interchange item for a MATLAB Grader assessment.

Return ONLY well-formed XML. Do not include markdown fences or explanatory text.

The QTI item must:
- Use a stable identifier based on {SNAKE_TITLE}.
- Use title="{TITLE}".
- Represent student work with qti-extended-text-interaction so the item can carry code-like text.
- Include the student-facing description in qti-item-body.
- Include the learner template in a visible preformatted block.
- Include the Function assessment item call block when present.
- Preserve the MATLAB Grader solution and tests as metadata/supporting content for future import.
- Include assessment item type, difficulty, learning objective, assessment purpose, and class assessment metadata.
- Include supporting class content for Object usage assessment items when present.
- Escape XML special characters correctly.
- Wrap MATLAB code and test content in CDATA sections where practical.
- Include qti-response-declaration and qti-outcome-declaration elements.
- Include qti-response-processing that sets a neutral default SCORE, because MATLAB execution
  and MATLAB Grader tests are not executable in generic QTI runtimes.

Use this XML structure:

<qti-assessment-item
    xmlns="http://www.imsglobal.org/xsd/imsqtiasi_v3p0"
    xmlns:mgg="https://www.mathworks.com/ns/matlab-grader-generator"
    identifier="item_{SNAKE_TITLE}"
    title="{TITLE}"
    adaptive="false"
    time-dependent="false">
  <qti-response-declaration identifier="RESPONSE" cardinality="single" base-type="string"/>
  <qti-outcome-declaration identifier="SCORE" cardinality="single" base-type="float">
    <qti-default-value>
      <qti-value>0</qti-value>
    </qti-default-value>
  </qti-outcome-declaration>
  <qti-item-body>
    <section class="matlab-grader-description">
      <h2>{TITLE}</h2>
      <pre><![CDATA[{DESCRIPTION}]]></pre>
    </section>
    <section class="matlab-grader-template">
      <h3>Learner Template</h3>
      <pre><![CDATA[{TEMPLATE}]]></pre>
    </section>
    <section class="matlab-grader-function-call">
      <h3>Code to Call Function</h3>
      <pre><![CDATA[{FUNCTION_CALL}]]></pre>
    </section>
    <p>Enter the completed MATLAB code for this assessment item.</p>
    <qti-extended-text-interaction response-identifier="RESPONSE" expected-lines="20"/>
  </qti-item-body>
  <qti-response-processing>
    <qti-set-outcome-value identifier="SCORE">
      <qti-base-value base-type="float">0</qti-base-value>
    </qti-set-outcome-value>
  </qti-response-processing>
  <qti-modal-feedback outcome-identifier="SCORE" identifier="MATLAB_GRADER_METADATA" show-hide="show">
    <mgg:metadata>
      <mgg:assessment-item-type>{ASSESSMENT_ITEM_TYPE}</mgg:assessment-item-type>
      <mgg:assessment-purpose>{ASSESSMENT_PURPOSE}</mgg:assessment-purpose>
      <mgg:difficulty>{DIFFICULTY}</mgg:difficulty>
      <mgg:learning-objective><![CDATA[{OBJECTIVE}]]></mgg:learning-objective>
      <mgg:class-assessment><![CDATA[{CLASS_ASSESSMENT}]]></mgg:class-assessment>
      <mgg:function-call><![CDATA[{FUNCTION_CALL}]]></mgg:function-call>
      <mgg:solution><![CDATA[{SOLUTION}]]></mgg:solution>
      <mgg:tests><![CDATA[{TESTS}]]></mgg:tests>
      <mgg:supporting-class><![CDATA[{SUPPORTING_CLASS}]]></mgg:supporting-class>
    </mgg:metadata>
  </qti-modal-feedback>
</qti-assessment-item>
```

If `{CLASS_ASSESSMENT}`, `{FUNCTION_CALL}`, or `{SUPPORTING_CLASS}` is not applicable, leave the
element present with empty CDATA.

## Manifest System Prompt

```text
You are creating a QTI 3 package manifest for MATLAB Grader interchange items.

Return ONLY well-formed XML. Do not include markdown fences or explanatory text.

Create an imsmanifest.xml file with:
- A stable manifest identifier.
- One resource for the item XML file in this assessment item folder.
- Resource identifiers derived from the item snake_case title.
- href values pointing to items/{snake_title}.xml.
- type="imsqti_item_xmlv3p0" for each item resource.
```

Manifest template:

```xml
<manifest xmlns="http://www.imsglobal.org/xsd/imscp_v1p1"
    identifier="manifest_matlab_grader_qti3">
  <metadata>
    <schema>QTI</schema>
    <schemaversion>3.0</schemaversion>
  </metadata>
  <resources>
    <resource identifier="res_{snake_title}" type="imsqti_item_xmlv3p0" href="items/{snake_title}.xml">
      <file href="items/{snake_title}.xml"/>
    </resource>
  </resources>
</manifest>
```

For multiple generated assessment items, create a separate `{snake_title}/qti3/imsmanifest.xml` in
each assessment item folder instead of creating one shared top-level manifest.

## XML Quality Rules

- XML must parse as well-formed XML.
- Do not include markdown fences.
- Preserve MATLAB code exactly inside CDATA where possible.
- Escape `]]>` inside generated CDATA content by splitting it as `]]]]><![CDATA[>`.
- Use UTF-8 text.
- Do not include local filesystem paths except package-relative item paths.
- Do not claim conformance beyond being a QTI 3-oriented interchange representation.
