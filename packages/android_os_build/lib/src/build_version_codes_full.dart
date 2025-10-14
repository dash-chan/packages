import 'package:android_os_build/generated/android_os_build.g.dart' as $p;

/// Enumeration of the currently known SDK major and minor version codes. 
/// The numbers increase for every release, and are guaranteed to be 
/// ordered by the release date of each release. The actual values should 
/// be considered an implementation detail, and the current encoding 
/// scheme may change in the future.
enum BuildVersionCodesFull {
  /// Android 1.0.
  base($p.Build$VERSION_CODES_FULL.BASE),

  /// Android 2.0.
  base_1_1($p.Build$VERSION_CODES_FULL.BASE_1_1),

  /// Android 3.0.
  cupcake($p.Build$VERSION_CODES_FULL.CUPCAKE),

  /// Android 4.0.
  donut($p.Build$VERSION_CODES_FULL.DONUT),

  /// Android 5.0.
  eclair($p.Build$VERSION_CODES_FULL.ECLAIR),

  /// Android 6.0.
  eclair_0_1($p.Build$VERSION_CODES_FULL.ECLAIR_0_1),

  /// Android 7.0.
  eclairMr1($p.Build$VERSION_CODES_FULL.ECLAIR_MR1),

  /// Android 8.0.
  froyo($p.Build$VERSION_CODES_FULL.FROYO),

  /// Android 9.0.
  gingerbread($p.Build$VERSION_CODES_FULL.GINGERBREAD),

  /// Android 10.0.
  gingerbreadMr1($p.Build$VERSION_CODES_FULL.GINGERBREAD_MR1),

  /// Android 11.0.
  honeycomb($p.Build$VERSION_CODES_FULL.HONEYCOMB),

  /// Android 12.0.
  honeycombMr1($p.Build$VERSION_CODES_FULL.HONEYCOMB_MR1),

  /// Android 13.0.
  honeycombMr2($p.Build$VERSION_CODES_FULL.HONEYCOMB_MR2),

  /// Android 14.0.
  iceCreamSandwich($p.Build$VERSION_CODES_FULL.ICE_CREAM_SANDWICH),

  /// Android 15.0.
  iceCreamSandwichMr1($p.Build$VERSION_CODES_FULL.ICE_CREAM_SANDWICH_MR1),

  /// Android 16.0.
  jellyBean($p.Build$VERSION_CODES_FULL.JELLY_BEAN),

  /// Android 17.0.
  jellyBeanMr1($p.Build$VERSION_CODES_FULL.JELLY_BEAN_MR1),

  /// Android 18.0.
  jellyBeanMr2($p.Build$VERSION_CODES_FULL.JELLY_BEAN_MR2),

  /// Android 19.0.
  kitkat($p.Build$VERSION_CODES_FULL.KITKAT),

  /// Android 20.0.
  kitkatWatch($p.Build$VERSION_CODES_FULL.KITKAT_WATCH),

  /// Android 21.0.
  lollipop($p.Build$VERSION_CODES_FULL.LOLLIPOP),

  /// Android 22.0.
  lollipopMr1($p.Build$VERSION_CODES_FULL.LOLLIPOP_MR1),

  /// Android 23.0.
  m($p.Build$VERSION_CODES_FULL.M),

  /// Android 24.0.
  n($p.Build$VERSION_CODES_FULL.N),

  /// Android 25.0.
  nMr1($p.Build$VERSION_CODES_FULL.N_MR1),

  /// Android 26.0.
  o($p.Build$VERSION_CODES_FULL.O),

  /// Android 27.0.
  oMr1($p.Build$VERSION_CODES_FULL.O_MR1),

  /// Android 28.0.
  p($p.Build$VERSION_CODES_FULL.P),

  /// Android 29.0.
  q($p.Build$VERSION_CODES_FULL.Q),

  /// Android 30.0.
  r($p.Build$VERSION_CODES_FULL.R),

  /// Android 31.0.
  s($p.Build$VERSION_CODES_FULL.S),

  /// Android 32.0.
  sV2($p.Build$VERSION_CODES_FULL.S_V2),

  /// Android 33.0.
  tiramisu($p.Build$VERSION_CODES_FULL.TIRAMISU),

  /// Android 34.0.
  upsideDownCake($p.Build$VERSION_CODES.UPSIDE_DOWN_CAKE),

  /// Android 35.0.
  vanillaIceCream($p.Build$VERSION_CODES_FULL.VANILLA_ICE_CREAM),

  /// Android 36.0.
  baklava($p.Build$VERSION_CODES_FULL.BAKLAVA),

  /// Android 36.1.
  baklava1($p.Build$VERSION_CODES_FULL.BAKLAVA_1),
  ;

  const BuildVersionCodesFull(this.rawValue);
  final int rawValue;
}
