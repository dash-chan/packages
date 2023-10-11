// Autogenerated from Pigeon (v12.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package dev.laihz.gms_places_api

import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  if (exception is FlutterError) {
    return listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    return listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class FlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()

enum class PlacesFilterType(val raw: Int) {
  /** Geocoding results, as opposed to business results. */
  GEOCODE(0),
  /** Geocoding results with a precise address. */
  ADDRESS(1),
  /** Business results. */
  ESTABLISHMENT(2),
  /**
   * * Results that match the following types:
   * * "locality",
   * * "sublocality"
   * * "postal_code",
   * * "country",
   * * "administrative_area_level_1",
   * * "administrative_area_level_2"
   */
  REGION(3),
  /**
   * * Results that match the following types:
   * * "locality",
   * * "administrative_area_level_3"
   */
  CITY(4);

  companion object {
    fun ofRaw(raw: Int): PlacesFilterType? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

enum class PlaceFields(val raw: Int) {
  FORMATTEDADDRESS(0),
  ADDRESSCOMPONENTS(1),
  BUSINESSSTATUS(2),
  PLACEID(3),
  COORDINATE(4),
  NAME(5),
  PHOTOS(6),
  PLUSCODE(7),
  TYPES(8),
  VIEWPORT(9);

  companion object {
    fun ofRaw(raw: Int): PlaceFields? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

enum class PlacesBusinessStatus(val raw: Int) {
  /** The business status is not known */
  UNKNOWN(0),
  /** The business is operational */
  OPERATIONAL(1),
  /** The business is closed temporarily */
  CLOSEDTEMPORARILY(2),
  /** The business is closed permanently */
  CLOSEDPERMANENTLY(3);

  companion object {
    fun ofRaw(raw: Int): PlacesBusinessStatus? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class Prediction (
  val attributed: PredictionAttributed,
  val placeID: String,
  val rawTypes: List<String?>,
  val distanceMeters: Double? = null

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): Prediction {
      val attributed = PredictionAttributed.fromList(list[0] as List<Any?>)
      val placeID = list[1] as String
      val rawTypes = list[2] as List<String?>
      val distanceMeters = list[3] as Double?
      return Prediction(attributed, placeID, rawTypes, distanceMeters)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      attributed.toList(),
      placeID,
      rawTypes,
      distanceMeters,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class PredictionAttributed (
  val fullText: String,
  val primaryText: String,
  val secondaryText: String? = null

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): PredictionAttributed {
      val fullText = list[0] as String
      val primaryText = list[1] as String
      val secondaryText = list[2] as String?
      return PredictionAttributed(fullText, primaryText, secondaryText)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      fullText,
      primaryText,
      secondaryText,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class PlaceItem (
  val formattedAddress: String? = null,
  val rawAddressComponents: List<AddressComponent?>,
  val businessStatus: PlacesBusinessStatus,
  val placeId: String? = null,
  val coordinate: PlaceCoordinate? = null,
  val name: String? = null,
  val plusCode: PlacePlusCode? = null,
  val rawTypes: List<String?>? = null,
  val viewport: PlaceViewport? = null

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): PlaceItem {
      val formattedAddress = list[0] as String?
      val rawAddressComponents = list[1] as List<AddressComponent?>
      val businessStatus = PlacesBusinessStatus.ofRaw(list[2] as Int)!!
      val placeId = list[3] as String?
      val coordinate: PlaceCoordinate? = (list[4] as List<Any?>?)?.let {
        PlaceCoordinate.fromList(it)
      }
      val name = list[5] as String?
      val plusCode: PlacePlusCode? = (list[6] as List<Any?>?)?.let {
        PlacePlusCode.fromList(it)
      }
      val rawTypes = list[7] as List<String?>?
      val viewport: PlaceViewport? = (list[8] as List<Any?>?)?.let {
        PlaceViewport.fromList(it)
      }
      return PlaceItem(formattedAddress, rawAddressComponents, businessStatus, placeId, coordinate, name, plusCode, rawTypes, viewport)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      formattedAddress,
      rawAddressComponents,
      businessStatus.raw,
      placeId,
      coordinate?.toList(),
      name,
      plusCode?.toList(),
      rawTypes,
      viewport?.toList(),
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class AddressComponent (
  val name: String,
  val shortName: String? = null,
  val rawTypes: List<String?>

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): AddressComponent {
      val name = list[0] as String
      val shortName = list[1] as String?
      val rawTypes = list[2] as List<String?>
      return AddressComponent(name, shortName, rawTypes)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      name,
      shortName,
      rawTypes,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class PlaceCoordinate (
  val latitude: Double,
  val longitude: Double

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): PlaceCoordinate {
      val latitude = list[0] as Double
      val longitude = list[1] as Double
      return PlaceCoordinate(latitude, longitude)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      latitude,
      longitude,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class PlacePlusCode (
  val globalCode: String,
  val compoundCode: String? = null

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): PlacePlusCode {
      val globalCode = list[0] as String
      val compoundCode = list[1] as String?
      return PlacePlusCode(globalCode, compoundCode)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      globalCode,
      compoundCode,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class PlaceViewport (
  val northEast: PlaceCoordinate,
  val southWest: PlaceCoordinate,
  val valid: Boolean

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): PlaceViewport {
      val northEast = PlaceCoordinate.fromList(list[0] as List<Any?>)
      val southWest = PlaceCoordinate.fromList(list[1] as List<Any?>)
      val valid = list[2] as Boolean
      return PlaceViewport(northEast, southWest, valid)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      northEast.toList(),
      southWest.toList(),
      valid,
    )
  }
}

@Suppress("UNCHECKED_CAST")
private object GmsPlacesApiCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      128.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          AddressComponent.fromList(it)
        }
      }
      129.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          PlaceCoordinate.fromList(it)
        }
      }
      130.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          PlaceCoordinate.fromList(it)
        }
      }
      131.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          PlaceItem.fromList(it)
        }
      }
      132.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          PlacePlusCode.fromList(it)
        }
      }
      133.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          PlaceViewport.fromList(it)
        }
      }
      134.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          Prediction.fromList(it)
        }
      }
      135.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          PredictionAttributed.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is AddressComponent -> {
        stream.write(128)
        writeValue(stream, value.toList())
      }
      is PlaceCoordinate -> {
        stream.write(129)
        writeValue(stream, value.toList())
      }
      is PlaceCoordinate -> {
        stream.write(130)
        writeValue(stream, value.toList())
      }
      is PlaceItem -> {
        stream.write(131)
        writeValue(stream, value.toList())
      }
      is PlacePlusCode -> {
        stream.write(132)
        writeValue(stream, value.toList())
      }
      is PlaceViewport -> {
        stream.write(133)
        writeValue(stream, value.toList())
      }
      is Prediction -> {
        stream.write(134)
        writeValue(stream, value.toList())
      }
      is PredictionAttributed -> {
        stream.write(135)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface GmsPlacesApi {
  fun ensureInitialized()
  fun autocomplete(fromQuery: String, filter: PlacesFilterType, callback: (Result<List<Prediction>>) -> Unit)
  fun getDetailById(placeId: String, fields: List<PlaceFields>, callback: (Result<PlaceItem?>) -> Unit)

  companion object {
    /** The codec used by GmsPlacesApi. */
    val codec: MessageCodec<Any?> by lazy {
      GmsPlacesApiCodec
    }
    /** Sets up an instance of `GmsPlacesApi` to handle messages through the `binaryMessenger`. */
    @Suppress("UNCHECKED_CAST")
    fun setUp(binaryMessenger: BinaryMessenger, api: GmsPlacesApi?) {
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.gms_places_api.GmsPlacesApi.ensureInitialized", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            var wrapped: List<Any?>
            try {
              api.ensureInitialized()
              wrapped = listOf<Any?>(null)
            } catch (exception: Throwable) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.gms_places_api.GmsPlacesApi.autocomplete", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val fromQueryArg = args[0] as String
            val filterArg = PlacesFilterType.ofRaw(args[1] as Int)!!
            api.autocomplete(fromQueryArg, filterArg) { result: Result<List<Prediction>> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.gms_places_api.GmsPlacesApi.getDetailById", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val placeIdArg = args[0] as String
            val fieldsArg = args[1] as List<PlaceFields>
            api.getDetailById(placeIdArg, fieldsArg) { result: Result<PlaceItem?> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
