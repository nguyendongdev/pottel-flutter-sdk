import 'package:shared_preferences/shared_preferences.dart';

class StoreClient {
  const StoreClient._();
  static const String _tokenKey = "TOKEN";
  static const String _account = "ACCOUNT";
  static const String _id = "ID";
  static const String _isFirstTime = "isFirstTime";
  static const String _phone = "PHONE";
  static const String _clientId = 'clientId';
  static const String _biometrics = 'BIOMETRICS';
  static const String _isShowTooltipStep = "isShowTooltipStep";
  static const String _tokenAppota = "tokenAppota";
  static const String _rankId = 'rankId';
  static const String _currentPoint = 'currentPoint';
  static const String _sodKey = 'SOD_KEY';

  static Future<void> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey);
  }

  static Future<void> clearToken() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_tokenKey);
  }

  static Future<void> setAccount(String account) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_account, account);
  }

  static Future<String?> getAccount() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_account);
  }

  static Future<void> clearAccount() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_account);
  }

  static Future<void> setId(String id) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_id, id);
  }

  static Future<String?> getId() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_id);
  }

  static Future<void> setPhone(String phone) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_phone, phone);
  }

  static Future<String?> getPhone() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_phone);
  }

  static Future<void> clearPhone() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_phone);
  }

  static Future<void> clearId() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_id);
  }

  static Future<void> setClientId(String clientId) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_clientId, clientId);
  }

  static Future<String?> getClientId() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_clientId);
  }

  static Future<void> clearClientId() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_clientId);
  }

  static Future<void> clearAll() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static Future<void> setBiometrics(String biometricsValue) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_biometrics, biometricsValue);
  }

  static Future<void> clearBiometrics() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_biometrics);
  }

  static Future<String?> getBiometrics() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_biometrics);
  }

  static Future<bool> setRankId(String rankId) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(_rankId, rankId);
  }

  static Future<void> clearRankId() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_rankId);
  }

  static Future<String?> getRankId() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_rankId);
  }

  static Future<bool> setCurrentPoint(String currentPoint) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(_currentPoint, currentPoint);
  }

  static Future<void> clearCurrentPoint() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_currentPoint);
  }

  static Future<String?> getCurrentPoint() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_currentPoint);
  }

  // set isFirtTime
  static Future<void> setIsFirstTime(bool isFirtTime) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_isFirstTime, isFirtTime);
  }

  // get isFirtTime
  static Future<bool> getIsFirstTime() async {
    final preferences = await SharedPreferences.getInstance();
    try {
      return preferences.getBool(_isFirstTime)!;
    } catch (e) {
      return true;
    }
  }

  // ẩn hiện tooltip hướng dẫn
  static Future<void> setIsShowTooltipStep(bool isFirtTime) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_isShowTooltipStep, isFirtTime);
  }

  static Future<bool> getIsShowTooltipStep() async {
    final preferences = await SharedPreferences.getInstance();
    try {
      return preferences.getBool(_isShowTooltipStep)!;
    } catch (e) {
      return true;
    }
  }

  // token appota
  static Future<void> setTokenAppota(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenAppota, token);
  }

  static Future<void> clearTokenAppota() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_tokenAppota);
  }

  static Future<String?> getTokenAppota() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenAppota);
  }

  static Future<void> setSod(String key, String sodData) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, sodData);
  }

  static Future<String?> getSod(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<void> clearSod(String key) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(key);
  }
}
