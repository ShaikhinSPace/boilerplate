extension FirstWhereOrNull<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) condition) {
    final List<T> data = where((condition)).toList();
    return data.isEmpty ? null : data.first;
  }
}

extension FirstOrNull<T> on Iterable<T?> {
  T? firstOrNull() => isNotEmpty ? first : null;
}

extension ItemAtIndexOrNull<T> on Iterable<T> {
  T? itemAtIndexOrNull(int index) {
    try {
      return elementAt(index);
    } catch (e) {
      return null;
    }
  }
}
