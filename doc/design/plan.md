# 学习计划设计

## 学习计划存储格式示例

```json
{
    "plan_name": "人教版新起点 一年级上册",
    "word_list_file": "resource/words/人教版新起点.json",
    "start_date": "2023-10-01",
    "daily_word_count": 10,
    "status_file": "resource/status/人教版新起点_status.json",
    "log_file": "resource/logs/人教版新起点_log.json",
    "task_file": "resource/tasks/人教版新起点_task.json"
}
```

## 学习状态文件示例

```json
[
    {"no": 1, "word": "book", "review_count": 2, "mastery_level": 5, "log_ids": [1, 2]},
    {"no": 2, "word": "ruler", "review_count": 2, "mastery_level": 5, "log_ids": [1, 2]},
    {"no": 3, "word": "pencil", "review_count": 2, "mastery_level": 5, "log_ids": [1, 2]},
    {"no": 4, "word": "schoolbag", "review_count": 2, "mastery_level": 5, "log_ids": [1, 2]},
    {"no": 5, "word": "teacher", "review_count": 2, "mastery_level": 5, "log_ids": [1, 2]},
    {"no": 6, "word": "I", "review_count": 2, "mastery_level": 5, "log_ids": [1, 2]},
    {"no": 7, "word": "have", "review_count": 2, "mastery_level": 5, "log_ids": [1, 2]},
    {"no": 8, "word": "a/an", "review_count": 2, "mastery_level": 5, "log_ids": [1, 2]},
    {"no": 9, "word": "face", "review_count": 2, "mastery_level": 5, "log_ids": [1, 2]},
    {"no": 10, "word": "ear", "review_count": 2, "mastery_level": 5, "log_ids": [1, 2]}
]
```

## 学习日志文件示例

```json
[
    {
        "log_id": 1,
        "date": "2023-10-01",
        "words_learned": [
            {"no": 1, "word": "book", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 2, "word": "ruler", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 3, "word": "pencil", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 4, "word": "schoolbag", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 5, "word": "teacher", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 6, "word": "I", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 7, "word": "have", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 8, "word": "a/an", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 9, "word": "face", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 10, "word": "ear", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3}
        ]
    },
    {
        "log_id": 2,
        "date": "2023-10-02",
        "words_learned": [
            {"no": 1, "word": "book", "review_count": 2, "mastery_level_before": 3, "mastery_level_after": 5},
            {"no": 2, "word": "ruler", "review_count": 2, "mastery_level_before": 3, "mastery_level_after": 5},
            {"no": 3, "word": "pencil", "review_count": 2, "mastery_level_before": 3, "mastery_level_after": 5},
            {"no": 4, "word": "schoolbag", "review_count": 2, "mastery_level_before": 3, "mastery_level_after": 5},
            {"no": 5, "word": "teacher", "review_count": 2, "mastery_level_before": 3, "mastery_level_after": 5},
            {"no": 6, "word": "I", "review_count": 2, "mastery_level_before": 3, "mastery_level_after": 5},
            {"no": 7, "word": "have", "review_count": 2, "mastery_level_before": 3, "mastery_level_after": 5},
            {"no": 8, "word": "a/an", "review_count": 2, "mastery_level_before": 3, "mastery_level_after": 5},
            {"no": 9, "word": "face", "review_count": 2, "mastery_level_before": 3, "mastery_level_after": 5},
            {"no": 10, "word": "ear", "review_count": 2, "mastery_level_before": 3, "mastery_level_after": 5},
            {"no": 11, "word": "eye", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 12, "word": "nose", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 13, "word": "mouth", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 14, "word": "this", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 15, "word": "is", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 16, "word": "my", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 17, "word": "dog", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 18, "word": "bird", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 19, "word": "tiger", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3},
            {"no": 20, "word": "monkey", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 3}
        ]
    }
]
```

## 学习任务文件示例

```json
{
    "date": "2023-10-03",
    "tasks": [
        {"no": 1, "word": "book", "review_count": 2, "mastery_level": 5},
        {"no": 2, "word": "ruler", "review_count": 2, "mastery_level": 5},
        {"no": 3, "word": "pencil", "review_count": 2, "mastery_level": 5},
        {"no": 4, "word": "schoolbag", "review_count": 2, "mastery_level": 5},
        {"no": 5, "word": "teacher", "review_count": 2, "mastery_level": 5},
        {"no": 6, "word": "I", "review_count": 2, "mastery_level": 5},
        {"no": 7, "word": "have", "review_count": 2, "mastery_level": 5},
        {"no": 8, "word": "a/an", "review_count": 2, "mastery_level": 5},
        {"no": 9, "word": "face", "review_count": 2, "mastery_level": 5},
        {"no": 10, "word": "ear", "review_count": 2, "mastery_level": 5},
        {"no": 11, "word": "eye", "review_count": 1, "mastery_level": 0},
        {"no": 12, "word": "nose", "review_count": 1, "mastery_level": 0},
        {"no": 13, "word": "mouth", "review_count": 1, "mastery_level": 0},
        {"no": 14, "word": "this", "review_count": 1, "mastery_level": 0},
        {"no": 15, "word": "is", "review_count": 1, "mastery_level": 0},
        {"no": 16, "word": "my", "review_count": 1, "mastery_level": 0},
        {"no": 17, "word": "dog", "review_count": 1, "mastery_level": 0},
        {"no": 18, "word": "bird", "review_count": 1, "mastery_level": 0},
        {"no": 19, "word": "tiger", "review_count": 1, "mastery_level": 0},
        {"no": 20, "word": "monkey", "review_count": 1, "mastery_level": 0}
    ]
}
```
