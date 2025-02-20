import 'dart:convert';

/// 词书配置信息
class WordBook {
  /// 词书名称
  final String name;
  /// 词书文件路径
  final String file;

  const WordBook({
    required this.name,
    required this.file,
  });

  /// 从JSON对象创建词书配置
  factory WordBook.fromJson(Map<String, dynamic> json) {
    return WordBook(
      name: json['name'] as String,
      file: json['file'] as String,
    );
  }

  /// 从JSON字符串加载词书配置
  static Future<List<WordBook>> loadFromJson(String jsonString) async {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => WordBook.fromJson(json as Map<String, dynamic>)).toList();
  }
}