import 'dart:convert';
import 'dart:io';

import 'package:json_printer/json_printer.dart';

void main() {
  final contents = File('example/example.json').readAsStringSync();
  print(json.encode(json.decode(contents)['str']));
  JsonPrinter().directPrint(contents);
}
