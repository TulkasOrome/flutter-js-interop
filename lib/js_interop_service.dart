@JS()
library js_interop;

import 'dart:convert';
import 'dart:js_util';

import 'package:js/js.dart';

@JS('esri')
class WebMap {
  external WebMap(Portalitem portalItem);

  //external Portalitem get portalItem;
}

@JS()
@anonymous
class Portalitem {
  external factory Portalitem({required String id});

  external String get id;
}

@JS()
external _showAlert(String message);

@JS()
external _requestFullScreen();

@JS()
external _getData();

@JS()
external _getJsonData();

@JS()
external _getSomeAsyncData();

@JS()
external _shareImage(String url, String filename);

class JsInteropService {
  getWebMap(Portalitem) {
    return WebMap(Portalitem);
  }

  showAlert(String message) {
    _showAlert(message);
  }

  requestFullScreen() {
    _requestFullScreen();
  }

  getData() {
    final data = _getData();
    print(data);
  }

  getJsonData() {
    final data = _getJsonData();
    final decodedData = jsonDecode(data);
    print(decodedData['foo']);
  }

  getSomeAsyncData() async {
    final promise = await _getSomeAsyncData();
    final data = await promiseToFuture(promise);
    print(data);
  }

  shareImage(String url, String filename) async {
    final promise = await _shareImage(url, filename);
    final successResult = await promiseToFuture(promise);
    final success = successResult == "true";
    print(success);
  }
}
