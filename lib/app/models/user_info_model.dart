class UserInfoModel {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? role;
  String? token;

  UserInfoModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.role,
      this.token,
      });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['role'] = role;
    data['token'] = token;
    return data;
  }
  
  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      id: map['id'] ?? '',
      firstname: map['firstname'] ?? '', 
      lastname: map['lastname'] ?? '', 
      email: map['email'] ?? '',
      role: map['role'] ?? '',  
      token: map['token'] ?? ''
    );
  }

}



