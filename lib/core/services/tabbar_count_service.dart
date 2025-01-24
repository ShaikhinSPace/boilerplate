import 'package:record_keeping/common/model/tab_bar_model.dart';

class TabbarCountService {
  static List<TabBarModel> getCountFromState<T>(
      {required List<TabBarModel> tabList,
      required Map<String, dynamic>? countMap}) {
    List<TabBarModel> listWithCount = tabList.map<TabBarModel>((TabBarModel e) {
      if (countMap != null) {
        return e.copyWith(
          count: countMap[e.slug].toString(),
        );
      } else {
        return e;
      }
    }).toList();
    return listWithCount;
  }

  static String? convertIntoThousands(String? count) {
    if (count != null) {
      if (count.length > 3) {
        int countValue = int.parse(count);
        double inThousands = countValue / 1000;
        return '${inThousands.round().toString()}K';
      } else {
        return count;
      }
    } else {
      return null;
    }
  }
}
