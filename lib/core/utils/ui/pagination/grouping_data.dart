Map<String, List<T>> groupListByKey<T>(
    {required List<T> items, required String Function(T) getKey}) {
  Map<String, List<T>> groupedData = <String, List<T>>{};
  for (var item in items) {
    String key = getKey(item);
    if (groupedData[key] == null) {
      groupedData[key] = <T>[];
    }
    groupedData[key]!.add(item);
  }
  return groupedData;
}

Map<String, List<T>> groupSubordinatesByDepartment<T>(
    {required List<T> items, required String Function(T) getKey}) {
  Map<String, List<T>> groupedData = <String, List<T>>{};
  for (var item in items) {
    String key = getKey(item);
    if (groupedData[key] == null) {
      groupedData[key] = <T>[];
    }
    groupedData[key]!.add(item);
  }
  return groupedData;
}
