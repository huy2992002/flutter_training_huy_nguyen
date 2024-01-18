// ignore_for_file: unused_local_variable

void main(List<String> args) {
  var name = 'Bob'; // type is String can not change type value

  dynamic name2 = 'Bob2'; // type is dynamic can change type
  name2 = 123;

  Object name3 = 'Bob3'; // Similar to Object but can be empty
  name3 = 123;

  String? name4;  // Nullable type. Can be `null` or string.

  late String name5; //use late if you’re sure that a variable is set before it’s used,

  const name6 = 'Bob5'; // Use const for variables that you want to be compile-time constants

  // ignore: prefer_typing_uninitialized_variables
  final name7; // Similar to const but can be assigned a value later

}




