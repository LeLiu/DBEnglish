import 'package:flutter/foundation.dart';
import 'word.dart';

/// 单词库
class WordBank {
  /// 单词库名称
  final String name;
  /// 单词列表
  final List<Word> words;

  const WordBank({
    required this.name,
    required this.words,
  });

  /// 从JSON文件加载单词库
  static Future<WordBank> loadFromJson(String name, String jsonPath) async {
    final jsonString = await rootBundle.loadString(jsonPath);
    final List<dynamic> jsonList = json.decode(jsonString);
    final words = jsonList.map((json) => Word.fromJson(json)).toList();
    return WordBank(name: name, words: words);
  }

  /// 获取单词数量
  int get wordCount => words.length;

  /// 获取单词库描述信息
  String get description => '$name (${wordCount}个单词)';
}