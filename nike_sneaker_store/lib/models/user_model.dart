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
