import 'package:flutter/foundation.dart';
import 'word.dart';

/// 学习计划模型
class StudyPlan {
  /// 学习计划的名称
  final String planName;
  /// 单词列表文件路径
  final String wordListFile;
  /// 开始日期
  final DateTime startDate;
  /// 每天最少学习单词数量
  final int minDailyWordCount;
  /// 每天最大学习单词数量
  final int maxDailyWordCount;
  /// 状态文件路径
  final String statusFile;
  /// 日志文件路径
  final String logFile;
  /// 任务文件路径
  final String taskFile;
  /// 已学习天数
  final int daysStudied;
  /// 总单词数
  final int totalWords;

  const StudyPlan({
    required this.planName,
    required this.wordListFile,
    required this.startDate,
    required this.minDailyWordCount,
    required this.maxDailyWordCount,
    required this.statusFile,
    required this.logFile,
    required this.taskFile,
    this.daysStudied = 0,
    this.totalWords = 0,
  });

  StudyPlan copyWith({
    String? planName,
    String? wordListFile,
    DateTime? startDate,
    int? minDailyWordCount,
    int? maxDailyWordCount,
    String? statusFile,
    String? logFile,
    String? taskFile,
    int? daysStudied,
    int? totalWords,
  }) {
    return StudyPlan(
      planName: planName ?? this.planName,
      wordListFile: wordListFile ?? this.wordListFile,
      startDate: startDate ?? this.startDate,
      minDailyWordCount: minDailyWordCount ?? this.minDailyWordCount,
      maxDailyWordCount: maxDailyWordCount ?? this.maxDailyWordCount,
      statusFile: statusFile ?? this.statusFile,
      logFile: logFile ?? this.logFile,
      taskFile: taskFile ?? this.taskFile,
      daysStudied: daysStudied ?? this.daysStudied,
      totalWords: totalWords ?? this.totalWords,
    );
  }

  Map<String, dynamic> toJson() => {
    'plan_name': planName,
    'word_list_file': wordListFile,
    'start_date': startDate.toIso8601String(),
    'min_daily_word_count': minDailyWordCount,
    'max_daily_word_count': maxDailyWordCount,
    'status_file': statusFile,
    'log_file': logFile,
    'task_file': taskFile,
    'days_studied': daysStudied,
    'total_words': totalWords,
  };

  factory StudyPlan.fromJson(Map<String, dynamic> json) => StudyPlan(
    planName: json['plan_name'] as String,
    wordListFile: json['word_list_file'] as String,
    startDate: DateTime.parse(json['start_date'] as String),
    minDailyWordCount: json['min_daily_word_count'] as int,
    maxDailyWordCount: json['max_daily_word_count'] as int,
    statusFile: json['status_file'] as String,
    logFile: json['log_file'] as String,
    taskFile: json['task_file'] as String,
    daysStudied: json['days_studied'] as int,
    totalWords: json['total_words'] as int,
  );
}

/// 学习日志条目
class StudyLogEntry {
  /// 日志ID
  final int logId;
  /// 学习日期
  final DateTime date;
  /// 学习的单词列表
  final List<WordStudyRecord> wordsLearned;

  const StudyLogEntry({
    required this.logId,
    required this.date,
    required this.wordsLearned,
  });

  Map<String, dynamic> toJson() => {
    'log_id': logId,
    'date': date.toIso8601String(),
    'words_learned': wordsLearned.map((w) => w.toJson()).toList(),
  };

  factory StudyLogEntry.fromJson(Map<String, dynamic> json) => StudyLogEntry(
    logId: json['log_id'] as int,
    date: DateTime.parse(json['date'] as String),
    wordsLearned: (json['words_learned'] as List<dynamic>)
        .map((w) => WordStudyRecord.fromJson(w as Map<String, dynamic>))
        .toList(),
  );
}

/// 单词学习记录
class WordStudyRecord {
  /// 单词编号
  final int no;
  /// 单词
  final String word;
  /// 复习次数
  final int reviewCount;
  /// 学习前掌握程度
  final double masteryLevelBefore;
  /// 学习后掌握程度
  final double masteryLevelAfter;

  const WordStudyRecord({
    required this.no,
    required this.word,
    required this.reviewCount,
    required this.masteryLevelBefore,
    required this.masteryLevelAfter,
  });

  Map<String, dynamic> toJson() => {
    'no': no,
    'word': word,
    'review_count': reviewCount,
    'mastery_level_before': masteryLevelBefore,
    'mastery_level_after': masteryLevelAfter,
  };

  factory WordStudyRecord.fromJson(Map<String, dynamic> json) => WordStudyRecord(
    no: json['no'] as int,
    word: json['word'] as String,
    reviewCount: json['review_count'] as int,
    masteryLevelBefore: json['mastery_level_before'] as double,
    masteryLevelAfter: json['mastery_level_after'] as double,
  );
}