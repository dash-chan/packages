import 'package:dart_ua_parser/ua.dart';
import 'package:petitparser/petitparser.dart';

class UaDefinition extends GrammarDefinition<List<UAAstNode>> {
  @override
  Parser<List<UAAstNode>> start() {
    return seq2(node(), optionalNodes())
        .map2((start, suffix) => [start, ...suffix ?? []]);
  }

  Parser<List<UAAstNode>?> optionalNodes() => seq2(whitespace(), node())
      .map2((_, n) => n)
      .repeat(0, unbounded)
      .optional();
  Parser<UAAstNode> node() => seq3(
        nameWithSpace(),
        seq2(slash(), version()).map2((_, v) => v).optional(),
        optionalComment(),
      ).map3((name, v, comment) {
        return UAAstNode(product: name, productVersion: v, comment: comment);
      });

  Parser<String> slash() => char('/');

  Parser<String?> optionalComment() => seq4(
        whitespace(),
        char('('),
        pattern('^()').plus(),
        char(')'),
      ).map4((_, __, v, ___) => v.join()).optional();

  // 1.0.0
  // 1.0
  Parser<List<int>> version() =>
      seq2(number(), (dot & number()).repeat(0, unbounded)).map2((minor, subs) {
        final parts = [for (final sub in subs) sub[1]];
        return [minor, ...parts];
      });

  final dot = char('.');
  Parser<int> number() => digit().plus().map((i) => int.parse(i.join()));

  /// match `Mozilla`
  Parser<String> simpleName() => pattern('a-zA-Z0-9-').plusString();

  /// match `Mobile Safari`
  Parser<String> nameWithSpace() => seq2(
              simpleName(),
              seq2(whitespace(), simpleName())
                  .map2((a, b) => ' $b')
                  .repeat(0, unbounded))
          .map2((a, b) {
        return [a, ...b].nonNulls.join();
      });
}
