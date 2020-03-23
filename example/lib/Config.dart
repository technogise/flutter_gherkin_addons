import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class Config{
  final URL url;
  Config(this.url);
  String get baseUrl {
    return Platform.isAndroid?url.android:url.iOS;
  }
}
class URL{
  final String android;
  final String iOS;

  URL(this.android, this.iOS);
}

Future<Config> getConfig(String env) async {
  final contents=await rootBundle.loadString(
    'assets/config/${env}.json'
  );
  final jsonData = jsonDecode(contents);
  return Config(URL(jsonData['baseUrl']['android'],jsonData['baseUrl']['iOS']));
}