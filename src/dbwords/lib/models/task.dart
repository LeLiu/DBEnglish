import 'package:flutter/foundation.dart';
import 'word.dart';

/// 学习项目类型
enum LearningItem {
  /// 词义讲解
  meaningExplanation('L1'),
  /// 语音跟读
  pronunciationPractice('L2'),
  /// 单词拼写讲解
  spellingExplanation('L3');

  final String code;
  const LearningItem(this.code);
}

/// 测试项目类型
enum TestItem {
  /// 动态拼写补全
  dynamicSpelling('T1'),
  /// 单词拼写
  spelling('T2'),
  /// 例句选择填空
  sentenceCompletion('T3'),
  /// 词义选择
  meaningSelection('T4');

  final String code;
  const TestItem(this.code);
}

/// 学习任务
class StudyTask {
  /// 任务日期
  final DateTime date;
  /// 学习计划名称
  final String planName;
  /// 要学习的单词列表
  final List<TaskWord> words;

  const StudyTask({
    required this.date,
    required this.planName,
    required this.words,
  });

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'plan_name': planName,
    'words': words.map((w) => w.toJson()).toList(),
  };

  factory StudyTask.fromJson(Map<String, dynamic> json) => StudyTask(
    date: DateTime.parse(json['date'] as String),
    planName: json['plan_name'] as String,
    words: (json['words'] as List<dynamic>)
        .map((w) => TaskWord.fromJson(w as Map<String, dynamic>))
        .toList(),
  );
}

/// 任务中的单词
class TaskWord {
  /// 单词编号
  final int no;
  /// 单词
  final String word;
  /// 当前掌握程度
  final double masteryLevel;
  /// 复习次数
  final int reviewCount;
  /// 学习前测试项目
  final List<TestItem> preTestItems;
  /// 学习项目
  final List<LearningItem> learningItems;
  /// 学习后测试项目
  final List<TestItem> postTestItems;
  /// 单词权重
  final double weight;

  const TaskWord({
    required this.no,
    required this.word,
    required this.masteryLevel,
    required this.reviewCount,
    this.preTestItems = const [],
    this.learningItems = const [],
    this.postTestItems = const [],
    this.weight = 1.0,
  });

  Map<String, dynamic> toJson() => {
    'no': no,
    'word': word,
    'mastery_level': masteryLevel,
    'review_count': reviewCount,
    'pre_test_items': preTestItems.map((i) => i.code).toList(),
    'learning_items': learningItems.map((i) => i.code).toList(),
    'post_test_items': postTestItems.map((i) => i.code).toList(),
    'weight': weight,
  };

  factory TaskWord.fromJson(Map<String, dynamic> json) => TaskWord(
    no: json['no'] as int,
    word: json['word'] as String,
    masteryLevel: json['mastery_level'] as double,
    reviewCount: json['review_count'] as int,
    preTestItems: (json['pre_test_items'] as List<dynamic>)
        .map((c) => TestItem.values.firstWhere((i) => i.code == c))
        .toList(),
    learningItems: (json['learning_items'] as List<dynamic>)
        .map((c) => LearningItem.values.firstWhere((i) => i.code == c))
        .toList(),
    postTestItems: (json['post_test_items'] as List<dynamic>)
        .map((c) => TestItem.values.firstWhere((i) => i.code == c))
        .toList(),
    weight: json['weight'] as double,
  );
}