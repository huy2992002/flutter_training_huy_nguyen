import 'package:nike_sneaker_store/utils/maths.dart';

class UserModel {
  /// Object user 
  /// 
  /// include
  /// [uuid], [name], [email], [password] arguments must not be null
  /// and [avatar], [address], [phone] argument has default value is false 
  UserModel({
    required this.uuid,
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
    this.address,
    this.phone,
  });

  /// uuid of [UserModel] , argument must not be duplicated
  String uuid;

  /// name of user
  String name;

  /// email of user
  String email;

  /// password of user
  String password;

  /// avatar of user
  String? avatar;

  /// address of user
  String? address;

  /// number phone of user
  String? phone;
}

/// Fetch data list [UserModel]
List<UserModel> accounts = [
  UserModel(uuid: Maths.randomUUid(length: 6), name: 'hoang', email: 'hoang@gmail.com', password: '123456'),
  UserModel(uuid: Maths.randomUUid(length: 6), name: 'thuy', email: 'thuy@gmail.com', password: '123456'),
  UserModel(uuid: Maths.randomUUid(length: 6), name: 'tram', email: 'tram@gmail.com', password: '123456'),
  UserModel(uuid: Maths.randomUUid(length: 6), name: 'linh', email: 'linh@gmail.com', password: '123456'),
];

/// If there is a user login, [userLogin] will be assigned a value.
/// If there is a user logout, [userLogin] will be null
UserModel? userLogin;
