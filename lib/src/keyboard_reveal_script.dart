import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

UnmodifiableListView<UserScript>? get keyboardRevealUserScripts =>
    defaultTargetPlatform == TargetPlatform.iOS ? _iosUserScripts : null;

final _iosUserScripts = UnmodifiableListView([
  UserScript(
    source: _revealFocusedInput,
    injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
    forMainFrameOnly: false,
    contentWorld: ContentWorld.DEFAULT_CLIENT,
  ),
]);

const _revealFocusedInput = r'''
{
  const FOCUS_MESSAGE = '__portone_keyboard_focus__';

  const isFrame = (el) => el?.tagName === 'IFRAME' || el?.tagName === 'FRAME';
  const isTextEntry = (el) => el?.matches(':read-write') ?? false;

  const visibleArea = () => {
    const { offsetTop, height } = window.visualViewport;
    return { top: offsetTop, bottom: offsetTop + height };
  };

  const revealFocusedInput = () => {
    const el = document.activeElement;
    const frame = isFrame(el);
    if (!frame && !isTextEntry(el)) return;
    if (window.visualViewport.scale > 1.01) return;

    // WebKit can leave the outer page above its scroll origin when focus
    // moves inside a cross-origin frame while the keyboard stays open.
    if (window.scrollY < 0) window.scrollTo(window.scrollX, 0);
    if (frame) return;

    let rect = el.getBoundingClientRect();
    let area = visibleArea();
    if (rect.top >= area.top && rect.bottom <= area.bottom) return;

    el.scrollIntoView({ block: 'nearest', inline: 'nearest' });

    rect = el.getBoundingClientRect();
    area = visibleArea();
    const delta = Math.min(rect.bottom - area.bottom, rect.top - area.top);
    if (delta > 0) window.scrollBy(0, delta);
  };

  let timer;
  const scheduleReveal = () => {
    clearTimeout(timer);
    timer = setTimeout(revealFocusedInput, 150);
  };

  const notifyParent = () => {
    if (window !== window.parent) window.parent.postMessage(FOCUS_MESSAGE, '*');
  };

  document.addEventListener('focusin', ({ target }) => {
    if (!isTextEntry(target)) return;
    scheduleReveal();
    notifyParent();
  }, { capture: true });

  window.addEventListener('message', ({ data, source }) => {
    const el = document.activeElement;
    if (data !== FOCUS_MESSAGE || !isFrame(el) || el.contentWindow !== source) return;
    scheduleReveal();
    notifyParent();
  });

  window.addEventListener('resize', scheduleReveal);
}
''';
