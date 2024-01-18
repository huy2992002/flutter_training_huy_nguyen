extension ExInt on int {
  String? toStringMonth() {
    final stringMonth = {
      1: 'January',
      2: 'February',
      3: 'March',
      4: 'April',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'August',
      9: 'September',
      10: 'October',
      11: 'November',
      12: 'December',
    };

    return stringMonth[this];
  }
}

extension ExDouble on double {
  String toFormatVnd() {
    final stThis = toInt().toString();
    var st = ' Vnd';
    var count = 0;

    for (var i = stThis.length - 1; i >= 0; i--) {
      st = '${stThis[i]}$st';
      count++;
      if (count == 3 && i != 0) {
        st = '.$st';
        count = 0;
      }
    }
    return st;
  }
}
