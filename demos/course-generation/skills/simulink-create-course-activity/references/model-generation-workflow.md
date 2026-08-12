# Model Generation Workflow

Use this workflow to create the solution and starter `.slx` files for a
Simulink Exercise learning activity.

## Build Order

1. Build the solution model first.
2. Validate the solution topology and simulation behavior.
3. Copy the solution model to create the starter model.
4. Remove or replace only the learner-completed elements.
5. Validate the starter scaffold.

## MCP Tool Use

Use MATLAB MCP calls to create/open/save models and handle setup scripts:

```matlab
new_system(modelName);
open_system(modelName);
save_system(modelName, fullfile(activityFolder, modelFileName));
```

Use Simulink model tool calls through the MATLAB MCP Server for model structure:

- `model_overview` for high-level hierarchy and interfaces.
- `model_read` before and after edits to inspect topology and block behavior.
- `model_edit` for adding, connecting, deleting, replacing, or configuring
  blocks. Always include `layout_mode`.
- `model_query_params` for block, signal, and model configuration parameters.
- `model_resolve_params` for workspace variable references.

Follow these editing rules:

- Use `model_edit`, not ad hoc `add_block` or `set_param`, for structural edits
  when the MCP tool can do the job.
- If `model_edit` returns partial status, immediately inspect with `model_read`.
- Use one model scope per `model_edit` call.
- Use code-generation-safe names for blocks, signals, variables, and files.
- Put tunable parameters in an included init script or the model workspace.
- Keep activity-specific files in the activity folder.

## Starter Model Patterns

Choose one scaffold pattern:

- **Missing block:** Remove a block and leave named in/out signals or comments.
- **Incomplete subsystem:** Provide a subsystem shell with ports and comments.
- **Parameter completion:** Replace key parameter values with named variables or
  placeholders learners set.
- **Connection task:** Provide blocks but omit a small number of connections.
- **Experiment task:** Provide a complete model but require parameter sweeps and
  interpretation.

The starter model must open without missing dependencies. If a missing element
is intentional, document it in `activity.md`.

## Solution Model Requirements

The solution model must:

- Implement the intended behavior completely.
- Include required init scripts, data, or model workspace variables.
- Use stable signal names for validation.
- Save cleanly as `[activity-slug]_solution.slx`.
- Be inspectable with `model_read` or `model_overview`.
