# {PROJECT_NAME}

{1-2 sentences: what the project is and what it is for.}

## How we run this project (structure awareness)

The project is run across multiple sessions with the lifecycle skill set. Every element has its place:
<!-- /kickoff: remove from the table and from the hierarchy any items that do not exist in the chosen profile (lite: no CLAUDE.md, adr, specs). -->

| Document | What for | When updated |
|---|---|---|
| `PROJECT_CONFIG.md` | parameters + sprint live state (hard numbers) | `/close`, `/handoff` |
| `docs/HANDOFF.md` | snapshot "where we are + next move" (thin) | `/handoff`, `/close` |
| `docs/ROADMAP.md` | work sequence "the sequence" (SSOT of order) | `/roadmap`, `/close` |
| `docs/LESSONS_CANON.md` | lessons canon (F foundational + W executional) | `/lesson` |
| `docs/adr/` | binding architectural decisions (1 file = 1 decision) | on decision |
| `docs/specs/` | specifications and sprint plans | on sprint |

**Source-of-truth hierarchy** (who wins a conflict): `CLAUDE.md` → `PROJECT_CONFIG.md` → `docs/adr/` →
`docs/specs/` → `docs/runbooks/` → code (items that exist in this profile). AI memory is not a source of
truth — it holds only pointers. A HANDOFF↔ROADMAP conflict = drift to report, not to silently
resolve (ad hoc: HANDOFF settles "the next move", ROADMAP — the order and position).

## Session loop

```
/start  →  work (+/handoff +/lesson when needed)  →  /close
```

Full structure map and foundational lessons: see `docs/LESSONS_CANON.md` (F1-F6).

## Status

{current stage — see ROADMAP + PROJECT_CONFIG}
