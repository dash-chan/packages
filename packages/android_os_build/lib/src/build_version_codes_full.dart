import 'package:android_os_build/generated/android_os_build.g.dart' as $p;

/// Enumeration of the currently known SDK major and minor version codes.
///
/// The numbers increase for every release and are guaranteed to be ordered by
/// release date.
///
/// The actual values are an implementation detail, and the current encoding
/// scheme may change in the future.
enum BuildVersionCodesFull {
  /// Android 1.0.
  base($p.Build$VERSION_CODES_FULL.BASE),

  /// Android 1.1.
  base_1_1($p.Build$VERSION_CODES_FULL.BASE_1_1),

  /// Android 1.5.
  cupcake($p.Build$VERSION_CODES_FULL.CUPCAKE),

  /// Android 1.6.
  donut($p.Build$VERSION_CODES_FULL.DONUT),

  /// Android 2.0.
  eclair($p.Build$VERSION_CODES_FULL.ECLAIR),

  /// Android 2.0.1.
  eclair_0_1($p.Build$VERSION_CODES_FULL.ECLAIR_0_1),

  /// Android 2.1.x.
  eclairMr1($p.Build$VERSION_CODES_FULL.ECLAIR_MR1),

  /// Android 2.2.x.
  froyo($p.Build$VERSION_CODES_FULL.FROYO),

  /// Android 2.3.0–2.3.2.
  gingerbread($p.Build$VERSION_CODES_FULL.GINGERBREAD),

  /// Android 2.3.3–2.3.4.
  gingerbreadMr1($p.Build$VERSION_CODES_FULL.GINGERBREAD_MR1),

  /// Android 3.0.x.
  honeycomb($p.Build$VERSION_CODES_FULL.HONEYCOMB),

  /// Android 3.1.x.
  honeycombMr1($p.Build$VERSION_CODES_FULL.HONEYCOMB_MR1),

  /// Android 3.2.
  honeycombMr2($p.Build$VERSION_CODES_FULL.HONEYCOMB_MR2),

  /// Android 4.0.0–4.0.2.
  iceCreamSandwich($p.Build$VERSION_CODES_FULL.ICE_CREAM_SANDWICH),

  /// Android 4.0.3–4.0.4.
  iceCreamSandwichMr1($p.Build$VERSION_CODES_FULL.ICE_CREAM_SANDWICH_MR1),

  /// Android 4.1.0–4.1.1.
  jellyBean($p.Build$VERSION_CODES_FULL.JELLY_BEAN),

  /// Android 4.2.0–4.2.2.
  jellyBeanMr1($p.Build$VERSION_CODES_FULL.JELLY_BEAN_MR1),

  /// Android 4.3.
  jellyBeanMr2($p.Build$VERSION_CODES_FULL.JELLY_BEAN_MR2),

  /// Android 4.4.
  kitkat($p.Build$VERSION_CODES_FULL.KITKAT),

  /// Android 4.4W.
  kitkatWatch($p.Build$VERSION_CODES_FULL.KITKAT_WATCH),

  /// Android 5.0.
  lollipop($p.Build$VERSION_CODES_FULL.LOLLIPOP),

  /// Android 5.1.
  lollipopMr1($p.Build$VERSION_CODES_FULL.LOLLIPOP_MR1),

  /// Android 6.0.
  m($p.Build$VERSION_CODES_FULL.M),

  /// Android 7.0.
  n($p.Build$VERSION_CODES_FULL.N),

  /// Android 7.1.0–7.1.1.
  nMr1($p.Build$VERSION_CODES_FULL.N_MR1),

  /// Android 8.0.
  o($p.Build$VERSION_CODES_FULL.O),

  /// Android 8.1.
  oMr1($p.Build$VERSION_CODES_FULL.O_MR1),

  /// Android 9.
  p($p.Build$VERSION_CODES_FULL.P),

  /// Android 10.
  q($p.Build$VERSION_CODES_FULL.Q),

  /// Android 11.
  r($p.Build$VERSION_CODES_FULL.R),

  /// Android 12.
  s($p.Build$VERSION_CODES_FULL.S),

  /// Android 12v2.
  sV2($p.Build$VERSION_CODES_FULL.S_V2),

  /// Android 13.
  tiramisu($p.Build$VERSION_CODES_FULL.TIRAMISU),

  /// Android 14.
  upsideDownCake($p.Build$VERSION_CODES.UPSIDE_DOWN_CAKE),

  /// Android 15.
  vanillaIceCream($p.Build$VERSION_CODES_FULL.VANILLA_ICE_CREAM),

  /// Android 16.
  baklava($p.Build$VERSION_CODES_FULL.BAKLAVA),

  /// Android 16, minor release 1.
  baklava1($p.Build$VERSION_CODES_FULL.BAKLAVA_1);

  /// Creates an SDK major-and-minor version code with [rawValue].
  const BuildVersionCodesFull(this.rawValue);

  /// The encoded SDK major-and-minor version value.
  final int rawValue;
}
