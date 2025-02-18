import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import '../models/word_bank.dart';

class PlanCreatePage extends StatefulWidget {
  const PlanCreatePage({super.key});

  @override
  State<PlanCreatePage> createState() => _PlanCreatePageState();
}

class _PlanCreatePageState extends State<PlanCreatePage> {
  List<WordBank> _libraries = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadWordLibraries();
  }

  Future<void> _loadWordLibraries() async {
    try {
      final resourceDir = Directory('resource/words');
      final files = await resourceDir.list().toList();
      final libraries = <WordBank>[];

      for (var file in files) {
        if (file.path.endsWith('.json')) {
          final name = path.basenameWithoutExtension(file.path);
          final content = await File(file.path).readAsString();
          final jsonList = jsonDecode(content) as List;
          final words = jsonList.map((json) => Word.fromJson(json as Map<String, dynamic>)).toList();
          libraries.add(WordBank(name: name, words: words));
        }
      }

      setState(() {
        _libraries = libraries;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('加载单词库失败：$e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('创建学习计划'),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _libraries.isEmpty
              ? const Center(child: Text('暂无可用的单词库'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _libraries.length,
                  itemBuilder: (context, index) {
                    final library = _libraries[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListTile(
                        title: Text(library.name),
                        subtitle: Text('包含 ${library.wordCount} 个单词'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // TODO: 跳转到计划创建详情页面
                        },
                      ),
                    );
                  },
                ),
    );
  }
}