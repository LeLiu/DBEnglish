import 'package:flutter/material.dart';
import '../models/word_book.dart';
import '../models/word_table.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/word.dart';

/// 词书管理页面
class WordBookManagePage extends StatefulWidget {
  const WordBookManagePage({super.key});

  @override
  State<WordBookManagePage> createState() => _WordBookManagePageState();
}

class _WordBookItem {
  final WordBook book;
  final List<WordTable> tables;
  bool isExpanded;

  _WordBookItem({
    required this.book,
    required this.tables,
    this.isExpanded = false,
  });
}

class _WordBookManagePageState extends State<WordBookManagePage> {
  final List<_WordBookItem> _wordBooks = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadWordBooks();
  }

  Future<void> _loadWordBooks() async {
    try {
      // 加载词书配置文件
      final booksJsonString = await rootBundle.loadString('words/word_books.json');
      final List<dynamic> booksJson = json.decode(booksJsonString);
      final List<WordBook> books = booksJson.map((json) => WordBook.fromJson(json as Map<String, dynamic>)).toList();

      // 加载每个词书的内容
      final List<_WordBookItem> bookItems = [];
      for (var book in books) {
        try {
          final jsonString = await rootBundle.loadString('words/${book.file}');
          final Map<String, dynamic> bookData = json.decode(jsonString);

          // 加载词书中的每个单词表
          final List<WordTable> tables = [];
          if (bookData['tables'] != null) {
            for (var table in bookData['tables']) {
              if (table['file'] != null) {
                final tableJsonString = await rootBundle.loadString(
                  'words/${book.file.replaceAll('book.json', '')}${table['file']}',
                );
                final List<dynamic> wordList = json.decode(tableJsonString);
                final words =
                    wordList.map((json) => Word.fromJson(json)).toList();
                tables.add(WordTable(name: table['name'], words: words));
              }
            }
          }
          bookItems.add(_WordBookItem(book: book, tables: tables));
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('加载词书失败: ${book.name} - $e')),
            );
          }
          continue; // 跳过加载失败的词书，继续加载其他词书
        }
      }

      if (mounted) {
        setState(() {
          _wordBooks.addAll(bookItems);
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _loading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('加载词书配置失败: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('词书管理')),
      body:
          _loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _wordBooks[index].isExpanded = !isExpanded;
                    });
                  },
                  children:
                      _wordBooks.map<ExpansionPanel>((bookItem) {
                        return ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(bookItem.book.name),
                              subtitle: Text('${bookItem.tables.length}个词表'),
                            );
                          },
                          body: Column(
                            children:
                                bookItem.tables.map((table) {
                                  return ListTile(
                                    title: Text(table.name),
                                    subtitle: Text('${table.wordCount}个单词'),
                                    leading: const Icon(Icons.table_chart),
                                  );
                                }).toList(),
                          ),
                          isExpanded: bookItem.isExpanded,
                        );
                      }).toList(),
                ),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 实现词书导入功能
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
