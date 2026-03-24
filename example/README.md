# portone_flutter_example

포트원 V1/V2 플러터 모듈 예제 안내입니다.

## V1

### 일반/정기결제 예제

```dart
import 'package:flutter/material.dart';

/* 포트원 V1 결제 모듈을 불러옵니다. */
import 'package:portone_flutter/v1/iamport_payment.dart';
/* 포트원 V1 결제 데이터 모델을 불러옵니다. */
import 'package:portone_flutter/v1/model/payment_data.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IamportPayment(
      appBar: AppBar(
        title: Text('포트원 V1 결제'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/iamport-logo.png'),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'iamport',
      /* [필수입력] 결제 데이터 */
      data: PaymentData(
        pg: 'html5_inicis',                                          // PG사
        payMethod: 'card',                                           // 결제수단
        name: '포트원 V1 결제데이터 분석',                                  // 주문명
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
        amount: 39000,                                               // 결제금액
        buyerName: '홍길동',                                           // 구매자 이름
        buyerTel: '01012345678',                                     // 구매자 연락처
        buyerEmail: 'example@naver.com',                             // 구매자 이메일
        buyerAddr: '서울시 강남구 신사동 661-16',                         // 구매자 주소
        buyerPostcode: '06018',                                      // 구매자 우편번호
        appScheme: 'example',                                        // 앱 URL scheme
        cardQuota: [2, 3],                                           // 결제창 UI 내 할부개월수 제한
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) {
        Navigator.pushReplacementNamed(
          context,
          '/payment-result',
          arguments: result,
        );
      },
    );
  }
}
```

### IamportPayment 모델

| Prop         | Type                | Description                 | Required |
| ------------ | ------------------- | --------------------------- | -------- |
| appBar       | PreferredSizeWidget | 앱 네비게이션 헤더 바       | false    |
| userCode     | String              | 가맹점 식별코드             | true     |
| initialChild | 플러터 컴포넌트     | 웹뷰 로드시 보여질 컴포넌트 | false    |
| data         | `PaymentData`       | 결제에 필요한 정보          | true     |
| callback     | function            | 결제 후 실행 될 함수        | true     |

### PaymentData 모델 [자세히보기](https://developers.portone.io/sdk/ko/v1-sdk/javascript-sdk/payrq)

