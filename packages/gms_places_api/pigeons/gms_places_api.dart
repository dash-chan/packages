import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/generated/gms_places_api_platform_interface.g.dart',
  dartOptions: DartOptions(),
  swiftOut: 'ios/Classes/GmsPlacesApi.swift',
  swiftOptions: SwiftOptions(),
))
@HostApi()
abstract class GmsPlacesApi {
  String autocomplete(String fromQuery);
}
