
// ignore_for_file: constant_identifier_names

class ApiPath {

  static const BASE_URL = 'http://localhost:9090/api';

  static const USERS_PATH = '$BASE_URL/users';

  static const USER_PATH = '$BASE_URL/v1/user';

  static const CALL_PATH = '$BASE_URL/call/v1';

  static const STATUS_PATH = '$CALL_PATH/status';

  static const CALL_CATEGORY_PATH = '$BASE_URL/call-type/v1';

  static const SECTOR_PATH = '$CALL_CATEGORY_PATH/sector';

  static const PRIORITY_PATH = '$CALL_CATEGORY_PATH/priority';

  static const AUTH_PATH = '/auth/v1';

  static const LOGIN_PATH = '$AUTH_PATH/authenticate';

  static const REGISTER_PATH = '/register';

}
