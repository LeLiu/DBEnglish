import 'package:flutter/material.dart';

class ViewPlansPage extends StatelessWidget {
  const ViewPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('查看学习计划'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('学习计划列表页面'),
      ),
    );
  }
}