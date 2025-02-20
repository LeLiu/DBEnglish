import 'package:flutter/material.dart';
import '../models/word_table.dart';
import '../models/word_book.dart';
import 'package:flutter/services.dart';

/// 单词库选择页面
class WordTableSelectPage extends StatefulWidget {
  const WordTableSelectPage({super.key});

  @override
  State<WordTableSelectPage> createState() => _WordTableSelectPageState();
}

class _WordTableSelectPageState extends State<WordTableSelectPage> {
  final List<WordTable> _wordTables = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadWordTables();
  }

  Future<void> _loadWordTables() async {
    try {
      // 加载词书配置文件
      final configJson = await rootBundle.loadString(
        'assets/words/word_books.json',
      );
      final wordBooks = await WordBook.loadFromJson(configJson);

      // 加载所有词书
      final tables = await Future.wait(
        wordBooks.map((book) async {
          // 从json文件加载单词库
          return await WordTable.fromJson(
            book.name,
            'assets/words/${book.file}',
          );
        }),
      );

      setState(() {
        _wordTables = tables;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('加载单词库失败：$e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('选择单词库')),
      body:
          _loading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _wordTables.length,
                itemBuilder: (context, index) {
                  final table = _wordTables[index];
                  return ListTile(
                    title: Text(table.name),
                    subtitle: Text('${table.words.length}个单词'),
                    onTap: () {
                      Navigator.pop(context, table);
                    },
                  );
                },
              ),
    );
  }
}
