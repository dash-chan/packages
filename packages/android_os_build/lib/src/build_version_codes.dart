import 'package:android_os_build/generated/android_os_build.g.dart' as $p;

/// The currently known Android SDK version codes.
///
/// These are the values reported by [BuildVersion.sdkInt]. Version numbers
/// increase monotonically with each official platform release.
///
/// See the
/// [Android `Build.VERSION_CODES` documentation][android-version-codes].
///
/// [android-version-codes]:
/// https://developer.android.com/reference/android/os/Build.VERSION_CODES
enum BuildVersionCodes {
  /// The original, first, version of Android. Yay!
  ///
  /// Released publicly as Android 1.0 in September 2008.
  base($p.Build$VERSION_CODES.BASE),

  /// First Android update.
  ///
  /// Released publicly as Android 1.1 in February 2009.
  base_1_1($p.Build$VERSION_CODES.BASE_1_1),

  /// C.
  ///
  /// Released publicly as Android 1.5 in April 2009.
  cupcake($p.Build$VERSION_CODES.CUPCAKE),

  /// D.
  ///
  /// Released publicly as Android 1.6 in September 2009.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior:
  ///
  /// * They must explicitly request the
  ///   [Manifest.permission.WRITE_EXTERNAL_STORAGE][donut-doc-1] permission to
  ///   be able to modify the contents of the SD card. (Apps targeting earlier
  ///   versions will always request the permission.)
  /// * They must explicitly request the
  ///   [Manifest.permission.READ_PHONE_STATE][donut-doc-2] permission to be
  ///   able to be able to retrieve phone state info. (Apps targeting earlier
  ///   versions will always request the permission.)
  /// * They are assumed to support different screen densities and sizes. (Apps
  ///   targeting earlier versions are assumed to only support medium density
  ///   normal size screens unless otherwise indicated). They can still
  ///   explicitly specify screen support either way with the supports-screens
  ///   manifest tag.
  /// * [TabHost][donut-doc-3] will use the new dark tab background design.
  ///
  /// [donut-doc-1]:
  /// https://d.android.com/reference/android/Manifest.permission#WRITE_EXTERNAL_STORAGE
  ///
  /// [donut-doc-2]:
  /// https://d.android.com/reference/android/Manifest.permission#READ_PHONE_STATE
  ///
  /// [donut-doc-3]:
  /// https://d.android.com/reference/android/widget/TabHost
  donut($p.Build$VERSION_CODES.DONUT),

  /// E.
  ///
  /// Released publicly as Android 2.0 in October 2009.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior:
  ///
  /// * The [Service.onStartCommand][eclair-doc-1] function will return the new
  ///   [Service.START_STICKY][eclair-doc-2] behavior instead of the old
  ///   compatibility [Service.START_STICKY_COMPATIBILITY][eclair-doc-3].
  /// * The [Activity][eclair-doc-4] class will now execute back key presses on
  ///   the key up instead of key down, to be able to detect canceled presses
  ///   from virtual keys.
  /// * The [TabWidget][eclair-doc-5] class will use a new color scheme for
  ///   tabs. In the new scheme, the foreground tab has a medium gray background
  ///   the background tabs have a dark gray background.
  ///
  /// [eclair-doc-1]:
  /// https://d.android.com/reference/android/app/Service#onStartCommand
  ///
  /// [eclair-doc-2]:
  /// https://d.android.com/reference/android/app/Service#START_STICKY
  ///
  /// [eclair-doc-3]:
  /// https://d.android.com/reference/android/app/Service#START_STICKY_COMPATIBILITY
  ///
  /// [eclair-doc-4]:
  /// https://d.android.com/reference/android/app/Activity
  ///
  /// [eclair-doc-5]:
  /// https://d.android.com/reference/android/widget/TabWidget
  eclair($p.Build$VERSION_CODES.ECLAIR),

  /// E incremental update.
  ///
  /// Released publicly as Android 2.0.1 in December 2009.
  ///
  /// Deprecated in favor of [eclair_0_1].
  @Deprecated('use eclair_0_1')
  eclair01($p.Build$VERSION_CODES.ECLAIR_0_1),

  /// E incremental update.
  ///
  /// Released publicly as Android 2.0.1 in December 2009.
  eclair_0_1($p.Build$VERSION_CODES.ECLAIR_0_1),

  /// E MR1.
  ///
  /// Released publicly as Android 2.1 in January 2010.
  eclairMr1($p.Build$VERSION_CODES.ECLAIR_MR1),

  /// F.
  ///
  /// Released publicly as Android 2.2 in May 2010.
  froyo($p.Build$VERSION_CODES.FROYO),

  /// G.
  ///
  /// Released publicly as Android 2.3 in December 2010.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior:
  ///
  /// * The application's notification icons will be shown on the new dark
  ///   status bar background, so must be visible in this situation.
  gingerbread($p.Build$VERSION_CODES.GINGERBREAD),

  /// G MR1.
  ///
  /// Released publicly as Android 2.3.3 in February 2011.
  gingerbreadMr1($p.Build$VERSION_CODES.GINGERBREAD_MR1),

