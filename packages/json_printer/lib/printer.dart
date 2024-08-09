import 'dart:convert';
import 'dart:io';

import 'package:ansicolor/ansicolor.dart';

final _blue = AnsiPen()..blue();
final _yellow = AnsiPen()..yellow();
final _gray = AnsiPen()..gray();
final _green = AnsiPen()..green();
final _cyan = AnsiPen()..cyan();
final _magenta = AnsiPen()..magenta();

class JsonPrinter {
  JsonPrinter({
    this.indent = 2,
    this.rootIndent = 0,
  });

  final int rootIndent;
  final int indent;

  void convert(dynamic contents) {
    switch (contents) {
      case Map():
        _printMap(contents, 0);
      case String():
        convert(json.decode(contents));
      default:
    }
    _enter();
  }

  void _printMap(Map map, int level) {
    if (level == 0) _space(rootIndent);
    _output('{', _yellow);
    final entries = map.entries;
    for (var i = 0; i < entries.length; i++) {
      _enter();
      final current = entries.elementAt(i);
      _space(rootIndent);
      _space((level + 1) * indent);
      _printMapKey(current.key);
      _output(':', _gray);
      _space(1);

      switch (current.value) {
        case String():
          _printString(current.value);
        case num():
          _printNum(current.value);
        case bool():
          _printBool(current.value);
        case null:
          _printNull();
        case Map():
          _printMap(current.value, level + 1);
        case List():
          _printList(current.value, level + 1);
        default:
      }

      if (i != entries.length - 1) {
        _output(',', _gray);
      } else {
        _enter();
      }
    }

    if (map.isNotEmpty) _space(level * indent + rootIndent);
    _output('}', _yellow);
  }

  void _printList(List list, int level) {
    _output('[', _yellow);
    for (var i = 0; i < list.length; i++) {
      _enter();
      _space((level + 1) * indent + rootIndent);
      final current = list[i];
      switch (current) {
        case Map():
          _printMap(current, level + 1);
        case String():
          _printString(current);
        case num():
          _printNum(current);
        case bool():
          _printBool(current);
        case null:
          _printNull();
        case List():
          _printList(current, level + 1);
        default:
      }

      if (i != list.length - 1) {
        _output(',', _gray);
      } else {
        _enter();
      }
    }
    if (list.isNotEmpty) _space(level * indent + rootIndent);
    _output(']', _yellow);
  }

  void _printMapKey(String value) {
    _output('"', _gray);
    _output(value, _blue);
    _output('"', _gray);
  }

  void _printString(String value) {
    _output('"', _gray);
    _output(value, _green);
    _output('"', _gray);
  }

  void _printNum(num value) {
    _output('$value', _cyan);
  }

  void _printBool(bool value) {
    _output('$value', _magenta);
  }

  void _printNull() {
    _output('null', _magenta);
  }

  _space(int count) {
    stdout.write(' ' * count);
  }

  _enter() {
    stdout.writeln();
  }

  _output(String value, AnsiPen pen) {
    stdout.write(pen(value));
  }
}
