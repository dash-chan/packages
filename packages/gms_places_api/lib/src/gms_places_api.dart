import 'generated/gms_places_api_platform_interface.g.dart';

class GmsPlaces {
  static final _api = GmsPlacesApi();
  static Future ensureInitialized() async {
    await _api.ensureInitialized();
  }

  static Future<List<Prediction>> autocomplete(String query,
      {required PlacesFilterType type}) async {
    try {
      final items = await _api.autocomplete(query, type);
      return items.nonNulls.toList();
    } catch (e) {
      return [];
    }
  }

  static Future<PlaceItem?> getDetailById(
      String placeId, List<PlaceFields> fields) async {
    try {
      return await _api.getDetailById(placeId, fields);
    } catch (e) {
      return null;
    }
  }
}

extension PredictionExt on Prediction {
  List<String> get types => rawTypes.nonNulls.toList();
}

extension PlaceItemExt on PlaceItem {
  List<String> get types => rawTypes?.nonNulls.toList() ?? [];
  List<AddressComponent> get addressComponents =>
      rawAddressComponents.nonNulls.toList();
}

extension AddressComponentExt on AddressComponent {
  List<String> get types => rawTypes.nonNulls.toList();
}