  /// H.
  ///
  /// Released publicly as Android 3.0 in February 2011.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior:
  ///
  /// * The default theme for applications is now dark holographic:
  ///   [R.style.Theme_Holo][honeycomb-doc-1].
  /// * On large screen devices that do not have a physical menu button, the
  ///   soft (compatibility) menu is disabled.
  /// * The activity lifecycle has changed slightly as per
  ///   [Activity][honeycomb-doc-2].
  /// * An application will crash if it does not call through to the super
  ///   implementation of its [Activity.onPause][honeycomb-doc-3] method.
  /// * When an application requires a permission to access one of its
  ///   components (activity, receiver, service, provider), this permission is
  ///   no longer enforced when the application wants to access its own
  ///   component. This means it can require a permission on a component that it
  ///   does not itself hold and still access that component.
  /// * [Context.getSharedPreferences][honeycomb-doc-4] will not automatically
  ///   reload the preferences if they have changed on storage, unless
  ///   [Context.MODE_MULTI_PROCESS][honeycomb-doc-5] is used.
  /// * [ViewGroup.setMotionEventSplittingEnabled][honeycomb-doc-6] will default
  ///   to true.
  /// * [LayoutParams.FLAG_SPLIT_TOUCH][honeycomb-doc-7] is enabled by default
  ///   on windows.
  /// * [PopupWindow.isSplitTouchEnabled][honeycomb-doc-8] will return true by
  ///   default.
  /// * [GridView][honeycomb-doc-9] and [ListView][honeycomb-doc-10] will use
  ///   [View.setActivated][honeycomb-doc-11] for selected items if they do not
  ///   implement [Checkable][honeycomb-doc-12].
  /// * [Scroller][honeycomb-doc-13] will be constructed with "flywheel"
  ///   behavior enabled by default.
  ///
  /// [honeycomb-doc-1]:
  /// https://d.android.com/reference/android/R.style#Theme_Holo
  ///
  /// [honeycomb-doc-2]:
  /// https://d.android.com/reference/android/app/Activity
  ///
  /// [honeycomb-doc-3]:
  /// https://d.android.com/reference/android/app/Activity#onPause
  ///
  /// [honeycomb-doc-4]:
  /// https://d.android.com/reference/android/content/Context#getSharedPreferences
  ///
  /// [honeycomb-doc-5]:
  /// https://d.android.com/reference/android/content/Context#MODE_MULTI_PROCESS
  ///
  /// [honeycomb-doc-6]:
  /// https://d.android.com/reference/android/view/ViewGroup#setMotionEventSplittingEnabled
  ///
  /// [honeycomb-doc-7]:
  /// https://d.android.com/reference/android/view/WindowManager.LayoutParams#FLAG_SPLIT_TOUCH
  ///
  /// [honeycomb-doc-8]:
  /// https://d.android.com/reference/android/widget/PopupWindow#isSplitTouchEnabled()
  ///
  /// [honeycomb-doc-9]:
  /// https://d.android.com/reference/android/widget/GridView
  ///
  /// [honeycomb-doc-10]:
  /// https://d.android.com/reference/android/widget/ListView
  ///
  /// [honeycomb-doc-11]:
  /// https://d.android.com/reference/android/view/View#setActivated
  ///
  /// [honeycomb-doc-12]:
  /// https://d.android.com/reference/android/widget/Checkable
  ///
  /// [honeycomb-doc-13]:
  /// https://d.android.com/reference/android/widget/Scroller
  honeycomb($p.Build$VERSION_CODES.HONEYCOMB),

  /// H MR1.
  ///
  /// Released publicly as Android 3.1 in May 2011.
  honeycombMr1($p.Build$VERSION_CODES.HONEYCOMB_MR1),

  /// H MR2.
  ///
  /// Released publicly as Android 3.2 in July 2011.
  ///
  /// Update to Honeycomb MR1 to support 7 inch tablets, improve screen
  /// compatibility mode, etc.
  ///
  /// As of this version, applications that don't say whether they support
  /// XLARGE screens will be assumed to do so only if they target [honeycomb] or
  /// later; it had been [gingerbread] or later. Applications that don't support
  /// a screen size at least as large as the current screen will provide the
  /// user with a UI to switch them in to screen size compatibility mode.
  ///
  /// This version introduces new screen size resource qualifiers based on the
  /// screen size in dp: see [Configuration.screenWidthDp][honeycomb-mr2-doc-1],
  /// [Configuration.screenHeightDp][honeycomb-mr2-doc-2], and
  /// [Configuration.smallestScreenWidthDp][honeycomb-mr2-doc-3]. Supplying
  /// these in `supports-screens` as per
  /// [ApplicationInfo.requiresSmallestWidthDp][honeycomb-mr2-doc-4],
  /// [ApplicationInfo.compatibleWidthLimitDp][honeycomb-mr2-doc-5], and
  /// [ApplicationInfo.largestWidthLimitDp][honeycomb-mr2-doc-6] is preferred
  /// over the older screen size buckets and for older devices the appropriate
  /// buckets will be inferred from them.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior:
  ///
  /// * New [PackageManager.FEATURE_SCREEN_PORTRAIT][honeycomb-mr2-doc-7] and
  ///   [PackageManager.FEATURE_SCREEN_LANDSCAPE][honeycomb-mr2-doc-8] features
  ///   were introduced in this release. Applications that target previous
  ///   platform versions are assumed to require both portrait and landscape
  ///   support in the device; when targeting Honeycomb MR1 or greater the
  ///   application is responsible for specifying any specific orientation it
  ///   requires.
  /// * [AsyncTask][honeycomb-mr2-doc-9] will use the serial executor by default
  ///   when calling [AsyncTask.execute][honeycomb-mr2-doc-10].
  /// * [ActivityInfo.configChanges][honeycomb-mr2-doc-11] will have the
  ///   [ActivityInfo.CONFIG_SCREEN_SIZE][honeycomb-mr2-doc-12] and
  ///   [ActivityInfo.CONFIG_SMALLEST_SCREEN_SIZE][honeycomb-mr2-doc-13] bits
  ///   set; these need to be cleared for older applications because some
  ///   developers have done absolute comparisons against this value instead of
  ///   correctly masking the bits they are interested in.
  ///
  /// [honeycomb-mr2-doc-1]:
  /// https://d.android.com/reference/android/content/res/Configuration#screenWidthDp
  ///
  /// [honeycomb-mr2-doc-2]:
  /// https://d.android.com/reference/android/content/res/Configuration#screenHeightDp
  ///
  /// [honeycomb-mr2-doc-3]:
  /// https://d.android.com/reference/android/content/res/Configuration#smallestScreenWidthDp
  ///
  /// [honeycomb-mr2-doc-4]:
  /// https://d.android.com/reference/android/content/pm/ApplicationInfo#requiresSmallestWidthDp
  ///
  /// [honeycomb-mr2-doc-5]:
  /// https://d.android.com/reference/android/content/pm/ApplicationInfo#compatibleWidthLimitDp
  ///
  /// [honeycomb-mr2-doc-6]:
  /// https://d.android.com/reference/android/content/pm/ApplicationInfo#largestWidthLimitDp
  ///
  /// [honeycomb-mr2-doc-7]:
  /// https://d.android.com/reference/android/content/pm/PackageManager#FEATURE_SCREEN_PORTRAIT
  ///
  /// [honeycomb-mr2-doc-8]:
  /// https://d.android.com/reference/android/content/pm/PackageManager#FEATURE_SCREEN_LANDSCAPE
  ///
  /// [honeycomb-mr2-doc-9]:
  /// https://d.android.com/reference/android/os/AsyncTask
  ///
  /// [honeycomb-mr2-doc-10]:
  /// https://d.android.com/reference/android/os/AsyncTask#execute
  ///
  /// [honeycomb-mr2-doc-11]:
  /// https://d.android.com/reference/android/content/pm/ActivityInfo#configChanges
  ///
  /// [honeycomb-mr2-doc-12]:
  /// https://d.android.com/reference/android/content/pm/ActivityInfo#CONFIG_SCREEN_SIZE
  ///
  /// [honeycomb-mr2-doc-13]:
  /// https://d.android.com/reference/android/content/pm/ActivityInfo#CONFIG_SMALLEST_SCREEN_SIZE
  honeycombMr2($p.Build$VERSION_CODES.HONEYCOMB_MR2),

