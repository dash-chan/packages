import 'package:petitparser/debug.dart';
import 'package:petitparser/petitparser.dart';

class UserAgentParser {
  Parser build() {
    // 定义标识符解析器（浏览器、系统名称等）
    final identifier =
        (letter() & (letter() | digit() | char('-') | char('_')).star())
            .flatten()
            .trim();

    // 定义版本解析器（如 1.0.0）
    final version = (digit().plus().flatten() &
            (char('.') & digit().plus().flatten()).star())
        .map((values) {
      final components = [values[0]];
      components.addAll(values[1].map((pair) => pair[1]));
      return components.join('.');
    });

    // 定义括号中的内容解析器（如操作系统信息）
    final parenthesized =
        (char('(') & any().starLazy(char(')')).flatten() & char(')'))
            .pick(1)
            .optional();

    // 定义浏览器/系统标识解析器（标识符/版本）
    final product =
        (identifier & (char('/') & version).optional()).map((values) {
      final name = values[0];
      final version = values[1] != null ? values[1][1] : null;
      return {'name': name, 'version': version};
    });

    // 定义完整的 User-Agent 解析器
    final userAgent =
        (product & parenthesized & (char(' ') & product).star()).map((values) {
      final mainProduct = values[0];
      final osInfo = values[1];
      final additionalProducts = values[2].map((pair) => pair[1]).toList();

      return {
        'mainProduct': mainProduct,
        'osInfo': osInfo,
        'additionalProducts': additionalProducts,
      };
    });

    return userAgent.end();
  }
}

void main(List<String> args) {
  final p = trace(UserAgentParser().build());
  final result = p.parse(
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_16_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36 115Browser/24.3.0.3');

  print(result);
}
