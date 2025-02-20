import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'word.dart';
import 'word_book.dart';

/// 单词库
class WordTable {
  /// 单词表名称
  final String name;
  /// 单词列表
  final List<Word> words;

  const WordTable({
    required this.name,
    required this.words,
  });

  /// 从词书配置文件加载所有词库
  static Future<List<WordTable>> loadFromBooks() async {
    // 加载词书配置文件
    final booksJsonString = await rootBundle.loadString('assets/words/word_books.json');
    final List<WordBook> books = await WordBook.loadFromJson(booksJsonString);
    
    // 加载每个词书的内容
    List<WordTable> tables = [];
    for (var book in books) {
      try {
        final jsonString = await rootBundle.loadString('assets/words/${book.file}');
        final Map<String, dynamic> bookData = json.decode(jsonString);
        
        // 加载词书中的每个单词表
        if (bookData['tables'] != null) {
          for (var table in bookData['tables']) {
            if (table['file'] != null) {
              final tableJsonString = await rootBundle.loadString('assets/words/${book.file.replaceAll('book.json', '')}${table['file']}');
              final List<dynamic> wordList = json.decode(tableJsonString);
              final words = wordList.map((json) => Word.fromJson(json)).toList();
              tables.add(WordTable(name: table['name'], words: words));
            }
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('加载词书失败: ${book.name} - $e');
        }
      }
    }
    return tables;
  }

  /// 从JSON文件加载单词库
  static Future<WordTable> loadFromJson(String name, String jsonPath) async {
    final jsonString = await rootBundle.loadString(jsonPath);
    final List<dynamic> jsonList = json.decode(jsonString);
    final words = jsonList.map((json) => Word.fromJson(json)).toList();
    return WordTable(name: name, words: words);
  }

  /// 获取单词数量
  int get wordCount => words.length;

  /// 获取单词库描述信息
  String get description => '$name (${wordCount}个单词)';
}