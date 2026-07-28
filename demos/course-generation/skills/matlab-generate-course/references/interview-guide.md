# Instructor Interview Guide

Use this guide to collect enough information to generate a course package
without turning the interaction into a long survey. Ask only for missing
information.

## Minimal Interview

1. Course identity:
   - Course title
   - One-sentence course purpose
   - Department, program, or domain if relevant
2. Learners:
   - Audience level
   - Prior MATLAB experience
   - Prior Simulink or modeling experience
   - Math, programming, and domain prerequisites
3. Structure:
   - Total duration
   - Number of modules or weeks
   - Delivery mode
   - Expected weekly workload
4. Tools:
   - MATLAB topics and required toolboxes
   - Simulink topics and required products
   - MATLAB Online, desktop MATLAB, campus license, or other access model
5. Assessment:
   - Native MATLAB Exercises and Simulink Exercises
   - Formative versus summative emphasis
   - Need for auto-graded MATLAB Exercise checks or model-validation criteria
6. Persistence and package:
   - Persistence target, defaulting to generic Common Cartridge
   - Whether future MATLAB Course Designer API creation is a requirement
   - Any downstream LMS import target, if relevant
   - Import constraints, naming conventions, or institutional templates
7. Course policies:
   - Accessibility needs
   - Academic integrity expectations
   - Collaboration policy
   - Required review or approval workflow
8. Output:
   - Output directory
   - Whether to generate a quick prototype or review-ready course package

## Defaults

Use these defaults when the user does not specify:

- Delivery mode: hybrid-ready, with online course pages and lab activities.
- Persistence target: generic IMS Common Cartridge for MATLAB Course Designer
  review.
- Assessment purpose: mixed formative practice and summative-ready grading.
- Review depth: run quality, accessibility, and red-team reviews before final
  export when feasible.
- Output directory: current working directory.

## Interview Style

Start with a compact summary of what you know. Ask follow-ups in small batches
of at most five questions. If the user provides a syllabus or module list,
extract course structure from it and ask only about gaps.

When constraints conflict, resolve them explicitly. Example: if the instructor
wants a two-week self-paced course with a major Simulink project, recommend a
smaller model-building milestone or a provided starter model.
