import 'dart:io';

import 'package:json_printer/json_printer.dart';

void main() {
  final contents = File('example/example.json').readAsStringSync();
  JsonPrinter(rootIndent: 4).convert(contents);
}
