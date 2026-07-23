import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portone_flutter/v1/model/iamport_url.dart';
import 'package:portone_flutter/v1/model/url_data.dart';

void main() {
  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  group('Android', () {
    setUp(() {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
    });

    test('intent:// URL에서 scheme과 package를 추출해 appUrl을 정규화한다 (ISP)', () async {
      final iamportUrl = IamportUrl(
        'intent://TID=INIMX_ISPtest#Intent;scheme=ispmobile;package=kvp.jjy.MispAndroid320;end',
      );

      expect(iamportUrl.appScheme, 'ispmobile');
      expect(iamportUrl.appUrl, 'ispmobile://TID=INIMX_ISPtest');
      expect(iamportUrl.package, 'kvp.jjy.MispAndroid320');
      expect(iamportUrl.isAppLink(), isTrue);
      expect(
        await iamportUrl.getMarketUrl(),
        UrlData.ANDROID_MARKET_PREFIX + UrlData.PACKAGE_ISP,
      );
    });

    test('host에 포트가 포함되면 콜론을 %3A로 치환한다 (농협카드)', () {
      final iamportUrl = IamportUrl(
        'intent://vaccine.nhcard.com:8443/vaccine#Intent;scheme=nhappcardansimclick;end',
      );

      expect(iamportUrl.appScheme, 'nhappcardansimclick');
      expect(
        iamportUrl.appUrl,
        'nhappcardansimclick://vaccine.nhcard.com%3A8443/vaccine',
      );
    });

    test('intent:[scheme]:// 형태에서 scheme을 추출한다 (현대카드)', () async {
      final iamportUrl = IamportUrl(
        'intent:hdcardappcardansimclick://appcard?acctid=01#Intent;end',
      );

      expect(iamportUrl.appScheme, UrlData.HYUNDAICARD);
      expect(iamportUrl.appUrl, 'hdcardappcardansimclick://appcard?acctid=01');
      expect(
        await iamportUrl.getMarketUrl(),
        UrlData.ANDROID_MARKET_PREFIX + UrlData.PACKAGE_HYUNDAICARD,
      );
    });

    test('#Intent; 파라미터가 없는 intent:// URL도 오류 없이 처리한다', () {
      final iamportUrl = IamportUrl('intent://example.com/path');

      expect(iamportUrl.appUrl, 'intent://example.com/path');
      expect(iamportUrl.isAppLink(), isTrue);
    });

    test('일반 커스텀 스킴은 원본 URL을 유지하고 스킴 테이블로 마켓 URL을 찾는다', () async {
      final iamportUrl = IamportUrl('ispmobile://TID=INIMX_ISPtest');

      expect(iamportUrl.appScheme, UrlData.ISP);
      expect(iamportUrl.appUrl, 'ispmobile://TID=INIMX_ISPtest');
      expect(
        await iamportUrl.getMarketUrl(),
        UrlData.ANDROID_MARKET_PREFIX + UrlData.PACKAGE_ISP,
      );
    });

    test('intent가 부분 문자열로 포함된 커스텀 스킴을 intent 스킴으로 오인하지 않는다', () {
      final iamportUrl = IamportUrl('paymentintent://checkout?id=1');

      expect(iamportUrl.appScheme, 'paymentintent');
      expect(iamportUrl.appUrl, 'paymentintent://checkout?id=1');
      expect(iamportUrl.isAppLink(), isTrue);
    });

    test('http/https/about/data 스킴은 앱 링크가 아니다', () {
      expect(IamportUrl('http://example.com').isAppLink(), isFalse);
      expect(IamportUrl('https://example.com').isAppLink(), isFalse);
      expect(IamportUrl('about:blank').isAppLink(), isFalse);
      expect(IamportUrl('data:text/html,<html></html>').isAppLink(), isFalse);
    });

    test('플레이스토어 URL은 앱 링크로 취급한다', () {
      final iamportUrl = IamportUrl(
        'https://play.google.com/store/apps/details?id=kvp.jjy.MispAndroid320',
      );

      expect(iamportUrl.isAppLink(), isTrue);
    });

    test('카드사 앱 커스텀 스킴은 앱 링크로 취급한다', () {
      expect(IamportUrl('kakaotalk://payment').isAppLink(), isTrue);
      expect(IamportUrl('kftc-bankpay://eftpay').isAppLink(), isTrue);
    });
  });

  group('iOS', () {
    setUp(() {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    });

    test('커스텀 스킴의 마켓 URL은 앱스토어 링크로 매핑한다 (ISP)', () async {
      final iamportUrl = IamportUrl('ispmobile://TID=INIMX_ISPtest');

      expect(iamportUrl.appUrl, 'ispmobile://TID=INIMX_ISPtest');
      expect(
        await iamportUrl.getMarketUrl(),
        UrlData.IOS_MARKET_PREFIX + 'id369125087',
      );
    });

    test('intent:// URL을 정규화하지 않는다', () {
      final iamportUrl = IamportUrl(
        'intent://TID=INIMX_ISPtest#Intent;scheme=ispmobile;end',
      );

      expect(
        iamportUrl.appUrl,
        'intent://TID=INIMX_ISPtest#Intent;scheme=ispmobile;end',
      );
    });

    test('플레이스토어 URL은 앱 링크가 아니다', () {
      final iamportUrl = IamportUrl(
        'https://play.google.com/store/apps/details?id=kvp.jjy.MispAndroid320',
      );

      expect(iamportUrl.isAppLink(), isFalse);
    });
  });
}
