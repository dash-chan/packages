// Autogenerated from Pigeon (v12.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum PlacesFilterType: Int {
  /// Geocoding results, as opposed to business results.
  case geocode = 0
  /// Geocoding results with a precise address.
  case address = 1
  /// Business results.
  case establishment = 2
  /// * Results that match the following types:
  /// * "locality",
  /// * "sublocality"
  /// * "postal_code",
  /// * "country",
  /// * "administrative_area_level_1",
  /// * "administrative_area_level_2"
  case region = 3
  /// * Results that match the following types:
  /// * "locality",
  /// * "administrative_area_level_3"
  case city = 4
}

/// Generated class from Pigeon that represents data sent in messages.
struct Prediction {
  var attributed: PredictionAttributed
  var placeID: String
  var rawTypes: [String?]
  var distanceMeters: Double? = nil

  static func fromList(_ list: [Any?]) -> Prediction? {
    let attributed = PredictionAttributed.fromList(list[0] as! [Any?])!
    let placeID = list[1] as! String
    let rawTypes = list[2] as! [String?]
    let distanceMeters: Double? = nilOrValue(list[3])

    return Prediction(
      attributed: attributed,
      placeID: placeID,
      rawTypes: rawTypes,
      distanceMeters: distanceMeters
    )
  }
  func toList() -> [Any?] {
    return [
      attributed.toList(),
      placeID,
      rawTypes,
      distanceMeters,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct PredictionAttributed {
  var fullText: String
  var primaryText: String
  var secondaryText: String? = nil

  static func fromList(_ list: [Any?]) -> PredictionAttributed? {
    let fullText = list[0] as! String
    let primaryText = list[1] as! String
    let secondaryText: String? = nilOrValue(list[2])

    return PredictionAttributed(
      fullText: fullText,
      primaryText: primaryText,
      secondaryText: secondaryText
    )
  }
  func toList() -> [Any?] {
    return [
      fullText,
      primaryText,
      secondaryText,
    ]
  }
}

private class GmsPlacesApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return Prediction.fromList(self.readValue() as! [Any?])
      case 129:
        return PredictionAttributed.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class GmsPlacesApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Prediction {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? PredictionAttributed {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class GmsPlacesApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return GmsPlacesApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return GmsPlacesApiCodecWriter(data: data)
  }
}

class GmsPlacesApiCodec: FlutterStandardMessageCodec {
  static let shared = GmsPlacesApiCodec(readerWriter: GmsPlacesApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol GmsPlacesApi {
  func ensureInitialized() throws
  func autocomplete(fromQuery: String, filter: PlacesFilterType, completion: @escaping (Result<[Prediction], Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class GmsPlacesApiSetup {
  /// The codec used by GmsPlacesApi.
  static var codec: FlutterStandardMessageCodec { GmsPlacesApiCodec.shared }
  /// Sets up an instance of `GmsPlacesApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: GmsPlacesApi?) {
    let ensureInitializedChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.gms_places_api.GmsPlacesApi.ensureInitialized", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      ensureInitializedChannel.setMessageHandler { _, reply in
        do {
          try api.ensureInitialized()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      ensureInitializedChannel.setMessageHandler(nil)
    }
    let autocompleteChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.gms_places_api.GmsPlacesApi.autocomplete", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      autocompleteChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let fromQueryArg = args[0] as! String
        let filterArg = PlacesFilterType(rawValue: args[1] as! Int)!
        api.autocomplete(fromQuery: fromQueryArg, filter: filterArg) { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      autocompleteChannel.setMessageHandler(nil)
    }
  }
}
