---
"portone_flutter": minor
---

Android Gradle Plugin(AGP) 9 이상에서 발생하던 Android 빌드 오류를 수정합니다.

Kotlin Gradle Plugin을 직접 적용하지 않도록 변경하여 AGP 9의 built-in Kotlin(`android.builtInKotlin=true`)을 지원하고, 의존 플러그인(`app_links`)의 요구사항에 맞춰 Android `compileSdk`를 36으로 올렸습니다. 이에 따라 최소 요구사항이 Flutter 3.44 / Dart 3.12로 상향됩니다.
