// Android에서 iframe이 웹이 아닌 스킴(intent://, 카드사 앱 스킴 등)으로 이동하면 취소한다.
// flutter_inappwebview는 iframe 이동에 대해 shouldOverrideUrlLoading 응답을 기다리지 않아
// 콜백에서 CANCEL을 반환해도 iframe이 ERR_UNKNOWN_URL_SCHEME 에러 페이지로 바뀐다.
// 콜백은 그대로 호출되므로 앱 실행은 기존 shouldOverrideUrlLoading에서 처리된다.
const nonWebSubFrameUrlRegex =
    r'(?i)^(?!(?:https?|about|data|blob|javascript):).*$';
