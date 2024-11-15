Easily retrieve information about the current Android build synchronously.

> [!IMPORTANT]
> This package is currently **experimental** and may change in non-breaking ways in the future.
> version 0.X.X still in development and may not ready for production use.

## Example

install example app

```shell
cd example
flutter pub get
flutter build apk --target-platform android-arm64
flutter install --release
```

## Usage

[API Documentation](https://pub.dev/documentation/android_os_build/latest/)

### Add package

* run in command line

```shell
flutter pub add android_os_build
```

* or add to `pubspec.yaml`

```yaml
...
dependencies:
  android_os_build: any
...
```

### Get build information

```dart
import 'package:android_os_build/android_os_build.dart';

final model = Build.model;
final sdkInt = Build.version.sdkInt;
```

> `AndroidBuild.getSerial()` require `android.permission.READ_PRIVILEGED_PHONE_STATE` permission, so if you want to get serial number, you need to add this permission to your `AndroidManifest.xml` file.
> ```xml
> <manifest xmlns:android="http://schemas.android.com/apk/res/android">
>   <uses-permission android:name="android.permission.READ_PRIVILEGED_PHONE_STATE" />
>   ......
> </manifest>
> ```

### Direct use generated ffi code

```dart
import 'package:android_os_build/android_os_build_jni.dart';

String getBoard() {
  final JString board = Build.BOARD;
  /// return value and release the string object
  return board.toDartString(releaseOriginal: true);
}
```

## Development

you should build apk first then run jnigen
```shell
cd example
flutter build apk
cd ..
flutter pub run jnigen --config jnigen.yaml
```

## License

* package is under [MIT](LICENSE) license
  
> The Android robot is reproduced or modified from work created and shared by Google and used according to terms described in the [Creative Commons](https://creativecommons.org/licenses/by/3.0/) 3.0 Attribution License.