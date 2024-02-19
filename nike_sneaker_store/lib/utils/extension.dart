extension ExString on double {
  String toPriceDollar() {
    return '\$ ${toStringAsFixed(2)}';
  }
}
