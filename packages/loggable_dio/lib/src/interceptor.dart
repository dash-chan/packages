import 'dart:io';

import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import 'package:loggable_json/loggable_json.dart';

final _blue = AnsiPen()..blue();
final _blueBg = AnsiPen()..blue(bg: true);
final _yellow = AnsiPen()..yellow();
final _gray = AnsiPen()..gray();
final _green = AnsiPen()..green();
final _greenBg = AnsiPen()..green(bg: true);
final _cyan = AnsiPen()..cyan();
final _cyanBg = AnsiPen()..cyan(bg: true);
final _magenta = AnsiPen()..magenta();
final _red = AnsiPen()..red();
final _redBg = AnsiPen()..red(bg: true);

class LoggableDioInterceptor extends Interceptor {
  LoggableDioInterceptor({
    this.showRequestHeader = false,
    this.showResponseHeader = false,
  });

  final bool showRequestHeader;
  final bool showResponseHeader;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _writeBadge('request', _blueBg);
    _writeRequestOption(options);
    _writeRequestData(options);
    _enter();
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _writeBadge('response', _greenBg);
    _writeRequestOption(response.requestOptions);
    LoggableJson().directPrint(response.data);
    _enter();
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _writeBadge('error', _redBg);
    _writeRequestOption(err.requestOptions);
    _write('[${err.type.name}]', pen: _red);
    _writeStatusCode(err.response?.statusCode);
    _enter();
    _write(' ');
    _writeln(err.message, _red);

    handler.next(err);
  }

  _writeBadge(String badge, AnsiPen pen) {
    stdout.write(pen(badge));
  }

  _write(String? content, {AnsiPen? pen, String? prefix, String? suffix}) {
    if (content == null || content.isEmpty) return;
    content = '${prefix ?? ''}$content${suffix ?? ''}';
    stdout.write(pen?.call(content) ?? content);
  }

  _writeln(String? content, [AnsiPen? pen]) {
    if (content == null || content.isEmpty) return;
    _write(content, pen: pen);
    stdout.writeln();
  }

  _enter() {
    stdout.writeln();
  }

  _writeRequestOption(RequestOptions o) {
    _write(' ');
    _writeBadge(o.method, _yellow);
    _write(o.uri.toString(), prefix: ' ', suffix: ' ');
    _write(o.contentType, suffix: ' ');
    _enter();
  }

  _writeRequestData(RequestOptions o) {
    if (o.data == null) return;
    LoggableJson().directPrint(o.data);
  }

  _writeStatusCode(int? code) {
    _write(' ');
    _write('$code', pen: _cyan);
  }
}
