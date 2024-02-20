class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
    this.address,
    this.phone,
  });

  String id;
  String name;
  String email;
  String password;
  String? avatar;
  String? address;
  String? phone;
}

List<UserModel> accounts = [
  UserModel(id: '1', name: 'hoang', email: 'hoang@gmail.com', password: '123456'),
  UserModel(id: '2', name: 'thuy', email: 'thuy@gmail.com', password: '123456'),
  UserModel(id: '3', name: 'tram', email: 'tram@gmail.com', password: '123456'),
  UserModel(id: '4', name: 'linh', email: 'linh@gmail.com', password: '123456'),
];
