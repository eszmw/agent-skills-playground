"""Check local MATLAB Grader skill consistency without requiring MATLAB."""

from __future__ import annotations

from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]
CANONICAL_SKILLS = ROOT / "skills"
INSTALLED_SKILLS = ROOT / ".agents" / "skills"


def normalized_text(path: Path) -> str:
    return path.read_text(encoding="utf-8").replace("\r\n", "\n")


def require(condition: bool, message: str, errors: list[str]) -> None:
    if not condition:
        errors.append(message)


def main() -> int:
    errors: list[str] = []
    canonical_files = {
        path.relative_to(CANONICAL_SKILLS)
        for path in CANONICAL_SKILLS.rglob("*")
        if path.is_file()
    }
    installed_files = {
        path.relative_to(INSTALLED_SKILLS)
        for path in INSTALLED_SKILLS.rglob("*")
        if path.is_file()
    }

    require(
        canonical_files == installed_files,
        "The canonical and installed skill trees do not contain the same files.",
        errors,
    )
    for relative_path in sorted(canonical_files & installed_files):
        require(
            normalized_text(CANONICAL_SKILLS / relative_path)
            == normalized_text(INSTALLED_SKILLS / relative_path),
            f"Source/install drift: {relative_path}",
            errors,
        )

    generator_skill = normalized_text(
        CANONICAL_SKILLS / "matlab-generate-grader-assessments" / "SKILL.md"
    )
    adoption_skill = normalized_text(
        CANONICAL_SKILLS / "matlab-plan-grader-adoption" / "SKILL.md"
    )
    readme = normalized_text(ROOT / "README.md")
    evals = normalized_text(ROOT / "evals" / "README.md")

    require(
        "supports only **Script** and **Function** submissions" in generator_skill,
        "The generator scope must remain Script and Function only.",
        errors,
    )
    require(
        "Do not preload references for later stages." in generator_skill,
        "The generator must retain staged reference loading.",
        errors,
    )
    require(
        "Script or Function" in adoption_skill,
        "The adoption skill must recommend only Script or Function items.",
        errors,
    )
    require(
        "unsupported Class or Object-usage generation" in adoption_skill,
        "The adoption skill must reject unsupported item types.",
        errors,
    )
    require(
        "reference.<functionName>" in readme and "reference.<functionName>" in evals,
        "Public documentation and evals must describe Function reference calls.",
        errors,
    )

    if errors:
        print("\n".join(f"ERROR: {error}" for error in errors))
        return 1

    print("Skill layout validation passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
