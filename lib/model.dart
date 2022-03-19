class ClockData {
  // final int h, m, s, d, year, month;

  String getTime() {
    DateTime _current = DateTime.now();
    return "${_current.hour} : ${_current.minute}";
  }

  String getDate() {
    DateTime _today = DateTime.now();
    return "${_today.day} : ${_today.month}";
  }
}
