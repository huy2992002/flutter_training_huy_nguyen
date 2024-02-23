import 'package:nike_sneaker_store/utils/maths.dart';

class UserModel {
  UserModel({
    required this.uuid,
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
    this.address,
    this.phone,
  });

  String uuid;
  String name;
  String email;
  String password;
  String? avatar;
  String? address;
  String? phone;
}

List<UserModel> accounts = [
  UserModel(uuid: Maths.randomUUid(length: 6), name: 'hoang', email: 'hoang@gmail.com', password: '123456'),
  UserModel(uuid: Maths.randomUUid(length: 6), name: 'thuy', email: 'thuy@gmail.com', password: '123456'),
  UserModel(uuid: Maths.randomUUid(length: 6), name: 'tram', email: 'tram@gmail.com', password: '123456'),
  UserModel(uuid: Maths.randomUUid(length: 6), name: 'linh', email: 'linh@gmail.com', password: '123456'),
];

UserModel? userLogin;
