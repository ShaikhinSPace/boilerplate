extension BoolExtension on bool {
  int toInt() => this ? 1 : 0;

  String onString() => toInt().toString();
}
