import 'dart:js_interop';

@JS('window.open')
external JSAny? _openWindow(
  JSString url,
  JSString target,
  JSString features,
);

Future<void> openExternalUrl(String url) async {
  _openWindow(url.toJS, '_blank'.toJS, 'noopener,noreferrer'.toJS);
}
