# Description generation prompt

Write the student-facing description for a Script, Function, Class Definition, Class Inheritance, Object Usage, or Class Methods assessment item in two forms: a simplified `description.txt` fallback and a rich `description.html` browser-copy source. Include the learning task, exact required variables, function signature, class name, superclass relationship, method behavior, referenced-file assumptions, observable expected outcome, and only constraints that the learning objective explicitly requires.

Write all student-facing prose in the resolved content language from the course profile. If the profile uses `content_language: auto`, use the dominant language of the approved problem description or task statement. Preserve MATLAB identifiers, function signatures, class names, variable names, file names, and MATLAB keywords exactly.

For formative use, include a brief non-answer-revealing self-check. For summative use, include no hints, self-checks, suggested functions, solution approaches, or answer-revealing implementation guidance. If the learning objective explicitly requires a function, construct, or approach, state it directly as a numbered requirement rather than presenting it as a hint. Explain mixed use only when the profile purpose is `both`; keep its formative guidance distinct from hidden summative details. Put feedback for incorrect submissions in `assessments.md`, never in a summative description.

For learner-authored class submissions, state that the class definition must be written in a plain `.m` file, not a Live Script `.m` or `.mlx` file. For Object Usage items, state which class files are provided as referenced files and must not be redefined by the learner.

## `description.txt`

Use plain readable text only. Do not use Markdown backticks, fenced code blocks, raw HTML tags, Live Script `%[text]` markup, MathML, SVG, or other source markup. Keep identifiers and signatures visible as ordinary text.

## `description.html`

Create a self-contained HTML file that instructors open in a browser and copy into the MATLAB Grader Description and Instructions field.

- Include a button labeled `Copy Description for MATLAB Grader`.
- Put the rendered student description in one container, such as `<main id="grader-description">`.
- The button must copy only that description container, not the button or setup instructions.
- Use the Clipboard API to write `text/html` and `text/plain` when available. Build the `text/html` payload from a cloned description container after removing whitespace-only text nodes outside `pre`, `code`, and `textarea`; do not copy raw indented `innerHTML`, because MATLAB Grader may paste those whitespace nodes as extra blank lines and broken lists. For Clipboard API failures, populate a temporary hidden container with the same cleaned HTML, select that container, and invoke browser copy behavior.
- Use semantic HTML for headings, paragraphs, ordered and unordered lists, bold, italic, underline, inline monospace, hyperlinks, and code example boxes.
- Use inline LaTeX delimited with `$...$` for equations, such as `$a = \pi r^2$`.
- Do not use MathML, SVG equation images, or HTML `<sup>`/`<sub>` as the primary equation representation.
