import android.content.Context
import android.os.Build
import androidx.annotation.Keep

@Keep
class AndroidContext(private val context: Context) {
    val packageName: String = context.packageName
    fun getApplicationInfo(): Unit {
        context.applicationInfo
        Build.TIME
    }
}

@Keep
class AndroidPackageManager(private val context: Context) {

}