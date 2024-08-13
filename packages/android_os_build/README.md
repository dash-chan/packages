Information about the current build, extracted from system properties.

> [!IMPORTANT]
> This package is currently **experimental** and may change in non-breaking ways in the future.

## Example

install example app

```shell
cd example
flutter pub get
flutter build apk --target-platform android-arm64
flutter install --release
```

## Usage

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

final model = AndroidBuild.model;
final sdkInt = AndroidBuild.version.sdkInt;
```

> `AndroidBuild.getSerial()` require `android.permission.READ_PRIVILEGED_PHONE_STATE` permission, so if you want to get serial number, you need to add this permission to your `AndroidManifest.xml` file.
> ```xml
> <manifest xmlns:android="http://schemas.android.com/apk/res/android">
>   <uses-permission android:name="android.permission.READ_PRIVILEGED_PHONE_STATE" />
>   ......
> </manifest>
> ```

### Direct use generated code

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