package dev.laihz.android_build

import android.annotation.SuppressLint
import android.os.Build
import android.os.Build.VERSION
import androidx.annotation.NonNull
import dev.laihz.android_builds.generated.ABIFilter
import dev.laihz.android_builds.generated.BuildApi
import dev.laihz.android_builds.generated.Partition

import io.flutter.embedding.engine.plugins.FlutterPlugin

/** AndroidBuildsPlugin */
class AndroidBuildPlugin : FlutterPlugin, BuildApi {

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        BuildApi.setUp(flutterPluginBinding.binaryMessenger, this)
    }


    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        BuildApi.setUp(binding.binaryMessenger, null)
    }

    override fun board(): String {
        return Build.BOARD
    }

    override fun bootloader(): String {
        return Build.BOOTLOADER
    }

    override fun brand(): String {
        return Build.BRAND
    }

    override fun device(): String {
        return Build.DEVICE
    }

    override fun display(): String {
        return Build.DISPLAY
    }

    override fun fingerprint(): String {
       return Build.FINGERPRINT
    }

    override fun hardware(): String {
        return Build.HARDWARE
    }

    override fun host(): String {
        return Build.HOST
    }

    override fun id(): String {
        return Build.ID
    }

    override fun manufacturer(): String {
        return Build.MANUFACTURER
    }

    override fun model(): String {
        return Build.MODEL
    }

    override fun odmSku(): String {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            Build.ODM_SKU
        } else {
            Build.UNKNOWN
        }
    }

    override fun product(): String {
        return Build.PRODUCT
    }

    @SuppressLint("MissingPermission")
    override fun getSerial(): String? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Build.getSerial()
        } else {
            null
        }
    }

    override fun sku(): String? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            Build.SKU
        } else {
            null
        }
    }

    override fun socManufacturer(): String? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            Build.SOC_MANUFACTURER
        } else {
            null
        }
    }

    override fun socModel(): String? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            Build.SOC_MODEL
        } else {
            null
        }
    }

    override fun supportedAbis(filter: ABIFilter): List<String> {
        if(VERSION.SDK_INT <= Build.VERSION_CODES.LOLLIPOP) return listOf()
        return when(filter) {
            ABIFilter.ALL -> Build.SUPPORTED_ABIS.asList()
            ABIFilter.U32 -> Build.SUPPORTED_32_BIT_ABIS.asList()
            ABIFilter.U64 -> Build.SUPPORTED_64_BIT_ABIS.asList()
        }
    }



    override fun tags(): String {
        return Build.TAGS
    }

    override fun time(): Long {
        return Build.TIME
    }

    override fun type(): String {
        return Build.TYPE
    }

    override fun user(): String {
        return Build.USER
    }

    override fun getFingerprintedPartitions(): List<Partition> {
        return if (VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            Build.getFingerprintedPartitions().map { p -> Partition(p.buildTimeMillis, p.fingerprint) }
        } else {
            listOf<Partition>()
        }

    }

    override fun radioVersion(): String {
        return Build.getRadioVersion()
    }
}
