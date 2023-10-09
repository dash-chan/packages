// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/generated/gms_places_api_platform_interface.g.dart',
  dartOptions: DartOptions(),
  swiftOut: 'ios/Classes/GmsPlacesApi.swift',
  swiftOptions: SwiftOptions(),
  kotlinOut: 'android/src/main/kotlin/dev/laihz/gms_places_api/GmsPlacesApi.kt',
  kotlinOptions: KotlinOptions(
    package: 'dev.laihz.gms_places_api',
  ),
))
@HostApi()
abstract class GmsPlacesApi {
  void ensureInitialized();
  @async
  List<Prediction> autocomplete(String fromQuery, PlacesFilterType filter);
}

enum PlacesFilterType {
  /// Geocoding results, as opposed to business results.
  geocode,

  /// Geocoding results with a precise address.
  address,

  /// Business results.
  establishment,

  /// * Results that match the following types:
  /// * "locality",
  /// * "sublocality"
  /// * "postal_code",
  /// * "country",
  /// * "administrative_area_level_1",
  /// * "administrative_area_level_2"
  region,

  /// * Results that match the following types:
  /// * "locality",
  /// * "administrative_area_level_3"
  city,
}

class Prediction {
  Prediction({
    required this.attributed,
    required this.placeID,
    required this.rawTypes,
    required this.distanceMeters,
  });

  final PredictionAttributed attributed;
  final String placeID;
  final List<String?> rawTypes;
  final double? distanceMeters;
}

class PredictionAttributed {
  PredictionAttributed({
    required this.fullText,
    required this.primaryText,
    required this.secondaryText,
  });
  final String fullText;
  final String primaryText;
  final String? secondaryText;
}
