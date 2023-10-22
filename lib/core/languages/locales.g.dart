library app_translation;

// ignore_for_file: lines_longer_than_80_chars, constant_identifier_names
// ignore: avoid_classes_with_only_static_members

part 'en_en_locales.dart';
part 'pt_br_locales.dart';


class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_EN': en_EN,
    'pt_BR': pt_BR,
  };
}

class LocaleKeys {
  LocaleKeys._();
  static const buttons_login = 'buttons_login';
  static const buttons_sign_in = 'buttons_sign_in';
  static const buttons_logout = 'buttons_logout';
  static const buttons_sign_in_fb = 'buttons_sign_in_fb';
  static const buttons_sign_in_google = 'buttons_sign_in_google';
  static const buttons_sign_in_apple = 'buttons_sign_in_apple';
  static const text_how_can_we_help = 'text_how_can_we_help';

}

