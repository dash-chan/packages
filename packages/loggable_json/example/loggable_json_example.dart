import 'dart:convert';
import 'dart:io';

import 'package:loggable_json/loggable_json.dart';

void main() {
  final contents = File('example/example.json').readAsStringSync();
  print(json.encode(json.decode(contents)['str']));
  LoggableJson().directPrint(contents);
}