| Key                    | Type                     | Description                                          | Required                       |
| ---------------------- | ------------------------ | ---------------------------------------------------- | ------------------------------ |
| pg                     | String                   | PG사                                                 | false                          |
| payMethod              | String                   | 결제수단                                             | true                           |
| cardQuota              | List\<int\>              | 할부개월수                                           | false                          |
| vbankDue               | String                   | 가상계좌 입금기한                                    | false (가상계좌시 필수)        |
| bizNum                 | String                   | 사업자번호                                           | false (다날 - 가상계좌시 필수) |
| digital                | bool                     | 실물컨텐츠 여부                                      | false (휴대폰 소액결제시 필수) |
| escrow                 | bool                     | 에스크로 여부                                        | false                          |
| name                   | String                   | 주문명                                               | false                          |
| amount                 | num                      | 결제금액                                             | true                           |
| currency               | String                   | 화폐 단위                                            | false                          |
| customData             | Map<String, String>      | 임의 지정 데이터                                     | false                          |
| taxFree                | int                      | 면세 공급 가액                                       | false                          |
| vat                    | int                      | 부가세                                               | false                          |
| language               | String                   | 결제 창 언어설정                                     | false                          |
| merchantUid            | String                   | 주문번호                                             | true                           |
| buyerName              | String                   | 구매자 이름                                          | false                          |
| buyerTel               | String                   | 구매자 연락처                                        | true                           |
| buyerEmail             | String                   | 구매자 이메일                                        | false                          |
| buyerAddr              | String                   | 구매자 주소                                          | false                          |
| buyerPostcode          | String                   | 구매자 우편번호                                      | false                          |
| noticeUrl              | String                   | 웹훅 URL                                             | false                          |
| customerId             | String                   | 회원 고유 ID                                         | false                          |
| customerUid            | String                   | 정기결제 카드정보                                    | false (정기결제시 필수)        |
| appScheme              | String                   | 앱 스킴                                              | true                           |
| confirmUrl             | String                   | 컨펌 프로세스 URL                                    | false                          |
| popup                  | bool                     | 페이팔 팝업 여부                                     | false                          |
| bypass                 | Bypass                   | PG사 특수 파라미터                                   | false                          |
| period                 | Map<String, String>      | 다날 - 신용카드/계좌이체/가상계좌 전용 제공기간      | false                          |
| company                | String                   | 다날 - 휴대폰 소액결제 전용 주문명 앞 괄호 안 텍스트 | false                          |
| niceMobileV2           | bool                     | (구)나이스페이먼츠 - 모바일 여부                     | 모바일인 경우 true             |
| kcpProducts            | List\<KcpProducts\>      | KCP - 상품정보                                       | false                          |
| naverPopupMode         | bool                     | 네이버페이 팝업 여부                                 | false                          |
| naverChainId           | String                   | 네이버페이 - 체인ID                                  | false                          |
| naverUseCfm            | String                   | 네이버페이 - 이용완료일                              | false                          |
| naverProducts          | List\<NaverProducts\>    | 네이버페이 - 상품정보                                | false                          |
| naverCultureBenefit    | bool                     | 네이버페이 - 도서/공연비 추가 공제                   | false                          |
| naverMerchantUserKey   | String                   | 네이버페이 - 가맹점 사용자키                         | false                          |
| naverProductCode       | String                   | 네이버페이 - 상품코드                                | false                          |
| naverActionType        | String                   | 네이버페이 - 액션타입                                | false                          |
| naverPurchaserName     | String                   | 네이버페이 - 구매자명                                | false                          |
| naverPurchaserBirthday | String                   | 네이버페이 - 구매자 생년월일                         | false                          |
| naverInterface         | NaverInterface           | 네이버페이 - 인터페이스                              | false                          |

### period

이니시스, 나이스 그리고 다날 신용카드/계좌이체/가상계좌 결제시 제공기간 표기를 위한 파라미터입니다. 제공기간 시작 날짜(`from`)와 끝 날짜(`to`)를 아래와 같이 `YYYYMMDD` 형태로 넘겨주세요.

| key  | Type             | Description        |
| ---- | ---------------- | ------------------ |
| from | String(YYYYMMDD) | 제공기간 시작 날짜 |
| to   | String(YYYYMMDD) | 제공기간 종료날짜  |

```dart
data: PaymentData.fromJson({
  ...
  'period': { // 제공기간 2020년 1월 1일 ~ 2020년 12월 31일
    'from': '20200101', // 제공기간 시작 날짜
    'to': '20201231', // 제공기간 종료 날짜
  },
}),
```

### company

다날 휴대폰 소액결제시 주문명 앞 괄호 안 텍스트에 표기될 회사명을 위한 파라미터입니다. 결제창 내 주문명은 `(회사명) 주문명`과 같이 표기되며, 누락시 `(주문명) 주문명`과 같이 표기됩니다.

### 휴대폰 본인인증 예제

```dart
import 'package:flutter/material.dart';

/* 포트원 V1 휴대폰 본인인증 모듈을 불러옵니다. */
import 'package:portone_flutter/v1/iamport_certification.dart';
/* 포트원 V1 휴대폰 본인인증 데이터 모델을 불러옵니다. */
import 'package:portone_flutter/v1/model/certification_data.dart';

class Certification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IamportCertification(
      appBar: AppBar(
        title: Text('포트원 V1 본인인증'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/iamport-logo.png'),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'iamport',
      /* [필수입력] 본인인증 데이터 */
      data: CertificationData(
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
        company: '포트원 V1',                                            // 회사명 또는 URL
        carrier: 'SKT',                                               // 통신사
        name: '홍길동',                                                 // 이름
        phone: '01012341234',                                         // 전화번호
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) {
        Navigator.pushReplacementNamed(
          context,
          '/certification-result',
          arguments: result,
        );
      },
    );
  }
}
```

