
// ignore_for_file: constant_identifier_names

class ApiPath {

  static const USERS_PATH = '/users';

  static const USER_PATH = '/v1/user';

  static const USER_TINY_PATH = '$USER_PATH/tiny';

  static const CALL_PATH = '/call/v1';

  static const RATING_PATH = '$CALL_PATH/rating';
  
  static const STATUS_PATH = '$CALL_PATH/status';

  static const SET_STATUS_PATH = '$STATUS_PATH/change';

  static const CALL_CATEGORY_PATH = '/call-type/v1';

  static const SECTOR_PATH = '$CALL_CATEGORY_PATH/sector';

  static const PRIORITY_PATH = '$CALL_CATEGORY_PATH/priority';

  static const AUTH_PATH = '/auth/v1';

  static const LOGIN_PATH = '$AUTH_PATH/authenticate';

  static const SINGUP_PATH = '$AUTH_PATH/register';

  static const SOLVER_PATH = '$CALL_PATH/solver';

  static const ASSIGN_SOLVER_PATH = '$SOLVER_PATH/assign';
}
