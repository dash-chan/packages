import 'dart:convert';
import 'dart:io';

import 'package:dart_ua_parser/dart_ua_parser.dart';
import 'package:petitparser/src/core/result.dart';

void main() {
  // final content = json.decode(File('example/ua.json').readAsStringSync());
  // final uas = (content as List).map((e) => e['ua'] as String).toList();
  // for (var ua in uas) {
  //   parse(ua);
  // }
// NokiaE66/GoBrowser/2.0.297
// Nokia5700XpressMusic/GoBrowser/1.6.91
// SAMSUNG-S8000/S8000XXIF3 SHP/VPP/R5 Jasmine/1.0 Nextreaming SMM-MMS/1.2.0 profile/MIDP-2.1 configuration/CLDC-1.1
// NCSA_Mosaic/2.6 (X11; SunOS 4.1.3 sun4m)
// LG-GS290/V100 Obigo/WAP2.0 Profile/MIDP-2.1 Configuration/CLDC-1.1
// LG/KU990i/v10a Browser/Obigo-Q05A/3.6 MMS/LG-MMS-V1.0/1.2 Java/ASVM/1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1
// JUC (Linux; U; 2.3.5; zh-cn; GT-I9100; 480*800) UCWEB7.9.0.94/139/800
  parse(
      'JUC (Linux; U; 2.3.5; zh-cn; GT-I9100; 480*800) UCWEB7.9.0.94/139/800');
}

parse(String ua) {
  var p = UaDefinition().build();

  final result = p.parse(ua);
  switch (result) {
    case Success():
      print(result.value);
      break;
    case Failure():
      print(result.buffer);
  }
}
