package dev.laihz.gms_places_api

import android.content.Context
import com.google.android.libraries.places.api.Places
import com.google.android.libraries.places.api.model.AutocompleteSessionToken
import com.google.android.libraries.places.api.model.Place
import com.google.android.libraries.places.api.model.PlaceTypes
import com.google.android.libraries.places.api.net.FetchPlaceRequest
import com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest

class GmsPlacesApiImpl(private val context: Context) : GmsPlacesApi {
    companion object {
        var token: AutocompleteSessionToken? = null
    }

    override fun ensureInitialized() {
        token = AutocompleteSessionToken.newInstance()
    }

    override fun autocomplete(
        fromQuery: String,
        filter: PlacesFilterType,
        callback: (Result<List<Prediction>>) -> Unit
    ) {
        val filter = when (filter) {
            PlacesFilterType.GEOCODE -> PlaceTypes.GEOCODE
            PlacesFilterType.ADDRESS -> PlaceTypes.ADDRESS
            PlacesFilterType.ESTABLISHMENT -> PlaceTypes.ESTABLISHMENT
            PlacesFilterType.REGION -> PlaceTypes.REGIONS
            PlacesFilterType.CITY -> PlaceTypes.ADDRESS
        }
        val req = FindAutocompletePredictionsRequest.builder()
            .setTypesFilter(listOf(filter))
            .setSessionToken(token)
            .setQuery(fromQuery)
            .build()

        Places.createClient(context).findAutocompletePredictions(req)
            .addOnSuccessListener { response ->
                val items = mutableListOf<Prediction>()
                for (item in response.autocompletePredictions) {
                    items.add(
                        Prediction(
                            attributed = PredictionAttributed(
                                fullText = item.getFullText(null).toString(),
                                primaryText = item.getPrimaryText(null).toString(),
                                secondaryText = item.getSecondaryText(null).toString(),
                            ),
                            placeID = item.placeId,
                            rawTypes = item.placeTypes.map { it -> it.name }
                        )
                    )
                }
                callback(Result.success(items))
            }
            .addOnFailureListener { exception ->
                callback(Result.failure(exception))
            }
    }

    override fun getDetailById(
        placeId: String,
        fields: List<PlaceFields>,
        callback: (Result<PlaceItem?>) -> Unit
    ) {
        val placeFields = fields.map { it ->
            when (it) {
                PlaceFields.FORMATTEDADDRESS -> Place.Field.ADDRESS
                PlaceFields.ADDRESSCOMPONENTS -> Place.Field.ADDRESS_COMPONENTS
                PlaceFields.BUSINESSSTATUS -> Place.Field.BUSINESS_STATUS
                PlaceFields.PLACEID -> Place.Field.ID
                PlaceFields.COORDINATE -> Place.Field.LAT_LNG
                PlaceFields.NAME -> Place.Field.NAME
                PlaceFields.PHOTOS -> Place.Field.PHOTO_METADATAS
                PlaceFields.PLUSCODE -> Place.Field.PLUS_CODE
                PlaceFields.TYPES -> Place.Field.TYPES
                PlaceFields.VIEWPORT -> Place.Field.VIEWPORT
            }
        }
        val req = FetchPlaceRequest.newInstance(
            placeId,
            placeFields
        )
        Places.createClient(context).fetchPlace(req)
            .addOnSuccessListener { response ->
                val place = response.place
                callback(
                    Result.success(
                        PlaceItem(
                            formattedAddress = place.address,
                            rawAddressComponents = place.addressComponents?.asList()?.map { it ->
                                AddressComponent(
                                    name = it.name,
                                    shortName = it.shortName,
                                    rawTypes = it.types
                                )
                            } ?: listOf(),
                            businessStatus = when(place.businessStatus) {
                                Place.BusinessStatus.OPERATIONAL -> PlacesBusinessStatus.OPERATIONAL
                                Place.BusinessStatus.CLOSED_TEMPORARILY -> PlacesBusinessStatus.CLOSEDTEMPORARILY
                                Place.BusinessStatus.CLOSED_PERMANENTLY -> PlacesBusinessStatus.CLOSEDTEMPORARILY
                                else -> PlacesBusinessStatus.OPERATIONAL
                            },
                            placeId = place.id,
                            coordinate = place.latLng?.let {
                                PlaceCoordinate(
                                    latitude = it.latitude,
                                    longitude = it.longitude
                                )
                            },
                            name = place.name,
                            plusCode = place.plusCode?.let {
                                PlacePlusCode(
                                    globalCode = it.globalCode ?: "",
                                    compoundCode = it.compoundCode
                                )
                            },
                            rawTypes = place.types?.map { it -> it.name }?.toList(),
                            viewport = place.viewport?.let {
                                PlaceViewport(
                                    northEast = PlaceCoordinate(
                                        latitude = it.northeast.latitude,
                                        longitude = it.northeast.longitude,
                                    ),
                                    southWest = PlaceCoordinate(
                                        latitude = it.southwest.latitude,
                                        longitude = it.southwest.longitude,
                                    ),
                                    valid = true,
                                )
                            }
                        )
                    )
                )
            }
            .addOnFailureListener { exception ->
                callback(Result.failure(exception))
            }
    }

}

