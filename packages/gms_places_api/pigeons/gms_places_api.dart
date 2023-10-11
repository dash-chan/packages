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

  @async
  PlaceItem? getDetailById(String placeId, List<PlaceFields> fields);
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

enum PlaceFields {
  formattedAddress,
  addressComponents,
  businessStatus,
  placeID,
  coordinate,
  name,
  photos,
  plusCode,
  types,
  viewport,
}

class PlaceItem {
  PlaceItem({
    this.formattedAddress,
    required this.rawAddressComponents,
    required this.businessStatus,
    this.placeId,
    this.coordinate,
    this.name,
    this.plusCode,
    required this.rawTypes,
    this.viewport,
  });

  final String? formattedAddress;
  final List<AddressComponent?> rawAddressComponents;
  final PlacesBusinessStatus businessStatus;
  final String? placeId;
  final PlaceCoordinate? coordinate;
  final String? name;
  final PlacePlusCode? plusCode;
  final List<String?>? rawTypes;
  final PlaceViewport? viewport;
}

class AddressComponent {
  AddressComponent(
      {required this.name, this.shortName, required this.rawTypes});

  final String name;
  final String? shortName;
  final List<String?> rawTypes;
}

enum PlacesBusinessStatus {
  /// The business status is not known
  unknown,

  /// The business is operational
  operational,

  /// The business is closed temporarily
  closedTemporarily,

  /// The business is closed permanently
  closedPermanently,
}

class PlaceCoordinate {
  PlaceCoordinate({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;
}

class PlacePlusCode {
  PlacePlusCode({required this.globalCode, required this.compoundCode});

  final String globalCode;
  final String? compoundCode;
}

class PlaceViewport {
  PlaceViewport(
      {required this.northEast, required this.southWest, required this.valid});

  final PlaceCoordinate northEast;
  final PlaceCoordinate southWest;
  final bool valid;
}
