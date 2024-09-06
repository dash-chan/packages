import 'package:dio/dio.dart';
import 'package:loggable_dio/loggable_dio.dart';

void main() async {
  final dio = Dio();
  dio.interceptors.add(LoggableDioInterceptor());
  await dio.get('http://api.chomoe.life/seasun/static/sectHeart');
  // try {
  //   await dio.get('http://192.168.15.201:3000', queryParameters: {'a': 'b'});
  // } catch (_) {}
  try {
    await dio.post('http://192.168.15.201', data: {'test': 'test', 'map': {}});
  } catch (_) {}
}
