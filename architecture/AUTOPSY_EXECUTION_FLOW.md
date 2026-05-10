# Autopsy Execution Flow

START
↓
Create Run
↓
Freeze Question Set
↓
Present Questions
↓
Capture Answers
↓
Calculate Dimension Scores
↓
Determine Weakest Dimension
↓
Generate Verdict
↓
Generate Narrative Blocks
↓
Generate Worksheet
↓
Persist Completed Run
↓
Historical Comparison Layer

---

## Governance Rules

- run_questions is authoritative once frozen
- scoring must remain deterministic
- narratives derive from database state
- worksheet derives from verdict state
- front-end must not override canonical scoring
