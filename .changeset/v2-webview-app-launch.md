---
"portone_flutter": patch
---

V2 결제/본인인증 웹뷰에서 외부 앱(카드사·ISP 등)이 실행되지 않던 문제를 수정합니다.

Android 11(API 30) 이상에서 `canLaunchUrl`이 앱 설치 여부와 무관하게 false를 반환하여 외부 앱이 열리지 않던 문제를 해결하고, 앱 미설치 시 마켓(스토어)으로 이동하는 fallback을 추가했습니다. 또한 intent:// URL 파싱을 보강하여 `#Intent;` 파라미터가 없는 URL 등 예외적인 입력에서도 오류가 발생하지 않도록 했습니다.
