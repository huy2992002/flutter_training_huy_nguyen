void main(List<String> args) {
  bad(null); // 0
  bad('Hello'); // 5

  String? maybeString; // Null or not null
  requireStringNotNull(maybeString ?? 'Hello'); // if maybeSting == null => Hello enforcement method .

  String st = missingReturn() ?? ''; // because method missingReturn return String? => if return null => ''
  print(st);

  String? st2 = missingReturn(); // if 2 sides type String? can assign data
  print(st2);
} 

bad(String? maybeString) {
  print(maybeString?.length ?? 0); // use ? if maybeString null => 0 : => mabeString.length 
}

requireStringNotNull(String definitelyString) {
  print(definitelyString.length);
}

String? missingReturn() {
  return '';
}

void sayHello(String name, int? yearOfbirth) {
  if(yearOfbirth != null) {
    int age = DateTime.now().year - yearOfbirth; // confirm yearOfbirth not null (can be use ! keyword)
    print('name: $name ,age: $age');
  }else {
    print('name: $name');
  }
}