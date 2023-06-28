import 'package:petitparser/definition.dart';
import 'package:petitparser/parser.dart';

final ua =
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36';

class UAGrammar extends GrammarDefinition<List<String>> {
  @override
  Parser<List<String>> start() => seq3(
      firstInfo(),
      whitespace(),
      ref0(normalInfo)
          .starSeparated(whitespace())
          .map((value) => value.elements)).map3((p0, p1, p2) => [p0, ...p2]);

  Parser<String> prefix() => char('/').neg().plus().flatten();
  Parser<String> prefixVersion() => pattern('.0-9').plus().flatten();
  Parser<String> info() => seq3(
        char('('),
        ref0(data)
            .starSeparated(char(';').or(char(',')).trim())
            .map((value) => value.elements),
        char(')'),
      ).map3((p0, p1, p2) => p1.join('@'));

  Parser<String> data() =>
      pattern(r'a-zA-Z0-9_').or(whitespace()).or(char('/')).or(char('.')).plus().flatten();

  Parser<String> productAndVersion() =>
      seq3(prefix(), char('/'), prefixVersion())
          .map3((p0, p1, p2) => '$p0/$p2');

  Parser<String> normalProduct() =>
      seq3(prefix(), char('/').optional(), prefixVersion().optional())
          .map3((p0, p1, p2) => '$p0/$p2');

  Parser<String> firstInfo() => seq3(productAndVersion(), whitespace(), info())
      .map3((p0, p1, p2) => 'prefix: $p0:($p2)');

  Parser<String> normalInfo() => seq3(normalProduct(), whitespace(), info())
          .or(normalProduct())
          .map((value) {
        if (value is String) return value;
        if (value is Sequence3<String, String, String>) {
          return 'mid: ${value.first}:${value.third}';
        }
        throw UnimplementedError();
      });
}