  /// I.
  ///
  /// Released publicly as Android 4.0 in October 2011.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior:
  ///
  /// * For devices without a dedicated menu key, the software compatibility
  ///   menu key will not be shown even on phones. By targeting Ice Cream
  ///   Sandwich or later, your UI must always have its own menu UI affordance
  ///   if needed, on both tablets and phones. The ActionBar will take care of
  ///   this for you.
  /// * 2d drawing hardware acceleration is now turned on by default. You can
  ///   use [android:hardwareAccelerated][ice-cream-sandwich-doc-1] to turn it
  ///   off if needed, although this is strongly discouraged since it will
  ///   result in poor performance on larger screen devices.
  /// * The default theme for applications is now the "device default" theme:
  ///   [R.style.Theme_DeviceDefault][ice-cream-sandwich-doc-2]. This may be the
  ///   holo dark theme or a different dark theme defined by the specific
  ///   device. The [R.style.Theme_Holo][ice-cream-sandwich-doc-3] family must
  ///   not be modified for a device to be considered compatible. Applications
  ///   that explicitly request a theme from the Holo family will be guaranteed
  ///   that these themes will not change character within the same platform
  ///   version. Applications that wish to blend in with the device should use a
  ///   theme from the [R.style.Theme_DeviceDefault][ice-cream-sandwich-doc-2]
  ///   family.
  /// * Managed cursors can now throw an exception if you directly close the
  ///   cursor yourself without stopping the management of it; previously
  ///   failures would be silently ignored.
  /// * The fadingEdge attribute on views will be ignored (fading edges is no
  ///   longer a standard part of the UI). A new requiresFadingEdge attribute
  ///   allows applications to still force fading edges on for special cases.
  /// * [Context.bindService][ice-cream-sandwich-doc-4] will not automatically
  ///   add in [Context.BIND_WAIVE_PRIORITY][ice-cream-sandwich-doc-5].
  /// * App Widgets will have standard padding automatically added around them,
  ///   rather than relying on the padding being baked into the widget itself.
  /// * An exception will be thrown if you try to change the type of a window
  ///   after it has been added to the window manager. Previously this would
  ///   result in random incorrect behavior.
  /// * [AnimationSet][ice-cream-sandwich-doc-6] will parse out the duration,
  ///   fillBefore, fillAfter, repeatMode, and startOffset XML attributes that
  ///   are defined.
  /// * [ActionBar.setHomeButtonEnabled][ice-cream-sandwich-doc-7] is false by
  ///   default.
  ///
  /// [ice-cream-sandwich-doc-1]:
  /// https://d.android.com/reference/android/R.attr#hardwareAccelerated
  ///
  /// [ice-cream-sandwich-doc-2]:
  /// https://d.android.com/reference/android/R.style#Theme_DeviceDefault
  ///
  /// [ice-cream-sandwich-doc-3]:
  /// https://d.android.com/reference/android/R.style#Theme_Holo
  ///
  /// [ice-cream-sandwich-doc-4]:
  /// https://d.android.com/reference/android/content/Context#bindService
  ///
  /// [ice-cream-sandwich-doc-5]:
  /// https://d.android.com/reference/android/content/Context#BIND_WAIVE_PRIORITY
  ///
  /// [ice-cream-sandwich-doc-6]:
  /// https://d.android.com/reference/android/view/animation/AnimationSet
  ///
  /// [ice-cream-sandwich-doc-7]:
  /// https://d.android.com/reference/android/app/ActionBar#setHomeButtonEnabled
  iceCreamSandwich($p.Build$VERSION_CODES.ICE_CREAM_SANDWICH),

  /// I MR1.
  ///
  /// Released publicly as Android 4.03 in December 2011.
  iceCreamSandwichMr1($p.Build$VERSION_CODES.ICE_CREAM_SANDWICH_MR1),

  /// J.
  ///
  /// Released publicly as Android 4.1 in July 2012.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior:
  ///
  /// * You must explicitly request the
  ///   [Manifest.permission.READ_CALL_LOG][jelly-bean-doc-1] and/or
  ///   [Manifest.permission.WRITE_CALL_LOG][jelly-bean-doc-2] permissions;
  ///   access to the call log is no longer implicitly provided through
  ///   [Manifest.permission.READ_CONTACTS][jelly-bean-doc-3] and
  ///   [Manifest.permission.WRITE_CONTACTS][jelly-bean-doc-4].
  /// * [RemoteViews][jelly-bean-doc-5] will throw an exception if setting an
  ///   onClick handler for views being generated by a
  ///   [RemoteViewsService][jelly-bean-doc-6] for a collection container;
  ///   previously this just resulted in a warning log message.
  /// * New [ActionBar][jelly-bean-doc-7] policy for embedded tabs: embedded
  ///   tabs are now always stacked in the action bar when in portrait mode,
  ///   regardless of the size of the screen.
  /// * [WebSettings.setAllowFileAccessFromFileURLs][jelly-bean-doc-8] and
  ///   [WebSettings.setAllowUniversalAccessFromFileURLs][jelly-bean-doc-9]
  ///   default to false.
  /// * Calls to [PackageManager.setComponentEnabledSetting][jelly-bean-doc-10]
  ///   will now throw an IllegalArgumentException if the given component class
  ///   name does not exist in the application's manifest.
  /// * `NfcAdapter.setNdefPushMessage`, `NfcAdapter.setNdefPushMessageCallback`
  ///   and `NfcAdapter.setOnNdefPushCompleteCallback` will throw
  ///   IllegalStateException if called after the Activity has been destroyed.
  /// * Accessibility services must require the new
  ///   [Manifest.permission.BIND_ACCESSIBILITY_SERVICE][jelly-bean-doc-11]
  ///   permission or they will not be available for use.
  /// * [FLAG_INCLUDE_NOT_IMPORTANT_VIEWS][jelly-bean-doc-12] must be set for
  ///   unimportant views to be included in queries.
  ///
  /// [jelly-bean-doc-1]:
  /// https://d.android.com/reference/android/Manifest.permission#READ_CALL_LOG
  ///
  /// [jelly-bean-doc-2]:
  /// https://d.android.com/reference/android/Manifest.permission#WRITE_CALL_LOG
  ///
  /// [jelly-bean-doc-3]:
  /// https://d.android.com/reference/android/Manifest.permission#READ_CONTACTS
  ///
  /// [jelly-bean-doc-4]:
  /// https://d.android.com/reference/android/Manifest.permission#WRITE_CONTACTS
  ///
  /// [jelly-bean-doc-5]:
  /// https://d.android.com/reference/android/widget/RemoteViews
  ///
  /// [jelly-bean-doc-6]:
  /// https://d.android.com/reference/android/widget/RemoteViewsService
  ///
  /// [jelly-bean-doc-7]:
  /// https://d.android.com/reference/android/app/ActionBar
  ///
  /// [jelly-bean-doc-8]:
  /// https://d.android.com/reference/android/webkit/WebSettings#setAllowFileAccessFromFileURLs(boolean)
  ///
  /// [jelly-bean-doc-9]:
  /// https://d.android.com/reference/android/webkit/WebSettings#setAllowUniversalAccessFromFileURLs(boolean)
  ///
  /// [jelly-bean-doc-10]:
  /// https://d.android.com/reference/android/content/pm/PackageManager#setComponentEnabledSetting
  ///
  /// [jelly-bean-doc-11]:
  /// https://d.android.com/reference/android/Manifest.permission#BIND_ACCESSIBILITY_SERVICE
  ///
  /// [jelly-bean-doc-12]:
  /// https://d.android.com/reference/android/accessibilityservice/AccessibilityServiceInfo#FLAG_INCLUDE_NOT_IMPORTANT_VIEWS
  jellyBean($p.Build$VERSION_CODES.JELLY_BEAN),

