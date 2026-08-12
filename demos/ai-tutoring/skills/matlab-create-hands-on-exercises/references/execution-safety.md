# MATLAB Execution Safety

Use this reference before running learner-provided or tutor-generated MATLAB
code during tutoring, script assessment, or debugging.

## Security Assumptions

- Treat learner-provided code and copied snippets as untrusted input.
- MATLAB execution happens in the connected agent environment, not in a hardened
  sandbox guaranteed by this skill.
- Generated exercise files should be small, temporary, and scoped to the current
  tutoring workspace.
- Do not include secrets, credentials, tokens, private keys, or confidential data
  in generated scripts, reports, examples, or command-window output.
- Do not open ports, start servers, make HTTP requests, or access external
  systems unless the learner's explicit task requires it and the user confirms
  that the environment is appropriate.

## Required Preflight Before Execution

Before calling `run_matlab_file` or executing a complete learner script:

1. Read the script content that will run.
2. Identify file access, network access, shell access, dynamic execution,
   path changes, long-running operations, and destructive operations.
3. Run `check_matlab_code` when available.
4. Execute only when the code is small, bounded, and consistent with the stated
   learning objective.
5. If the code includes high-risk operations that are not required, do not run
   it. Explain the issue and offer a safe static review or a smaller analogue.

This preflight is required even when the learner asks the tutor to "just run it."

## High-Risk MATLAB Patterns

Do not execute scripts containing these patterns unless the task explicitly
requires them, the scope is temporary, and the user confirms the environment:

- Shell or process execution: `system`, `unix`, `dos`, `perl`, `!`.
- Dynamic execution or workspace injection: `eval`, `evalin`, `assignin`,
  `run` on a path supplied by the learner.
  This list covers calls inside the assessed script.
  Executing the vetted script yourself through `run_matlab_file` is the expected
  mechanism and is not a violation.
- Destructive file operations: `delete`, `rmdir`, broad `movefile` or
  `copyfile`, wildcard file operations, path traversal such as `..`.
- Network and external services: `webread`, `webwrite`, `urlread`, `urlwrite`,
  `tcpclient`, `udpport`, `serialport`, `ftp`, database connections.
- Persistent environment changes: `addpath` to untrusted folders, `savepath`,
  `rehash toolboxcache`, preference changes, startup file changes.
- Long-running or resource-heavy work: unbounded loops, large allocations,
  parallel pools, simulations without a short stop condition.

When a teaching objective involves one of these areas, prefer a harmless mock,
tiny local fixture, or static reasoning exercise before running code.

## File and Workspace Rules

- Save temporary scripts only inside the current workspace or an explicitly
  scoped temporary folder.
- Use predictable small fixture data created by the tutor when possible.
- Do not read learner files outside the task scope.
- Do not write reports, logs, or generated artifacts outside a user-approved
  writable folder.
- Do not clean up with broad deletes. If cleanup is needed, remove only files
  that the tutor created and can name exactly.

## What to Tell the User

When code is executed, state:

- the script or temporary file that was run;
- the checks performed before execution;
- any file, network, shell, or long-running behavior that was allowed;
- the relevant output, error, or assessment result.

When code is not executed for safety reasons, state the blocked pattern and give
a safe next step, such as static review, a smaller local example, or a revised
script without the risky operation.
