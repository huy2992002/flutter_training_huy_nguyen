import 'dart:convert';
import 'dart:io';

class Services {
  static Map<String, dynamic> getDataJson(String path) {
    String data = File(path).readAsStringSync();
    Map<String, dynamic> dictionary = jsonDecode(data) as Map<String, dynamic>;
    return dictionary;
  }

  static void saveDataJson(Map<String, dynamic> map, String path) {
    File file = File(path);
    String content = json.encode(map);
    file.writeAsStringSync(content);
  }
}
