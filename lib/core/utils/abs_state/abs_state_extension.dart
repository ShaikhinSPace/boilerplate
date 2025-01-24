import 'dart:developer';

import 'package:dio/dio.dart';

import '../ui/pagination/model/meta_model.dart';

/// FUNC [getPaginationListData] : Return list of pagination data of type T
List<T> getPaginationListData<T>({
  required List<T> stateData,
  required bool isToRefresh,
  required Response<dynamic> l,
  required Function fromJson,
}) {
  try {
    Map<String, dynamic> mapData = l.data;
    if (mapData.containsKey('data') && mapData['data'] is List) {
      List<dynamic> dynamicList = List<dynamic>.of(mapData['data']);
      if (dynamicList.isEmpty) {
        return <T>[];
      }

      /// parse dynamic list data in the type of T data
      /// check dynamic list contains null data or not, if contains null data then ignore it
      List<T> parsedList = dynamicList
          .where((e) => e != null)
          .map<T>((e) => fromJson(e))
          .toList();

      /// if isToRefresh value is true, then make returnList value as empty else copy state data
      List<T> returnList = isToRefresh ? <T>[] : <T>[...stateData];

      /// if parsedList is not empty then add new data on return list
      if (parsedList.isNotEmpty) {
        returnList.addAll(parsedList);
      }
      return returnList;
    } else {
      log(':::GET PAGINATION DATA TYPE ::: $T ::: CASTING ERROR ::: SUCCESS DATA DOES NOT RETURN DATA ON STANDARD FORMAT :::');
      return stateData;
    }
  } catch (e) {
    log(':::GET PAGINATION DATA TYPE ::: $T ::: CASTING ERROR :::');
    return stateData;
  }
}

MetaModel getCurrentStatePage({required Response<dynamic> l}) {
  try {
    /// check dynamic success data l type is map
    Map<String, dynamic> lData =
        l.data != null && l.data is Map ? l.data : <String, dynamic>{};
    if (lData.containsKey('meta') &&
        Map<String, dynamic>.of(lData['meta']).isNotEmpty) {
      MetaModel meta = MetaModel.fromJson(lData['meta']);
      return meta.copyWith(currentPage: (meta.currentPage ?? 0) + 1);
    } else {
      log(':::GET CURRENT PAGE ::: CASTING ERROR :::');
      return MetaModel().copyWith(currentPage: 1, lastPage: 1, total: 0);
    }
  } catch (e) {
    log(':::GET CURRENT PAGE ::: CASTING ERROR :::');
    return MetaModel().copyWith(currentPage: 1, lastPage: 1, total: 0);
  }
}

List<T> getSuccessDataOnList<T>({
  required Response<dynamic> l,
  required Function fromJson,
}) {
  try {
    if (l.data != null && l.data is List) {
      List<dynamic> dynamicList = List<dynamic>.of(l.data);
      if (dynamicList.isEmpty) {
        return <T>[];
      } else {
        List<T> parsedList = dynamicList
            .where((e) => e != null)
            .map<T>((e) => fromJson(e))
            .toList();
        return parsedList;
      }
    } else if (l.data != null && l.data is Map) {
      Map<String, dynamic> responseData = l.data;
      if (responseData.isNotEmpty && responseData.containsKey('data')) {
        List<dynamic> dynamicList = List<dynamic>.of(l.data['data']);
        if (dynamicList.isEmpty) {
          return <T>[];
        } else {
          List<T> parsedList = dynamicList
              .where((e) => e != null)
              .map<T>((e) => fromJson(e))
              .toList();
          return parsedList;
        }
      } else {
        log(':::FROM MAP RETURN LIST ::: EMPTY ::: $T :::');
        return <T>[];
      }
    } else {
      log(':::RETURN LIST ::: EMPTY ::: $T :::');
      return <T>[];
    }
  } catch (e) {
    log(':::RETURN LIST ::: CASTING ERROR ::: $T :::');
    return <T>[];
  }
}

T? getSuccessDataOnMap<T>({
  required Response<dynamic> l,
  required Function fromJson,
}) {
  T? model;
  try {
    if (l.data != null && l.data is Map) {
      Map<String, dynamic> dynamicData = Map<String, dynamic>.of(l.data);
      if (dynamicData.isEmpty) {
        return model;
      }
      if (dynamicData.containsKey('data') && dynamicData['data'] is Map) {
        Map<String, dynamic> dynamicData1 = dynamicData['data'];
        if (dynamicData1.isEmpty) {
          return model;
        }
        try {
          model = fromJson(dynamicData1);
        } catch (e) {
          log(':::getSuccessDataOnMap 0::: TYPE CASTING ERROR :::');
          log(e.toString());
        }
      } else {
        try {
          model = fromJson(dynamicData);
        } catch (e) {
          log(':::getSuccessDataOnMap 1::: TYPE CASTING ERROR ::: ');
          log(e.toString());
        }
      }
    } else {
      log(':::getSuccessDataOnMap 2::: TYPE ERROR ::: \n $l');
      return model;
    }
  } catch (e) {
    log(e.toString());
  }
  return model;
}
