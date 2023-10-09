import 'generated/gms_places_api_platform_interface.g.dart';

class GmsPlaces {
  static final _api = GmsPlacesApi();
  static Future ensureInitialized() async {
    await _api.ensureInitialized();
  }

  static Future<List<Prediction>> autocomplete(String query,
      {PlacesFilterType type = PlacesFilterType.all}) async {
    try {
      final items = await _api.autocomplete(query, type);
      return items.nonNulls.toList();
    } catch (e) {
      return [];
    }
  }
}

extension PredictionExt on Prediction {
  List<String> get types => rawTypes.nonNulls.toList();
}
