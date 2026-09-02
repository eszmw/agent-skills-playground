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
        "Class Definition" in generator_skill
        and "Class Inheritance" in generator_skill
        and "Object Usage" in generator_skill
        and "Class Methods" in generator_skill,
        "The generator must document class definition, inheritance, object usage, and method support.",
        errors,
    )
    require(
        "Do not preload references for later stages." in generator_skill,
        "The generator must retain staged reference loading.",
        errors,
    )
    require(
        "Class Definition" in adoption_skill
        and "Class Inheritance" in adoption_skill
        and "Object Usage" in adoption_skill
        and "Class Methods" in adoption_skill,
        "The adoption skill must recommend the supported class-related item modes.",
        errors,
    )
    require(
        "plain `.m` files" in generator_skill and "plain `.m`" in readme and "plain `.m`" in evals,
        "Classdef documentation must warn that learner-authored class definitions require plain .m files.",
        errors,
    )
    require(
        "Do not create `.p` files" in generator_skill
        and "does not create `.p` files" in readme
        and "does not create `.p` files" in evals,
        "Documentation must state that generated files remain readable and .p files are not created.",
        errors,
    )
    require(
        "referenced files" in generator_skill.lower()
        and "referenced file" in readme.lower()
        and "referenced file" in evals.lower(),
        "Referenced-file guidance must be documented.",
        errors,
    )
    require(
        "abstract" in generator_skill.lower() and "abstract" in evals.lower(),
        "Abstract class boundary and referenced-superclass support must be documented.",
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
