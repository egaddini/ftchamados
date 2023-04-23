

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['role'] = this.role;
    data['token'] = this.token;
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



