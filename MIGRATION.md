# portone_flutter v1.0.0 마이그레이션 가이드

이 문서는 `portone_flutter 0.12.x` 사용자가 `1.0.0`으로 업그레이드할 때 필요한 변경사항을 정리합니다.

## 1. SDK 요구사항 변경 (Breaking)

`1.0.0`부터 최소 요구사항이 상향되었습니다.

- Dart: `^3.10.0`
- Flutter: `>=3.38.1`

`pubspec.yaml`의 `environment`를 아래와 같이 맞춰주세요.

```yaml
environment:
  sdk: ^3.10.0
  flutter: ">=3.38.1"
```

## 2. V1 import 경로 변경 (Breaking)

기존 루트 경로의 V1 파일(`lib/iamport_*.dart`)은 제거되었습니다.
V1 API를 계속 사용할 경우 import 경로를 `v1/` 하위 경로로 변경해야 합니다.

### before

```dart
import 'package:portone_flutter/iamport_payment.dart';
import 'package:portone_flutter/iamport_certification.dart';
import 'package:portone_flutter/model/payment_data.dart';
import 'package:portone_flutter/model/certification_data.dart';
```

### after

```dart
import 'package:portone_flutter/v1/iamport_payment.dart';
import 'package:portone_flutter/v1/iamport_certification.dart';
import 'package:portone_flutter/v1/model/payment_data.dart';
import 'package:portone_flutter/v1/model/certification_data.dart';
```

V1 API 시그니처(위젯/모델 사용 방식)는 유지되므로, 일반적으로 import 경로만 변경하면 동작합니다.

## 3. 배럴 파일(`v1.dart`, `v2.dart`) 추가

버전별 배럴 파일이 추가되어, 개별 파일 대신 단일 import로 시작할 수 있습니다.

### V1 배럴 파일 사용

```dart
import 'package:portone_flutter/v1.dart';
```

### V2 배럴 파일 사용

```dart
import 'package:portone_flutter/v2.dart';
```

## 4. WebView 의존성 변경

내부 WebView 라이브러리가 `iamport_webview_flutter`에서 `flutter_inappwebview: ^6.1.5`로 변경되었습니다.

- 앱에서 `iamport_webview_flutter`를 직접 의존/사용 중이었다면 제거하세요.
- `portone_flutter`만 사용하는 경우, 기본적으로 추가 작업 없이 `flutter pub get`만 수행하면 됩니다.

## 5. V2 API 신규 추가

V2 전용 API가 추가되었습니다.

- `PortonePayment`
- `PortoneIdentityVerification`

V2 상세 사용법은 아래 문서를 참고하세요.

- [README](README.md)
- [example/README](example/README.md)

## 6. 마이그레이션 체크리스트

- [ ] `portone_flutter` 버전을 `^1.0.0` 이상으로 업데이트했다.
- [ ] 프로젝트 SDK 조건을 Dart `^3.10.0`, Flutter `>=3.38.1`로 맞췄다.
- [ ] V1 import를 `package:portone_flutter/v1/...` 또는 `package:portone_flutter/v1.dart`로 변경했다.
- [ ] 직접 사용하던 `iamport_webview_flutter` 의존성/import를 제거했다.
- [ ] `flutter pub get` 후 `flutter analyze`로 정적 분석을 통과했다.
- [ ] Android/iOS에서 결제/본인인증 흐름을 실제 단말에서 점검했다.