  /// J MR1.
  ///
  /// Released publicly as Android 4.2 in November 2012.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior:
  ///
  /// * Content Providers: The default value of `android:exported` is now
  ///   `false`. See [the android:exported section][jelly-bean-mr1-doc-4] in the
  ///   provider documentation for more details.
  /// * [View.getLayoutDirection][jelly-bean-mr1-doc-1] can return different
  ///   values than [View.LAYOUT_DIRECTION_LTR][jelly-bean-mr1-doc-2] based on
  ///   the locale etc.
  /// * [WebView.addJavascriptInterface][jelly-bean-mr1-doc-3] requires explicit
  ///   annotations on methods for them to be accessible from Javascript.
  ///
  /// [jelly-bean-mr1-doc-1]:
  /// https://d.android.com/reference/android/view/View#getLayoutDirection()
  ///
  /// [jelly-bean-mr1-doc-2]:
  /// https://d.android.com/reference/android/view/View#LAYOUT_DIRECTION_LTR
  ///
  /// [jelly-bean-mr1-doc-3]:
  /// https://d.android.com/reference/android/webkit/WebView#addJavascriptInterface(Object,%20String)
  ///
  /// [jelly-bean-mr1-doc-4]:
  /// https://developer.android.com/guide/topics/manifest/provider-element.html#exported
  jellyBeanMr1($p.Build$VERSION_CODES.JELLY_BEAN_MR1),

  /// J MR2.
  ///
  /// Released publicly as Android 4.3 in July 2013.
  jellyBeanMr2($p.Build$VERSION_CODES.JELLY_BEAN_MR2),

  /// K.
  ///
  /// Released publicly as Android 4.4 in October 2013.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior. For more information about this release, see the
  /// [Android KitKat overview][kitkat-doc-9].
  ///
  /// * The default result of [PreferenceActivity.isValueFragment][kitkat-doc-1]
  ///   becomes false instead of true.
  /// * In [WebView][kitkat-doc-2], apps targeting earlier versions will have JS
  ///   URLs evaluated directly and any result of the evaluation will not
  ///   replace the current page content. Apps targetting KITKAT or later that
  ///   load a JS URL will have the result of that URL replace the content of
  ///   the current page
  /// * [AlarmManager.set][kitkat-doc-3] becomes interpreted as an inexact
  ///   value, to give the system more flexibility in scheduling alarms.
  /// * [Context.getSharedPreferences][kitkat-doc-4] no longer allows a null
  ///   name.
  /// * [RelativeLayout][kitkat-doc-5] changes to compute wrapped content
  ///   margins correctly.
  /// * [ActionBar][kitkat-doc-6]'s window content overlay is allowed to be
  ///   drawn.
  /// * The [Manifest.permission.READ_EXTERNAL_STORAGE][kitkat-doc-7] permission
  ///   is now always enforced.
  /// * Access to package-specific external storage directories belonging to the
  ///   calling app no longer requires the
  ///   [Manifest.permission.READ_EXTERNAL_STORAGE][kitkat-doc-7] or
  ///   [Manifest.permission.WRITE_EXTERNAL_STORAGE][kitkat-doc-8] permissions.
  ///
  /// [kitkat-doc-1]:
  /// https://d.android.com/reference/android/preference/PreferenceActivity#isValidFragment(String)
  ///
  /// [kitkat-doc-2]:
  /// https://d.android.com/reference/android/webkit/WebView
  ///
  /// [kitkat-doc-3]:
  /// https://d.android.com/reference/android/app/AlarmManager#set
  ///
  /// [kitkat-doc-4]:
  /// https://d.android.com/reference/android/content/Context#getSharedPreferences(String,%20int)
  ///
  /// [kitkat-doc-5]:
  /// https://d.android.com/reference/android/widget/RelativeLayout
  ///
  /// [kitkat-doc-6]:
  /// https://d.android.com/reference/android/app/ActionBar
  ///
  /// [kitkat-doc-7]:
  /// https://d.android.com/reference/android/Manifest.permission#READ_EXTERNAL_STORAGE
  ///
  /// [kitkat-doc-8]:
  /// https://d.android.com/reference/android/Manifest.permission#WRITE_EXTERNAL_STORAGE
  ///
  /// [kitkat-doc-9]:
  /// https://developer.android.com/about/versions/kitkat/
  kitkat($p.Build$VERSION_CODES.KITKAT),

  /// K for watches.
  ///
  /// Released publicly as Android 4.4W in June 2014.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior:
  ///
  /// * [AlertDialog][kitkat-watch-doc-1] might not have a default background if
  ///   the theme does not specify one.
  ///
  /// [kitkat-watch-doc-1]:
  /// https://d.android.com/reference/android/app/AlertDialog
  kitkatWatch($p.Build$VERSION_CODES.KITKAT_WATCH),

