# MATLAB Grader assessment setup

Configure these eight assessments in MATLAB Grader. No MATLAB Code assessment is required, so this item has no `tests.m`.

| Requirement / LO evidence | Grader Test Type | MATLAB Grader UI fields | Code to paste | Expected evidence | Optional feedback on incorrect submission | Traceability |
| --- | --- | --- | --- | --- | --- |
| Compute overflow from the largest finite double | Variable equals reference solution | Variable name: `overflowResult` | Not applicable | Matches the reference `Inf` value | — | LO: interpret special numeric values |
| Compute infinity subtraction | Variable equals reference solution | Variable name: `infinityDifference` | Not applicable | Matches the reference `NaN` value | Check the special-value result of infinity subtraction. | LO: interpret special numeric values |
| Compute zero-times-infinity | Variable equals reference solution | Variable name: `zeroTimesInfinity` | Not applicable | Matches the reference `NaN` value | Check the special-value result of zero-times-infinity. | LO: interpret special numeric values |
| Report the overflow classification | Variable equals reference solution | Variable name: `overflowIsInfinite` | Not applicable | Matches the reference logical scalar | Check the classification assigned to the overflow result. | LO: classify `Inf` |
| Report the infinity-subtraction classification | Variable equals reference solution | Variable name: `differenceIsNaN` | Not applicable | Matches the reference logical scalar | — | LO: classify `NaN` |
| Report the zero-times-infinity classification | Variable equals reference solution | Variable name: `productIsNaN` | Not applicable | Matches the reference logical scalar | — | LO: classify `NaN` |
| Classify results with `isinf` | Function or Keyword is present | Function or keyword: `isinf` | Not applicable | Student code includes `isinf` | — | LO: classify `Inf` |
| Classify results with `isnan` | Function or Keyword is present | Function or keyword: `isnan` | Not applicable | Student code includes `isnan` | — | LO: classify `NaN` |

The six direct-reference checks evaluate the arithmetic outcomes and reported classifications. The construct-presence checks are included because the objective explicitly requires classifications with `isinf` and `isnan`.
