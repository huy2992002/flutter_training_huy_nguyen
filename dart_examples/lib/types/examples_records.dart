void main(List<String> args) {
  //Records are an anonymous, immutable, aggregate type.
  var record = ('first', a: 2, b: true, 'last');
  print(record);
  print(record.$1); //'first'
  print(record.a); // 2
  print(record.b); // true


  (String, int) record2 = ('Hello', 2);
  print(record2); // ('Hello', 2)

  ({int a, int b}) recordAB = (a: 1, b: 2); // use {} suggestion
  print(recordAB); // (a: 1, b: 2)

  print((2,3) == (2,3)); // compare 2 records

  print(swap((2, 3))); // (3, 2)
}

(int, int) swap((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