  /// L.
  ///
  /// Released publicly as Android 5.0 in November 2014.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior. For more information about this release, see the
  /// [Android Lollipop overview][lollipop-doc-9].
  ///
  /// * [Context.bindService][lollipop-doc-1] now requires an explicit Intent,
  ///   and will throw an exception if given an implicit Intent.
  /// * [Notification.Builder][lollipop-doc-2] will not have the colors of their
  ///   various notification elements adjusted to better match the new material
  ///   design look.
  /// * [Message][lollipop-doc-3] will validate that a message is not currently
  ///   in use when it is recycled.
  /// * Hardware accelerated drawing in windows will be enabled automatically in
  ///   most places.
  /// * [Spinner][lollipop-doc-4] throws an exception if attaching an adapter
  ///   with more than one item type.
  /// * If the app is a launcher, the launcher will be available to the user
  ///   even when they are using corporate profiles (which requires that the app
  ///   use [LauncherApps][lollipop-doc-5] to correctly populate its apps UI).
  /// * Calling [Service.stopForeground][lollipop-doc-6] with removeNotification
  ///   false will modify the still posted notification so that it is no longer
  ///   forced to be ongoing.
  /// * A [DreamService][lollipop-doc-7] must require the
  ///   [Manifest.permission.BIND_DREAM_SERVICE][lollipop-doc-8] permission to
  ///   be usable.
  ///
  /// [lollipop-doc-1]:
  /// https://d.android.com/reference/android/content/Context#bindService
  ///
  /// [lollipop-doc-2]:
  /// https://d.android.com/reference/android/app/Notification.Builder
  ///
  /// [lollipop-doc-3]:
  /// https://d.android.com/reference/android/os/Message
  ///
  /// [lollipop-doc-4]:
  /// https://d.android.com/reference/android/widget/Spinner
  ///
  /// [lollipop-doc-5]:
  /// https://d.android.com/reference/android/content/pm/LauncherApps
  ///
  /// [lollipop-doc-6]:
  /// https://d.android.com/reference/android/app/Service#stopForeground
  ///
  /// [lollipop-doc-7]:
  /// https://d.android.com/reference/android/service/dreams/DreamService
  ///
  /// [lollipop-doc-8]:
  /// https://d.android.com/reference/android/Manifest.permission#BIND_DREAM_SERVICE
  ///
  /// [lollipop-doc-9]:
  /// https://developer.android.com/about/versions/lollipop/
  lollipop($p.Build$VERSION_CODES.LOLLIPOP),

  /// L MR1.
  ///
  /// Released publicly as Android 5.1 in March 2015.
  ///
  /// For more information about this release, see the
  /// [Android 5.1 APIs][lollipop-mr1-doc-1].
  ///
  /// [lollipop-mr1-doc-1]:
  /// https://developer.android.com/about/versions/android-5.1
  lollipopMr1($p.Build$VERSION_CODES.LOLLIPOP_MR1),

  /// M.
  ///
  /// Released publicly as Android 6.0 in October 2015.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior. For more information about this release, see the
  /// [Android 6.0 Marshmallow overview][m-doc-14].
  ///
  /// * Runtime permissions. Dangerous permissions are no longer granted at
  ///   install time, but must be requested by the application at runtime
  ///   through [Activity.requestPermissions][m-doc-1].
  /// * Bluetooth and Wi-Fi scanning now requires holding the location
  ///   permission.
  /// * [AlarmManager.setTimeZone][m-doc-2] will fail if the given timezone is
  ///   non-Olson.
  /// * Activity transitions will only return shared elements mapped in the
  ///   returned view hierarchy back to the calling activity.
  /// * [View][m-doc-3] allows a number of behaviors that may break existing
  ///   apps: Canvas throws an exception if restore() is called too many times,
  ///   widgets may return a hint size when returning UNSPECIFIED measure specs,
  ///   and it will respect the attributes [R.attr.foreground][m-doc-4],
  ///   [R.attr.foregroundGravity][m-doc-5], [R.attr.foregroundTint][m-doc-6],
  ///   and [R.attr.foregroundTintMode][m-doc-7].
  /// * [MotionEvent.getButtonState][m-doc-8] will no longer report
  ///   [MotionEvent.BUTTON_PRIMARY][m-doc-9] and
  ///   [MotionEvent.BUTTON_SECONDARY][m-doc-10] as synonyms for
  ///   [MotionEvent.BUTTON_STYLUS_PRIMARY][m-doc-11] and
  ///   [MotionEvent.BUTTON_STYLUS_SECONDARY][m-doc-12].
  /// * [ScrollView][m-doc-13] now respects the layout param margins when
  ///   measuring.
  ///
  /// [m-doc-1]:
  /// https://d.android.com/reference/android/app/Activity#requestPermissions
  ///
  /// [m-doc-2]:
  /// https://d.android.com/reference/android/app/AlarmManager#setTimeZone
  ///
  /// [m-doc-3]:
  /// https://d.android.com/reference/android/view/View
  ///
  /// [m-doc-4]:
  /// https://d.android.com/reference/android/R.attr#foreground
  ///
  /// [m-doc-5]:
  /// https://d.android.com/reference/android/R.attr#foregroundGravity
  ///
  /// [m-doc-6]:
  /// https://d.android.com/reference/android/R.attr#foregroundTint
  ///
  /// [m-doc-7]:
  /// https://d.android.com/reference/android/R.attr#foregroundTintMode
  ///
  /// [m-doc-8]:
  /// https://d.android.com/reference/android/view/MotionEvent#getButtonState
  ///
  /// [m-doc-9]:
  /// https://d.android.com/reference/android/view/MotionEvent#BUTTON_PRIMARY
  ///
  /// [m-doc-10]:
  /// https://d.android.com/reference/android/view/MotionEvent#BUTTON_SECONDARY
  ///
  /// [m-doc-11]:
  /// https://d.android.com/reference/android/view/MotionEvent#BUTTON_STYLUS_PRIMARY
  ///
  /// [m-doc-12]:
  /// https://d.android.com/reference/android/view/MotionEvent#BUTTON_STYLUS_SECONDARY
  ///
  /// [m-doc-13]:
  /// https://d.android.com/reference/android/widget/ScrollView
  ///
  /// [m-doc-14]:
  /// https://developer.android.com/about/versions/marshmallow/
  m($p.Build$VERSION_CODES.M),

