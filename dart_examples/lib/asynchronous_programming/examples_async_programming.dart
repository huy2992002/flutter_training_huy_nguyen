void main(List<String> args) {
  order('Pho');

  //user catchError exception future method if throw Exception (onError)
  test(true).catchError((onError) {
    print(onError);
  }); // Oke

  test(false).catchError((onError) {
    print(onError);
  }); // Test Error


}

Future<void> order(String food) async {
  print('Order $food ');
  await cook(); // user await func cook finished
}

Future<void> cook() async {
  await Future.delayed(Duration(milliseconds: 1000), () {
    // user await func delayed finished continue func
    print('Cooking...');
  });

  print('finished cooking');
}

Future<void> test(bool test) async {
  if (test) {
    print('Ok');
  } else {
    throw Exception('Test Error');
  }
}
