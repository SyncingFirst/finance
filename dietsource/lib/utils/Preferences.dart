import 'package:get_storage/get_storage.dart';

class Preferences {
  // keys
  static const String jwtToken = "jwt_token";
  static const String userId = "user_id";

  GetStorage box = GetStorage();

  void setValue(String key, dynamic value) {
    box.write(key, value);
  }

  dynamic getValue(String key) {
    if (box.read(key) != null) {
      return box.read(key);
    }
    return null;
  }

  clear() {
    box.erase();
  }
}