  /// N.
  ///
  /// Released publicly as Android 7.0 in August 2016.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior. For more information about this release, see the
  /// [Android Nougat overview][n-doc-24].
  ///
  /// * [DownloadManager.Request.setAllowedNetworkTypes][n-doc-1] will disable
  ///   "allow over metered" when specifying only
  ///   [Request.NETWORK_WIFI][n-doc-2].
  /// * [DownloadManager][n-doc-3] no longer allows access to raw file paths.
  /// * [Notification.Builder.setShowWhen][n-doc-4] must be called explicitly to
  ///   have the time shown, and various other changes in
  ///   [Notification.Builder][n-doc-5] to how notifications are shown.
  /// * [Context.MODE_WORLD_READABLE][n-doc-6] and
  ///   [Context.MODE_WORLD_WRITEABLE][n-doc-7] are no longer supported.
  /// * [FileUriExposedException][n-doc-8] will be thrown to applications.
  /// * Applications will see global drag and drops as per
  ///   [View.DRAG_FLAG_GLOBAL][n-doc-9].
  /// * [WebView.evaluateJavascript][n-doc-10] will not persist state from an
  ///   empty WebView.
  /// * [AnimatorSet][n-doc-11] will not ignore calls to end() before start().
  /// * [AlarmManager.cancel][n-doc-12] will throw a NullPointerException if
  ///   given a null operation.
  /// * [FragmentManager][n-doc-13] will ensure fragments have been created
  ///   before being placed on the back stack.
  /// * [FragmentManager][n-doc-13] restores fragments in
  ///   [Fragment.onCreate][n-doc-14] rather than after the method returns.
  /// * [R.attr.resizeableActivity][n-doc-15] defaults to true.
  /// * [AnimatedVectorDrawable][n-doc-16] throws exceptions when opening
  ///   invalid VectorDrawable animations.
  /// * [MarginLayoutParams][n-doc-17] will no longer be dropped when converting
  ///   between some types of layout params (such as
  ///   [LinearLayout.LayoutParams][n-doc-18] to
  ///   [RelativeLayout.LayoutParams][n-doc-19]).
  /// * Your application processes will not be killed when the device density
  ///   changes.
  /// * Drag and drop. After a view receives the
  ///   [DragEvent.ACTION_DRAG_ENTERED][n-doc-20] event, when the drag shadow
  ///   moves into a descendant view that can accept the data, the view receives
  ///   the [DragEvent.ACTION_DRAG_EXITED][n-doc-21] event and won’t receive
  ///   [DragEvent.ACTION_DRAG_LOCATION][n-doc-22] and
  ///   [DragEvent.ACTION_DROP][n-doc-23] events while the drag shadow is within
  ///   that descendant view, even if the descendant view returns `false` from
  ///   its handler for these events.
  ///
  /// [n-doc-1]:
  /// https://d.android.com/reference/android/app/DownloadManager.Request#setAllowedNetworkTypes
  ///
  /// [n-doc-2]:
  /// https://d.android.com/reference/android/app/DownloadManager.Request#NETWORK_WIFI
  ///
  /// [n-doc-3]:
  /// https://d.android.com/reference/android/app/DownloadManager
  ///
  /// [n-doc-4]:
  /// https://d.android.com/reference/android/app/Notification.Builder#setShowWhen
  ///
  /// [n-doc-5]:
  /// https://d.android.com/reference/android/app/Notification.Builder
  ///
  /// [n-doc-6]:
  /// https://d.android.com/reference/android/content/Context#MODE_WORLD_READABLE
  ///
  /// [n-doc-7]:
  /// https://d.android.com/reference/android/content/Context#MODE_WORLD_WRITEABLE
  ///
  /// [n-doc-8]:
  /// https://d.android.com/reference/android/os/FileUriExposedException
  ///
  /// [n-doc-9]:
  /// https://d.android.com/reference/android/view/View#DRAG_FLAG_GLOBAL
  ///
  /// [n-doc-10]:
  /// https://d.android.com/reference/android/webkit/WebView#evaluateJavascript
  ///
  /// [n-doc-11]:
  /// https://d.android.com/reference/android/animation/AnimatorSet
  ///
  /// [n-doc-12]:
  /// https://d.android.com/reference/android/app/AlarmManager#cancel(android.app.PendingIntent)
  ///
  /// [n-doc-13]:
  /// https://d.android.com/reference/android/app/FragmentManager
  ///
  /// [n-doc-14]:
  /// https://d.android.com/reference/android/app/Fragment#onCreate
  ///
  /// [n-doc-15]:
  /// https://d.android.com/reference/android/R.attr#resizeableActivity
  ///
  /// [n-doc-16]:
  /// https://d.android.com/reference/android/graphics/drawable/AnimatedVectorDrawable
  ///
  /// [n-doc-17]:
  /// https://d.android.com/reference/android/view/ViewGroup.MarginLayoutParams
  ///
  /// [n-doc-18]:
  /// https://d.android.com/reference/android/widget/LinearLayout.LayoutParams
  ///
  /// [n-doc-19]:
  /// https://d.android.com/reference/android/widget/RelativeLayout.LayoutParams
  ///
  /// [n-doc-20]:
  /// https://d.android.com/reference/android/view/DragEvent#ACTION_DRAG_ENTERED
  ///
  /// [n-doc-21]:
  /// https://d.android.com/reference/android/view/DragEvent#ACTION_DRAG_EXITED
  ///
  /// [n-doc-22]:
  /// https://d.android.com/reference/android/view/DragEvent#ACTION_DRAG_LOCATION
  ///
  /// [n-doc-23]:
  /// https://d.android.com/reference/android/view/DragEvent#ACTION_DROP
  ///
  /// [n-doc-24]:
  /// https://developer.android.com/about/versions/nougat/
  n($p.Build$VERSION_CODES.N),

  /// N MR1.
  ///
  /// Released publicly as Android 7.1 in October 2016.
  ///
  /// For more information about this release, see
  /// [Android 7.1 for Developers][n-mr1-doc-1].
  ///
  /// [n-mr1-doc-1]:
  /// https://developer.android.com/about/versions/nougat/android-7.1
  nMr1($p.Build$VERSION_CODES.N_MR1),

