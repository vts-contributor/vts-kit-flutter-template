


import 'language.dart';

/// The translations for English (`en`).
class LanguageEn extends Language {
  LanguageEn([String locale = 'en']) : super(locale);

  @override
  String get examplePortrait => 'This is portrait screen';

  @override
  String get exampleLandscape => 'This is landscape screen';
}
