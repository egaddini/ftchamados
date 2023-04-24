

import 'package:chamados/models/user_info_model.dart';
import 'package:flutter/material.dart';

abstract class UserService {
  UserInfoModel getLogedUserInfo(BuildContext context);
  
  List<UserInfoModel> getAllUsersInfo(BuildContext context);
}

class UserServiceImpl implements UserService {


  @override
  UserInfoModel getLogedUserInfo(BuildContext context) {
    return UserInfoModel(
          id: 1,
          firstname: 'Edder',
          lastname: 'Gaddini',
          email: 'eddergaddini@gmail.com',
          role: 'admin',
          token: '289798897789',
        );
  }

  @override
  List<UserInfoModel> getAllUsersInfo(BuildContext context) {
    return [
        UserInfoModel(
          id: 1,
          firstname: 'Edder',
          lastname: 'Gaddini',
          email: 'eddergaddini@gmail.com',
          role: 'admin',
          token: '289798897789',
        ),
        UserInfoModel(
          id: 2,
          firstname: 'Bob',
          lastname: 'Brown',
          email: 'bob.brown@example.com',
          role: 'user',
          token: '456-789-123',
        ),
        UserInfoModel(
          id: 3,
          firstname: 'Charlie',
          lastname: 'Clark',
          email: 'charlie.clark@example.com',
          role: 'user',
          token: '789-123-456',
        ),
        UserInfoModel(
          id: 4,
          firstname: 'David',
          lastname: 'Davis',
          email: 'david.davis@example.com',
          role: 'moderator',
          token: '123-789-456',
        ),
        UserInfoModel(
          id: 5,
          firstname: 'Eve',
          lastname: 'Evans',
          email: 'eve.evans@example.com',
          role: 'user',
          token: '456-123-789',
        ),
        UserInfoModel(
          id: 6,
          firstname: 'Frank',
          lastname: 'Franklin',
          email: 'frank.franklin@example.com',
          role: 'user',
          token: '789-456-123',
        ),
        UserInfoModel(
          id: 7,
          firstname: 'Grace',
          lastname: 'Garcia',
          email: 'grace.garcia@example.com',
          role: 'admin',
          token: '123-456-789',
        ),
        UserInfoModel(
          id: 8,
          firstname: 'Heidi',
          lastname: 'Harris',
          email: 'heidi.harris@example.com',
          role: 'user',
          token: '456-789-123',
        ),
        UserInfoModel(
          id: 9,
          firstname: 'Isaac',
          lastname: 'Ingram',
          email: 'isaac.ingram@example.com',
          role: 'user',
          token: '789-123-456',
        ),
        UserInfoModel(
          id: 10,
          firstname: 'Judy',
          lastname: 'Johnson',
          email: 'judy.johnson@example.com',
          role: 'moderator',
          token: '123-789-456',
        ),
      ];
  }

  
}