  /// O.
  ///
  /// Released publicly as Android 8.0 in August 2017.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior. For more information about this release, see the
  /// [Android Oreo overview][o-doc-41].
  ///
  /// * [Background execution limits][o-doc-42] are applied to the application.
  /// * The behavior of AccountManager's
  ///   [AccountManager.getAccountsByType][o-doc-1],
  ///   [AccountManager.getAccountsByTypeAndFeatures][o-doc-2], and
  ///   [AccountManager.hasFeatures][o-doc-3] has changed as documented there.
  /// * [RunningAppProcessInfo.IMPORTANCE_PERCEPTIBLE_PRE_26][o-doc-4] is now
  ///   returned as [RunningAppProcessInfo.IMPORTANCE_PERCEPTIBLE][o-doc-5].
  /// * The [NotificationManager][o-doc-6] now requires the use of notification
  ///   channels.
  /// * Changes to the strict mode that are set in
  ///   [Application.onCreate][o-doc-7] will no longer be clobbered after that
  ///   function returns.
  /// * A shared library apk with native code will have that native code
  ///   included in the library path of its clients.
  /// * [Context.getSharedPreferences][o-doc-8] in credential encrypted storage
  ///   will throw an exception before the user is unlocked.
  /// * Attempting to retrieve a [Context.FINGERPRINT_SERVICE][o-doc-9] on a
  ///   device that does not support that feature will now throw a runtime
  ///   exception.
  /// * [Fragment][o-doc-10] will stop any active view animations when the
  ///   fragment is stopped.
  /// * Some compatibility code in Resources that attempts to use the default
  ///   Theme the app may be using will be turned off, requiring the app to
  ///   explicitly request resources with the right theme.
  /// * [ContentResolver.notifyChange][o-doc-11] and
  ///   [ContentResolver.registerContentObserver][o-doc-12] will throw a
  ///   SecurityException if the caller does not have permission to access the
  ///   provider (or the provider doesn't exit); otherwise the call will be
  ///   silently ignored.
  /// * [CameraDevice.createCaptureRequest][o-doc-13] will enable
  ///   [CaptureRequest.CONTROL_ENABLE_ZSL][o-doc-14] by default for still image
  ///   capture.
  /// * WallpaperManager's [WallpaperManager.getWallpaperFile][o-doc-15],
  ///   [WallpaperManager.getDrawable][o-doc-16],
  ///   [WallpaperManager.getFastDrawable][o-doc-17],
  ///   [WallpaperManager.peekDrawable][o-doc-18], and
  ///   [WallpaperManager.peekFastDrawable][o-doc-19] will throw an exception if
  ///   you can not access the wallpaper.
  /// * The behavior of [UsbDeviceConnection.requestWait][o-doc-20] is modified
  ///   as per the documentation there.
  /// * [StrictMode.VmPolicy.Builder.detectAll][o-doc-21] will also enable
  ///   [Builder.detectContentUriWithoutPermission][o-doc-22] and
  ///   [Builder.detectUntaggedSockets][o-doc-23].
  /// * [StrictMode.ThreadPolicy.Builder.detectAll][o-doc-24] will also enable
  ///   [Builder.detectUnbufferedIo][o-doc-25].
  /// * [DocumentsContract][o-doc-26]'s various methods will throw failure
  ///   exceptions back to the caller instead of returning null.
  /// * [View.hasFocusable][o-doc-27] now includes auto-focusable views.
  /// * [SurfaceView][o-doc-28] will no longer always change the underlying
  ///   Surface object when something about it changes; apps need to look at the
  ///   current state of the object to determine which things they are
  ///   interested in have changed.
  /// * [LayoutParams.TYPE_APPLICATION_OVERLAY][o-doc-29] must be used for
  ///   overlay windows, other system overlay window types are not allowed.
  /// * [ViewTreeObserver.addOnDrawListener][o-doc-30] will throw an exception
  ///   if called from within onDraw.
  /// * [Canvas.setBitmap][o-doc-31] will no longer preserve the current matrix
  ///   and clip stack of the canvas.
  /// * [ListPopupWindow.setHeight][o-doc-32] will throw an exception if a
  ///   negative height is supplied.
  /// * [TextView][o-doc-33] will use internationalized input for numbers,
  ///   dates, and times.
  /// * [Toast][o-doc-34] must be used for showing toast windows; the toast
  ///   window type can not be directly used.
  /// * [WifiManager.getConnectionInfo][o-doc-35] requires that the caller hold
  ///   the location permission to return BSSID/SSID
  /// * [WifiP2pManager.requestPeers][o-doc-36] requires the caller hold the
  ///   location permission.
  /// * [R.attr.maxAspectRatio][o-doc-37] defaults to 0, meaning there is no
  ///   restriction on the app's maximum aspect ratio (so it can be stretched to
  ///   fill larger screens).
  /// * [R.attr.focusable][o-doc-38] defaults to a new state (`auto`) where it
  ///   will inherit the value of [R.attr.clickable][o-doc-39] unless explicitly
  ///   overridden.
  /// * A default theme-appropriate focus-state highlight will be supplied to
  ///   all Views which don't provide a focus-state drawable themselves. This
  ///   can be disabled by setting
  ///   [R.attr.defaultFocusHighlightEnabled][o-doc-40] to false.
  ///
  /// [o-doc-1]:
  /// https://d.android.com/reference/android/accounts/AccountManager#getAccountsByType
  ///
  /// [o-doc-2]:
  /// https://d.android.com/reference/android/accounts/AccountManager#getAccountsByTypeAndFeatures
  ///
  /// [o-doc-3]:
  /// https://d.android.com/reference/android/accounts/AccountManager#hasFeatures
  ///
  /// [o-doc-4]:
  /// https://d.android.com/reference/android/app/ActivityManager.RunningAppProcessInfo#IMPORTANCE_PERCEPTIBLE_PRE_26
  ///
  /// [o-doc-5]:
  /// https://d.android.com/reference/android/app/ActivityManager.RunningAppProcessInfo#IMPORTANCE_PERCEPTIBLE
  ///
  /// [o-doc-6]:
  /// https://d.android.com/reference/android/app/NotificationManager
  ///
  /// [o-doc-7]:
  /// https://d.android.com/reference/android/app/Application#onCreate
  ///
  /// [o-doc-8]:
  /// https://d.android.com/reference/android/content/Context#getSharedPreferences
  ///
  /// [o-doc-9]:
  /// https://d.android.com/reference/android/content/Context#FINGERPRINT_SERVICE
  ///
  /// [o-doc-10]:
  /// https://d.android.com/reference/android/app/Fragment
  ///
  /// [o-doc-11]:
  /// https://d.android.com/reference/android/content/ContentResolver#notifyChange
  ///
  /// [o-doc-12]:
  /// https://d.android.com/reference/android/content/ContentResolver#registerContentObserver
  ///
  /// [o-doc-13]:
  /// https://d.android.com/reference/android/hardware/camera2/CameraDevice#createCaptureRequest
  ///
  /// [o-doc-14]:
  /// https://d.android.com/reference/android/hardware/camera2/CaptureRequest#CONTROL_ENABLE_ZSL
  ///
  /// [o-doc-15]:
  /// https://d.android.com/reference/android/app/WallpaperManager#getWallpaperFile
  ///
  /// [o-doc-16]:
  /// https://d.android.com/reference/android/app/WallpaperManager#getDrawable
  ///
  /// [o-doc-17]:
  /// https://d.android.com/reference/android/app/WallpaperManager#getFastDrawable
  ///
  /// [o-doc-18]:
  /// https://d.android.com/reference/android/app/WallpaperManager#peekDrawable
  ///
  /// [o-doc-19]:
  /// https://d.android.com/reference/android/app/WallpaperManager#peekFastDrawable
  ///
  /// [o-doc-20]:
  /// https://d.android.com/reference/android/hardware/usb/UsbDeviceConnection#requestWait
  ///
  /// [o-doc-21]:
  /// https://d.android.com/reference/android/os/StrictMode.VmPolicy.Builder#detectAll
  ///
  /// [o-doc-22]:
  /// https://d.android.com/reference/android/os/StrictMode.VmPolicy.Builder#detectContentUriWithoutPermission
  ///
  /// [o-doc-23]:
  /// https://d.android.com/reference/android/os/StrictMode.VmPolicy.Builder#detectUntaggedSockets
  ///
  /// [o-doc-24]:
  /// https://d.android.com/reference/android/os/StrictMode.ThreadPolicy.Builder#detectAll
  ///
  /// [o-doc-25]:
  /// https://d.android.com/reference/android/os/StrictMode.ThreadPolicy.Builder#detectUnbufferedIo
  ///
  /// [o-doc-26]:
  /// https://d.android.com/reference/android/provider/DocumentsContract
  ///
  /// [o-doc-27]:
  /// https://d.android.com/reference/android/view/View#hasFocusable()
  ///
  /// [o-doc-28]:
  /// https://d.android.com/reference/android/view/SurfaceView
  ///
  /// [o-doc-29]:
  /// https://d.android.com/reference/android/view/WindowManager.LayoutParams#TYPE_APPLICATION_OVERLAY
  ///
  /// [o-doc-30]:
  /// https://d.android.com/reference/android/view/ViewTreeObserver#addOnDrawListener
  ///
  /// [o-doc-31]:
  /// https://d.android.com/reference/android/graphics/Canvas#setBitmap
  ///
  /// [o-doc-32]:
  /// https://d.android.com/reference/android/widget/ListPopupWindow#setHeight
  ///
  /// [o-doc-33]:
  /// https://d.android.com/reference/android/widget/TextView
  ///
  /// [o-doc-34]:
  /// https://d.android.com/reference/android/widget/Toast
  ///
  /// [o-doc-35]:
  /// https://d.android.com/reference/android/net/wifi/WifiManager#getConnectionInfo
  ///
  /// [o-doc-36]:
  /// https://d.android.com/reference/android/net/wifi/p2p/WifiP2pManager#requestPeers
  ///
  /// [o-doc-37]:
  /// https://d.android.com/reference/android/R.attr#maxAspectRatio
  ///
  /// [o-doc-38]:
  /// https://d.android.com/reference/android/R.attr#focusable
  ///
  /// [o-doc-39]:
  /// https://d.android.com/reference/android/R.attr#clickable
  ///
  /// [o-doc-40]:
  /// https://d.android.com/reference/android/R.attr#defaultFocusHighlightEnabled
  ///
  /// [o-doc-41]:
  /// https://developer.android.com/about/versions/oreo/
  ///
  /// [o-doc-42]:
  /// https://developer.android.com/about/versions/oreo/background.html
  o($p.Build$VERSION_CODES.O),

