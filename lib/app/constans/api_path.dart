

class ApiPath {
  
  static const baseUrl = "http://localhost:9090/api";

  static const users = "$baseUrl/users";

  static const call = "$baseUrl/call/v1";

  static const status = "$call/status";

  static const callType = "$baseUrl/call-type/v1";

  static const sector = "$callType/sector";

  static const priority = "$callType/priority";

}