import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../constant/shared_prefs_key.dart';

abstract class NetworkCacheService {
  late Box _box;

  Future<void> initCacheService();

  Map<String, dynamic> getCacheData({
    required String key,
    required bool isToRefresh,
    required bool hasInternet,
  });

  Future<void> saveDataToCache({
    required dynamic value,
    required Duration cacheDuration,
    required String key,
    required String endPoint,
    required bool isToRefresh,
  });

  Future<void> clearCacheData();
}

class NetworkCacheServiceImpl implements NetworkCacheService {
  final String _cacheKey = "dio-cache";

  @override
  late Box _box;

  @override
  Future<void> initCacheService() async {
    try {
      String dirPath = Platform.isIOS
          ? (await getApplicationSupportDirectory()).path
          : (await getApplicationDocumentsDirectory()).path;

      Hive.init(dirPath);

      _box = await Hive.openBox(_cacheKey);
    } catch (e) {
      log("::: Hive Initialization Error ::: [NetworkCacheService] :::");
    }
  }

  @override
  Future<void> saveDataToCache({
    required dynamic value,
    required Duration cacheDuration,
    required String endPoint,
    required String key,
    required bool isToRefresh,
  }) async {
    try {
      Map<String, dynamic> cacheData = {};
      String? cacheKeyData = _box.get(_cacheKey);
      if (cacheKeyData != null) {
        cacheData = jsonDecode(cacheKeyData);
      }
      if (cacheData.isNotEmpty && isToRefresh) {
        List<String> filteredUrls = _getMatchingUrls(cacheData, key, endPoint);
        if (filteredUrls.isNotEmpty) {
          for (var element in filteredUrls) {
            cacheData.remove(element);
          }
        }
      }

      Map<String, dynamic> responseData = {
        SharedPrefsKey.expiryDateMapKey:
            DateTime.now().add(cacheDuration).toString(),
        SharedPrefsKey.dataMapKey: jsonEncode(value),
      };
      cacheData[key] = responseData;
      await _box.put(_cacheKey, jsonEncode(cacheData));
    } catch (e) {
      log("::: Can't Save Data To Hive ::: [NetworkCacheService] :::");
    }
  }

  @override
  Map<String, dynamic> getCacheData({
    required String key,
    required bool isToRefresh,
    required bool hasInternet,
  }) {
    try {
      Map<String, dynamic> cachedData = {};
      String? cacheKeyData = _box.get(_cacheKey);
      if (cacheKeyData != null) {
        Map<String, dynamic> responseData = jsonDecode(cacheKeyData);
        if (responseData.containsKey(key)) {
          cachedData = responseData[key];
          if (cachedData.isNotEmpty) {
            DateTime expiryDate =
                DateTime.parse(cachedData[SharedPrefsKey.expiryDateMapKey]);
            bool isExpired = DateTime.now().isAfter(expiryDate);

            if (!isExpired && hasInternet) {
              return jsonDecode(cachedData[SharedPrefsKey.dataMapKey]);
            } else {
              if (!hasInternet) {
                return jsonDecode(cachedData[SharedPrefsKey.dataMapKey]);
              }
            }
          }
        }
      }
      return {};
    } catch (e) {
      log("::: Can't Return Data From Hive ::: [NetworkCacheService] :::");
      return {};
    }
  }

  @override
  Future<void> clearCacheData() async {
    try {
      await _box.put(_cacheKey, jsonEncode({}));
    } catch (e) {
      log("::: Error Raised During Cache Data Clear ::: [NetworkCacheService] :::");
    }
  }
}

List<String> _getMatchingUrls(
    Map<String, dynamic> mData, String inputUrl, String endpoint) {
  List<String> matchingUrls = [];

  // Iterate through the mData map and find matching URLs
  mData.forEach((url, value) {
    String inputUrl1 = inputUrl
        .replaceAll(RegExp(r'"page":\d+'), '')
        .replaceAll(RegExp(r"'page':\d+"), '')
        .replaceAll(RegExp(r'"page":"\d+"'), '');
    String url1 = url
        .replaceAll(RegExp(r'"page":\d+'), '')
        .replaceAll(RegExp(r"'page':\d+"), '')
        .replaceAll(RegExp(r'"page":"\d+"'), '');

    if (url1.contains(inputUrl1)) {
      matchingUrls.add(url);
    }
  });

  return matchingUrls;
}
