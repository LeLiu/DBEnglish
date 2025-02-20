import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/word_book.dart';

class WordBookScreen extends StatelessWidget {
  const WordBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WordBookController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('词书管理'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(
        () =>
            controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                  itemCount: controller.wordBooks.length,
                  itemBuilder: (context, index) {
                    final wordBook = controller.wordBooks[index];
                    return ListTile(
                      title: Text(wordBook.name),
                      subtitle: Text(wordBook.file),
                      onTap: () => controller.selectWordBook(wordBook),
                    );
                  },
                ),
      ),
    );
  }
}

class WordBookController extends GetxController {
  final wordBooks = <WordBook>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadWordBooks();
  }

  Future<void> loadWordBooks() async {
    try {
      // 从资源文件加载词书配置
      final configJson = await rootBundle.loadString('words/word_books.json');
      final books = await WordBook.loadFromJson(configJson);
      wordBooks.assignAll(books);
    } catch (e) {
      debugPrint('加载词书失败: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectWordBook(WordBook wordBook) {
    // TODO: 实现词书选择逻辑
    debugPrint('选择词书: ${wordBook.name}');
  }
}
