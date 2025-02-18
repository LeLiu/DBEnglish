import 'package:flutter/material.dart';
import '../models/word_bank.dart';

/// 单词库选择页面
class WordBankSelectPage extends StatefulWidget {
  const WordBankSelectPage({super.key});

  @override
  State<WordBankSelectPage> createState() => _WordBankSelectPageState();
}

class _WordBankSelectPageState extends State<WordBankSelectPage> {
  List<WordBank> _wordBanks = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadWordBanks();
  }

  Future<void> _loadWordBanks() async {
    try {
      final banks = await Future.wait([
        WordBank.loadFromJson('人教版新起点', 'assets/words/人教版新起点.json'),
      ]);
      setState(() {
        _wordBanks = banks;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
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
        title: const Text('选择单词库'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _wordBanks.length,
              itemBuilder: (context, index) {
                final bank = _wordBanks[index];
                return ListTile(
                  title: Text(bank.name),
                  subtitle: Text('${bank.wordCount}个单词'),
                  onTap: () {
                    Navigator.pop(context, bank);
                  },
                );
              },
            ),
    );
  }
}