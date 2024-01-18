import 'dart:convert';
import 'dart:io';

class Services {
  static Map<String, dynamic> getDataJson(String path) {
    final data = File(path).readAsStringSync();
    final dictionary = jsonDecode(data) as Map<String, dynamic>;
    return dictionary;
  }

  static void saveDataJson(Map<String, dynamic> map, String path) {
    final file = File(path);
    final content = json.encode(map);
    file.writeAsStringSync(content);
  }
}
