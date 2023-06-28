import 'package:ua_parser/src/grammar.dart';
import 'package:ua_parser/ua_parser.dart';

void main() {
  final ua =
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36';
  final androidUA =
      'Mozilla/5.0 (Linux; Android 13; 2201123C Build/TKQ1.220807.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/114.0.5735.60 Mobile Safari/537.36';
  final p = UAGrammar().build<List<String>>();
  final data = p.parse(ua);
  print(data.value.join('\n'));
  print('-' * 40);
  print(p.parse(androidUA).value.join('\n'));
}
