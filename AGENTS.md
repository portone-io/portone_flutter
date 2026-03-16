# Repository Guidelines

## Project Structure & Module Organization
This repository is a Flutter plugin package.

- `lib/`: public plugin API, payment/certification widgets, and data models (`lib/model/**`).
- `android/` and `ios/`: native plugin bridge implementations.
- `assets/`: package assets shipped with the plugin.
- `example/`: runnable sample app demonstrating integration (`example/lib/**`) and widget tests (`example/test/**`).
- `build.yaml` + `*.g.dart`: `json_serializable` code generation settings and outputs.

Keep plugin code in `lib/` framework-agnostic, and validate native changes in both platform folders when behavior touches app launch, deep links, or WebView handling.

## Build, Test, and Development Commands
Run commands from the repository root unless noted.

- `flutter pub get`: install plugin dependencies.
- `flutter analyze`: static analysis for plugin and example.
- `dart format .`: format Dart sources.
- `dart run build_runner build --delete-conflicting-outputs`: regenerate JSON serialization files.
- `flutter test example/test`: run current test suite (example app widget tests).
- `cd example && flutter run`: launch the sample app for manual payment/certification flow checks.

## Coding Style & Naming Conventions
Use standard Dart style: 2-space indentation, trailing commas where helpful, and idiomatic null-safety.

- Types/classes: `PascalCase` (e.g., `PaymentData`).
- Methods/variables/params: `lowerCamelCase`.
- Files/directories: `snake_case` for new files (preserve legacy public filenames as-is for compatibility).
- Never hand-edit generated `*.g.dart` files; update source models and regenerate.

## Testing Guidelines
Use `flutter_test` for widget-level behavior in `example/test/` and add package tests under a root `test/` folder for pure Dart logic when introduced.

- Test file names: `<feature>_test.dart`.
- Focus on serialization correctness, callback contract changes, and platform-conditional branches.
- For payment/auth flow changes, include manual verification notes for both Android and iOS in the PR.

## Commit & Pull Request Guidelines
History favors concise, typed subjects. Prefer:

- `<type>: <summary>` (e.g., `feat: add tier code`, `fix: update example build`).
- Optional issue/PR suffix: `(#154)`.

For PRs, include:

- clear problem/solution summary,
- impacted area (`lib`, `android`, `ios`, `example`),
- test evidence (`flutter analyze`, `flutter test example/test`, manual platform checks),
- doc updates (`README.md`, `CHANGELOG.md`) when public behavior or API changes.