  /// O MR1.
  ///
  /// Released publicly as Android 8.1 in December 2017.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior. For more information about this release, see
  /// [Android 8.1 features and APIs][o-mr1-doc-2].
  ///
  /// * Apps exporting and linking to apk shared libraries must explicitly
  ///   enumerate all signing certificates in a consistent order.
  /// * [R.attr.screenOrientation][o-mr1-doc-1] can not be used to request a
  ///   fixed orientation if the associated activity is not fullscreen and
  ///   opaque.
  ///
  /// [o-mr1-doc-1]:
  /// https://d.android.com/reference/android/R.attr#screenOrientation
  ///
  /// [o-mr1-doc-2]:
  /// https://developer.android.com/about/versions/oreo/android-8.1
  oMr1($p.Build$VERSION_CODES.O_MR1),

  /// P.
  ///
  /// Released publicly as Android 9 in August 2018.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior. For more information about this release, see the
  /// [Android 9 Pie overview][p-doc-4].
  ///
  /// * [Service.startForeground][p-doc-1] requires that apps hold the
  ///   permission [Manifest.permission.FOREGROUND_SERVICE][p-doc-2].
  /// * [LinearLayout][p-doc-3] will always remeasure weighted children, even if
  ///   there is no excess space.
  ///
  /// [p-doc-1]:
  /// https://d.android.com/reference/android/app/Service#startForeground
  ///
  /// [p-doc-2]:
  /// https://d.android.com/reference/android/Manifest.permission#FOREGROUND_SERVICE
  ///
  /// [p-doc-3]:
  /// https://d.android.com/reference/android/widget/LinearLayout
  ///
  /// [p-doc-4]:
  /// https://developer.android.com/about/versions/pie/
  p($p.Build$VERSION_CODES.P),

  /// Q.
  ///
  /// Released publicly as Android 10 in September 2019.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior. For more information about this release, see the
  /// [Android 10 overview][q-doc-1].
  ///
  /// * [Behavior changes: all apps][q-doc-2]
  /// * [Behavior changes: apps targeting API 29+][q-doc-3]
  ///
  /// [q-doc-1]:
  /// https://developer.android.com/about/versions/10
  ///
  /// [q-doc-2]:
  /// https://developer.android.com/about/versions/10/behavior-changes-all
  ///
  /// [q-doc-3]:
  /// https://developer.android.com/about/versions/10/behavior-changes-10
  q($p.Build$VERSION_CODES.Q),

  /// R.
  ///
  /// Released publicly as Android 11 in September 2020.
  ///
  /// Applications targeting this or a later release will get these new changes
  /// in behavior. For more information about this release, see the
  /// [Android 11 overview][r-doc-1].
  ///
  /// * [Behavior changes: all apps][r-doc-2]
  /// * [Behavior changes: Apps targeting Android 11][r-doc-3]
  /// * [Updates to non-SDK interface restrictions in Android 11][r-doc-4]
  ///
  /// [r-doc-1]:
  /// https://developer.android.com/about/versions/11
  ///
  /// [r-doc-2]:
  /// https://developer.android.com/about/versions/11/behavior-changes-all
  ///
  /// [r-doc-3]:
  /// https://developer.android.com/about/versions/11/behavior-changes-11
  ///
  /// [r-doc-4]:
  /// https://developer.android.com/about/versions/11/non-sdk-11
  r($p.Build$VERSION_CODES.R),

  /// S.
  s($p.Build$VERSION_CODES.S),

  /// S V2.
  ///
  /// Once more unto the breach, dear friends, once more.
  sV2($p.Build$VERSION_CODES.S_V2),

  /// Tiramisu.
  tiramisu($p.Build$VERSION_CODES.TIRAMISU),

  /// Upside Down Cake.
  upsideDownCake($p.Build$VERSION_CODES.UPSIDE_DOWN_CAKE),

  /// Vanilla Ice Cream.
  vanillaIceCream($p.Build$VERSION_CODES.VANILLA_ICE_CREAM),

  /// Baklava.
  baklava($p.Build$VERSION_CODES.BAKLAVA),

  /// Cinnamon Bun.
  cinnamonBun($p.Build$VERSION_CODES.CINNAMON_BUN);

  /// Creates an SDK version entry backed by [versionCode].
  const BuildVersionCodes(this.versionCode);

  /// The integer SDK version code reported by [BuildVersion.sdkInt].
  final int versionCode;
}
