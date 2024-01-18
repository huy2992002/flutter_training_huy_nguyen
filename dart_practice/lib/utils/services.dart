import 'dart:convert';
import 'dart:io';

Map<String, dynamic> getDataJson(String path) {
  final data = File(path).readAsStringSync();
  final dictionary = jsonDecode(data) as Map<String, dynamic>;
  return dictionary;
}

void saveDataJson(Map<String, dynamic> dictionary, String path) {
  final file = File(path);
  final content = json.encode(dictionary);
  file.writeAsStringSync(content);
}