### IamportCertification 모델

| Prop         | Type                | Description                 | Required |
| ------------ | ------------------- | --------------------------- | -------- |
| appBar       | PreferredSizeWidget | 앱 네비게이션 헤더 바       | false    |
| userCode     | string              | 가맹점 식별코드             | true     |
| initialChild | 플러터 컴포넌트     | 웹뷰 로드시 보여질 컴포넌트 | false    |
| data         | `CertificationData` | 본인인증에 필요한 정보      | true     |
| callback     | function            | 본인인증 후 실행 될 함수    | true     |

### CertificationData 모델 [자세히보기](https://developers.portone.io/sdk/ko/v1-sdk/javascript-sdk/cft)

| Key          | Type   | Description          | Required |
| ------------ | ------ | -------------------- | -------- |
| pg           | String | PG사                 | false    |
| merchantUid  | String | 주문번호             | false    |
| company      | String | 회사명 또는 URL      | false    |
| carrier      | String | 통신사               | false    |
|              |        | - `SKT`: SKT         |          |
|              |        | - `KTF`: KT          |          |
|              |        | - `LGT`: LGU+        |          |
|              |        | - `MVNO`: 알뜰폰     |          |
| name         | String | 본인인증 할 이름     | false    |
| phone        | String | 본인인증 할 전화번호 | false    |
| minAge       | int    | 허용 최소 만 나이    | false    |
| popup        | bool   | 팝업 여부            | false    |

---

## V2

### 결제 예제

```dart
import 'package:flutter/material.dart';

/* 포트원 V2 결제 모듈을 불러옵니다. */
import 'package:portone_flutter/v2/portone_payment.dart';
/* 포트원 V2 결제 데이터 모델을 불러옵니다. */
import 'package:portone_flutter/v2/model/request/payment_request.dart';
import 'package:portone_flutter/v2/model/response/payment_response.dart';
import 'package:portone_flutter/v2/model/entity/payment_pay_method.dart';
import 'package:portone_flutter/v2/model/entity/currency.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PortonePayment(
      appBar: AppBar(
        title: Text('포트원 V2 결제'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
      /* [필수입력] 결제 데이터 */
      data: PaymentRequest(
        storeId: 'your-store-id',                                      // 상점 ID
        channelKey: 'your-channel-key',                                // 채널 키
        payMethod: PaymentPayMethod.CARD,                              // 결제수단
        orderName: '포트원 V2 결제 테스트',                                // 주문명
        totalAmount: 1000,                                              // 결제금액
        currency: Currency.KRW,                                         // 화폐
        paymentId: 'payment_${DateTime.now().millisecondsSinceEpoch}', // 결제 ID
        appScheme: 'example',                                           // 앱 URL scheme
      ),
      /* [필수입력] 콜백 함수 */
      callback: (PaymentResponse response) {
        Navigator.pushReplacementNamed(
          context,
          '/payment-result',
          arguments: response,
        );
      },
    );
  }
}
```

### PortonePayment 모델

| Prop         | Type                          | Description                 | Required |
| ------------ | ----------------------------- | --------------------------- | -------- |
| appBar       | PreferredSizeWidget           | 앱 네비게이션 헤더 바       | false    |
| initialChild | Widget                        | 웹뷰 로드시 보여질 컴포넌트 | false    |
| data         | `PaymentRequest`              | 결제에 필요한 정보          | true     |
| callback     | `void Function(PaymentResponse)` | 결제 후 실행 될 함수     | true     |

### PaymentRequest 주요 필드

