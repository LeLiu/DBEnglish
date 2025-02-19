import 'package:flutter/foundation.dart';

/// 单词的掌握程度
class WordMastery {
  /// 单词的掌握程度，范围为0.0到1.0
  final double level;

  /// 复习次数
  final int reviewCount;

  /// 相关的学习日志ID列表
  final List<int> logIds;

  const WordMastery({
    this.level = 0.0,
    this.reviewCount = 0,
    this.logIds = const [],
  });

  WordMastery copyWith({double? level, int? reviewCount, List<int>? logIds}) {
    return WordMastery(
      level: level ?? this.level,
      reviewCount: reviewCount ?? this.reviewCount,
      logIds: logIds ?? this.logIds,
    );
  }

  Map<String, dynamic> toJson() => {
    'level': level,
    'review_count': reviewCount,
    'log_ids': logIds,
  };

  factory WordMastery.fromJson(Map<String, dynamic> json) => WordMastery(
    level: json['level'] as double,
    reviewCount: json['review_count'] as int,
    logIds: (json['log_ids'] as List<dynamic>).cast<int>(),
  );
}

/// 单词模型
class Word {
  /// 单词的唯一编号
  final int no;

  /// 单词本身
  final String word;

  /// 单词的掌握程度
  final WordMastery mastery;

  const Word({
    required this.no,
    required this.word,
    this.mastery = const WordMastery(),
  });

  Word copyWith({int? no, String? word, WordMastery? mastery}) {
    return Word(
      no: no ?? this.no,
      word: word ?? this.word,
      mastery: mastery ?? this.mastery,
    );
  }

  Map<String, dynamic> toJson() => {
    'no': no,
    'word': word,
    'mastery': mastery.toJson(),
  };

  factory Word.fromJson(Map<String, dynamic> json) => Word(
    no: json['no'] as int,
    word: json['word'] as String,
    mastery: WordMastery.fromJson(json['mastery'] as Map<String, dynamic>),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Word && runtimeType == other.runtimeType && no == other.no;

  @override
  int get hashCode => no.hashCode;
}
