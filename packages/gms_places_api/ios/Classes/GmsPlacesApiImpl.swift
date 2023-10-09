import Flutter
import GooglePlaces

extension FlutterError: Error {}

class GmsPlacesApiImpl: GmsPlacesApi {
    static var token: GMSAutocompleteSessionToken?

    func ensureInitialized() throws {
        GmsPlacesApiImpl.token = GMSAutocompleteSessionToken()
    }

    func autocomplete(fromQuery: String, filter: PlacesFilterType, completion: @escaping (Result<[Prediction], Error>) -> Void) {
        let autocompleteFilter = GMSAutocompleteFilter()
        switch filter {
        case .address:
            autocompleteFilter.type = .address
        case .city:
            autocompleteFilter.type = .city
        case .establishment:
            autocompleteFilter.type = .establishment
        case .geocode:
            autocompleteFilter.type = .geocode
        case .region:
            autocompleteFilter.type = .region
        }
        if GmsPlacesApiImpl.token == nil {
            let error = FlutterError(code: "emptyToken", message: "emptyToken", details: "emptyToken")
            completion(.failure(error))
        }
        GMSPlacesClient().findAutocompletePredictions(
            fromQuery: fromQuery,
            filter: autocompleteFilter,
            sessionToken: GmsPlacesApiImpl.token
        ) { items, error in
            if error != nil {
                completion(.failure(FlutterError(code: "searchError", message: error?.localizedDescription, details: "")))
            } else {
                if items == nil {
                    completion(.success([]))
                    return
                }
                var result = [Prediction]()
                for item in items! {
                    result.append(Prediction(
                        attributed: PredictionAttributed(
                            fullText: item.attributedFullText.string,
                            primaryText: item.attributedPrimaryText.string,
                            secondaryText: item.attributedSecondaryText?.string
                        ),
                        placeID: item.placeID,
                        rawTypes: item.types,
                        distanceMeters: item.distanceMeters?.doubleValue
                    ))
                }
                completion(.success(result))
            }
        }
    }
}

class TokenEmptyError: Error {}