| Key            | Type              | Description                        | Required |
| -------------- | ----------------- | ---------------------------------- | -------- |
| storeId        | String            | 상점 ID                           | true     |
| paymentId      | String            | 결제 ID                           | true     |
| orderName      | String            | 주문명                             | true     |
| totalAmount    | int               | 결제금액 (minor unit)              | true     |
| currency       | Currency          | 화폐 (KRW, USD 등)                | true     |
| payMethod      | PaymentPayMethod  | 결제수단 (CARD, TRANSFER 등)       | true     |
| channelKey     | String            | 채널 키                            | channelKey 또는 channelGroupId 중 하나 필수 |
| channelGroupId | String            | 채널 그룹 ID                       | channelKey 또는 channelGroupId 중 하나 필수 |
| appScheme      | String            | 앱 URL scheme                      | true     |
| customer       | Customer          | 고객 정보                          | false    |
| bypass         | PaymentBypass     | PG사별 추가 파라미터               | false    |

### PaymentResponse 필드

| Key             | Type   | Description            |
| --------------- | ------ | ---------------------- |
| transactionType | String | 거래 유형 (`PAYMENT`)  |
| txId            | String | 결제 시도 ID           |
| paymentId       | String | 결제 ID                |
| paymentToken    | String | 수동 승인용 토큰       |
| code            | String | 오류 코드 (실패 시)    |
| message         | String | 오류 메시지 (실패 시)  |
| pgCode          | String | PG 오류 코드           |
| pgMessage       | String | PG 오류 메시지         |

### 본인인증 예제

```dart
import 'package:flutter/material.dart';

/* 포트원 V2 본인인증 모듈을 불러옵니다. */
import 'package:portone_flutter/v2/portone_identity_verification.dart';
/* 포트원 V2 본인인증 데이터 모델을 불러옵니다. */
import 'package:portone_flutter/v2/model/request/identity_verification_request.dart';
import 'package:portone_flutter/v2/model/response/identity_verification_response.dart';

class IdentityVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PortoneIdentityVerification(
      appBar: AppBar(
        title: Text('포트원 V2 본인인증'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
      /* [필수입력] 본인인증 데이터 */
      data: IdentityVerificationRequest(
        storeId: 'your-store-id',                                                     // 상점 ID
        identityVerificationId: 'iv_${DateTime.now().millisecondsSinceEpoch}',       // 본인인증 ID
        channelKey: 'your-channel-key',                                               // 채널 키
      ),
      /* 앱 URL scheme */
      appScheme: 'example',
      /* [필수입력] 콜백 함수 */
      callback: (IdentityVerificationResponse response) {
        Navigator.pushReplacementNamed(
          context,
          '/certification-result',
          arguments: response,
        );
      },
    );
  }
}
```

### PortoneIdentityVerification 모델

| Prop         | Type                                          | Description                 | Required |
| ------------ | --------------------------------------------- | --------------------------- | -------- |
| appBar       | PreferredSizeWidget                           | 앱 네비게이션 헤더 바       | false    |
| initialChild | Widget                                        | 웹뷰 로드시 보여질 컴포넌트 | false    |
| data         | `IdentityVerificationRequest`                 | 본인인증에 필요한 정보      | true     |
| appScheme    | String                                        | 앱 URL scheme (기본값: 'portone') | false    |
| callback     | `void Function(IdentityVerificationResponse)` | 본인인증 후 실행 될 함수    | true     |

### IdentityVerificationRequest 주요 필드

| Key                      | Type                          | Description       | Required |
| ------------------------ | ----------------------------- | ----------------- | -------- |
| storeId                  | String                        | 상점 ID           | true     |
| identityVerificationId   | String                        | 본인인증 ID       | true     |
| channelKey               | String                        | 채널 키           | false    |
| customer                 | Customer                      | 고객 정보         | false    |
| bypass                   | IdentityVerificationBypass    | PG사별 추가 파라미터 | false |

### IdentityVerificationResponse 필드

| Key                        | Type   | Description                          |
| -------------------------- | ------ | ------------------------------------ |
| transactionType            | String | 거래 유형 (`IDENTITY_VERIFICATION`)  |
| identityVerificationId     | String | 본인인증 ID                          |
| identityVerificationTxId   | String | 본인인증 시도 ID                     |
| code                       | String | 오류 코드 (실패 시)                  |
| message                    | String | 오류 메시지 (실패 시)                |
| pgCode                     | String | PG 오류 코드                         |
| pgMessage                  | String | PG 오류 메시지                       |
