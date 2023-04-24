/// a library shows the flutter supported languages
library supported_languages;

import 'dart:ui';

/// supported languages
enum SupportedLanguages {
  /// `af` - Afrikaans
  af('af'),

  /// `am` - Amharic
  am('am'),

  /// `ar` - Arabic
  ar('ar'),

  /// `as` - Assamese
  as_('as'),

  /// `az` - Azerbaijani
  az('az'),

  /// `be` - Belarusian
  be('be'),

  /// `bg` - Bulgarian
  bg('bg'),

  /// `bn` - Bengali Bangla
  bn('bn'),

  /// `bs` - Bosnian
  bs('bs'),

  /// `ca` - Catalan Valencian
  ca('ca'),

  /// `cs` - Czech
  cs('cs'),

  /// `da` - Danish
  da('da'),

  /// `de` - German (plus one country variation)
  de('de'),

  /// `el` - Modern Greek
  el('el'),

  /// `en` - English (plus 8 country variations)
  en('en'),

  /// `es` - Spanish Castilian (plus 20 country variations)
  es('es'),

  /// `et` - Estonian
  et('et'),

  /// `eu` - Basque
  eu('eu'),

  /// `fa` - Persian
  fa('fa'),

  /// `fi` - Finnish
  fi('fi'),

  /// `fil` - Filipino Pilipino
  fil('fil'),

  /// `fr` - French (plus one country variation)
  fr('fr'),

  /// `gl` - Galician
  gl('gl'),

  /// `gsw` - Swiss German Alemannic Alsatian
  gsw('gsw'),

  /// `gu` - Gujarati
  gu('gu'),

  /// `he` - Hebrew
  he('he'),

  /// `hi` - Hindi
  hi('hi'),

  /// `hr` - Croatian
  hr('hr'),

  /// `hu` - Hungarian
  hu('hu'),

  /// `hy` - Armenian
  hy('hy'),

  /// `id` - Indonesian
  id('id'),

  /// `is` - Icelandic
  is_('is'),

  /// `it` - Italian
  it('it'),

  /// `ja` - Japanese
  ja('ja'),

  /// `ka` - Georgian
  ka('ka'),

  /// `kk` - Kazakh
  kk('kk'),

  /// `km` - Khmer Central Khmer
  km('km'),

  /// `kn` - Kannada
  kn('kn'),

  /// `ko` - Korean
  ko('ko'),

  /// `ky` - Kirghiz Kyrgyz
  ky('ky'),

  /// `lo` - Lao
  lo('lo'),

  /// `lt` - Lithuanian
  lt('lt'),

  /// `lv` - Latvian
  lv('lv'),

  /// `mk` - Macedonian
  mk('mk'),

  /// `ml` - Malayalam
  ml('ml'),

  /// `mn` - Mongolian
  mn('mn'),

  /// `mr` - Marathi
  mr('mr'),

  /// `ms` - Malay
  ms('ms'),

  /// `my` - Burmese
  my('my'),

  /// `nb` - Norwegian Bokmål
  nb('nb'),

  /// `ne` - Nepali
  ne('ne'),

  /// `nl` - Dutch Flemish
  nl('nl'),

  /// `no` - Norwegian
  no('no'),

  /// `or` - Oriya
  or('or'),

  /// `pa` - Panjabi Punjabi
  pa('pa'),

  /// `pl` - Polish
  pl('pl'),

  /// `ps` - Pushto Pashto
  ps('ps'),

  /// `pt` - Portuguese (plus one country variation)
  pt('pt'),

  /// `ro` - Romanian Moldavian Moldovan
  ro('ro'),

  /// `ru` - Russian
  ru('ru'),

  /// `si` - Sinhala Sinhalese
  si('si'),

  /// `sk` - Slovak
  sk('sk'),

  /// `sl` - Slovenian
  sl('sl'),

  /// `sq` - Albanian
  sq('sq'),

  /// `sr` - Serbian (plus 2 scripts)
  sr('sr'),

  /// `sv` - Swedish
  sv('sv'),

  /// `sw` - Swahili
  sw('sw'),

  /// `ta` - Tamil
  ta('ta'),

  /// `te` - Telugu
  te('te'),

  /// `th` - Thai
  th('th'),

  /// `tl` - Tagalog
  tl('tl'),

  /// `tr` - Turkish
  tr('tr'),

  /// `uk` - Ukrainian
  uk('uk'),

  /// `ur` - Urdu
  ur('ur'),

  /// `uz` - Uzbek
  uz('uz'),

  /// `vi` - Vietnamese
  vi('vi'),

  /// `zh` - Chinese (plus 2 country variations and 2 scripts)
  zh('zh'),
  zhHans('zh', 'Hans'),
  zhHK('zh', 'HK'),
  zhTW('zh', 'TW'),

  /// `zu` - Zulu
  zu('zu'),
  ;

  const SupportedLanguages(this.languageCode, [this.countryCode]);

  final String languageCode;
  final String? countryCode;

  Locale get locale => Locale(languageCode, countryCode);
}
