package dev.laihz.gms_places_api

import android.content.Context
import com.google.android.libraries.places.api.Places
import com.google.android.libraries.places.api.model.AutocompleteSessionToken
import com.google.android.libraries.places.api.model.PlaceTypes
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
            .addOnSuccessListener {response ->
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
            .addOnFailureListener {exception ->
                callback(Result.failure(exception))
            }
    }


}

