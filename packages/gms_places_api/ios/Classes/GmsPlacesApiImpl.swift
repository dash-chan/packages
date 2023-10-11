import Flutter
import GooglePlaces

extension FlutterError: Error {}

class GmsPlacesApiImpl: GmsPlacesApi {
    static var token: GMSAutocompleteSessionToken?
    static var fieldDict: [PlaceFields: GMSPlaceField] = [
        .formattedAddress: .formattedAddress,
        .addressComponents: .addressComponents,
        .businessStatus: .businessStatus,
        .placeID: .placeID,
        .coordinate: .coordinate,
        .name: .name,
        .photos: .photos,
        .plusCode: .plusCode,
        .types: .types,
        .viewport: .viewport,
    ]
    static var businessStatusDict: [GMSPlacesBusinessStatus: PlacesBusinessStatus] = [
        .closedPermanently: .closedPermanently,
        .closedTemporarily: .closedTemporarily,
        .operational: .operational,
        .unknown: .unknown,
    ]

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
        GMSPlacesClient.shared().findAutocompletePredictions(
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

    func getDetailById(placeId: String, fields: [PlaceFields], completion: @escaping (Result<PlaceItem?, Error>) -> Void) {
        var fieldValue = UInt(0)
        for item in fields {
            if let next = GmsPlacesApiImpl.fieldDict[item] {
                fieldValue = fieldValue | UInt(next.rawValue)
            }
        }
        let field = GMSPlaceField(rawValue: fieldValue)
        GMSPlacesClient.shared().fetchPlace(fromPlaceID: placeId, placeFields: field, sessionToken: GmsPlacesApiImpl.token) { place, error in
            if error != nil {
                completion(.failure(FlutterError(code: "error", message: error!.localizedDescription, details: error.debugDescription)))
            } else {
                if place == nil {
                    completion(.success(nil))
                } else {
                    var rawAddressComponents: [AddressComponent] = []
                    if place!.addressComponents != nil {
                        for item in place!.addressComponents! {
                            rawAddressComponents.append(AddressComponent(
                                name: item.name,
                                shortName: item.shortName,
                                rawTypes: item.types
                            ))
                        }
                    }
                    var plusCode: PlacePlusCode?
                    if let rawPlusCode = place!.plusCode {
                        plusCode = PlacePlusCode(
                            globalCode: rawPlusCode.globalCode,
                            compoundCode: rawPlusCode.compoundCode
                        )
                    }

                    var viewPort: PlaceViewport?
                    if let viewPortInfo = place!.viewportInfo {
                        viewPort = PlaceViewport(
                            northEast: PlaceCoordinate(
                                latitude: viewPortInfo.northEast.latitude,
                                longitude: viewPortInfo.northEast.longitude
                            ),
                            southWest: PlaceCoordinate(
                                latitude: viewPortInfo.southWest.latitude,
                                longitude: viewPortInfo.southWest.longitude
                            ),
                            valid: viewPortInfo.isValid
                        )
                    }

                    completion(.success(PlaceItem(
                        formattedAddress: place!.formattedAddress,
                        rawAddressComponents: rawAddressComponents,
                        businessStatus: GmsPlacesApiImpl.businessStatusDict[place!.businessStatus] ?? .unknown,
                        placeId: place!.placeID,
                        coordinate: PlaceCoordinate(
                            latitude: place!.coordinate.latitude,
                            longitude: place!.coordinate.longitude
                        ),
                        name: place!.name,
                        plusCode: plusCode,
                        rawTypes: place!.types,
                        viewport: viewPort
                    )))
                }
            }
        }
    }
}

class TokenEmptyError: Error {}
