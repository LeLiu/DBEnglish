# 学习计划设计

## 设计思路

1. **学习计划的核心功能**：软件根据用户选择的单词列表创建学习计划，记录每个单词的学习状态，形成学习进度，并对学习进度进行管理。

2. **文件结构**：一个学习计划由以下五个 JSON 文件组成：
   - `plan.json`：存储学习计划的基本信息，如名称、开始时间、每天学习单词数量等。
   - `words.json`：存储单词列表，每个单词有唯一编号和单词本身。
   - `status.json`：记录每个单词的学习状态，包括学习次数、掌握程度等。
   - `log.json`：记录每次学习的具体情况，包括学习时间、单词信息等。
   - `task.json`：根据学习计划和学习状态动态生成的学习任务。

3. **单词唯一性**：通过为每个单词分配唯一编号，确保单词的唯一性，即使单词内容重复也能区分。

4. **艾宾浩斯记忆法**：学习方法采用艾宾浩斯记忆法，学习日志和学习状态文件的设计需支持该方法的实现。

5. **学习状态管理**：学习状态分为学习次数和掌握程度，掌握程度分为 0.0至1.0，1.0表示完全掌握。

6. **学习日志和状态关联**：学习状态文件中记录每次学习日志的 ID，方便查询；学习日志文件中记录每次学习前后的掌握程度，便于跟踪学习效果。

7. **学习计划进度管理**：`plan.json` 中记录已学习的天数、总单词数以及各状态单词的个数，便于用户了解整体学习进度。

## 学习计划存储格式示例

```json
{
    "plan_name": "人教版新起点 一年级上册",
    "word_list_file": "resource/words/人教版新起点.json",
    "start_date": "2023-10-01",
    "min_daily_word_count": 10,
    "max_daliy_word_count": 15,
    "status_file": "resource/status/人教版新起点_status.json",
    "log_file": "resource/logs/人教版新起点_log.json",
    "task_file": "resource/tasks/人教版新起点_task.json",
    "days_studied": 5,
    "total_words": 100
}
```

### 说明

- plan_name: 学习计划的名称，用于标识不同的学习计划。
- word_list_file: 单词列表文件的路径，包含所有需要学习的单词。
- start_date: 学习计划的开始日期，格式为 YYYY-MM-DD。
- min_daily_word_count: 每天学习的最少单词数量。
- max_daliy_word_count: 每天学习的最大单词数量。
- status_file: 学习状态文件的路径，记录每个单词的学习状态。
- log_file: 学习日志文件的路径，记录每次学习的具体情况。
- task_file: 学习任务文件的路径，根据学习计划和学习状态动态生成。
- days_studied: 已经学习的天数。
- total_words: 单词列表中的总单词数。

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

### 说明

- no: 单词的唯一编号，用于标识不同的单词。
- word: 单词本身。
- review_count: 该单词已经被学习的次数。
- mastery_level: 单词的掌握程度，范围为 0-5，5 表示完全掌握。
- log_ids: 与该单词相关的学习日志的 ID 列表，方便查询。

## 学习日志文件示例

```json
[
    {
        "log_id": 1,
        "date": "2023-10-01",
        "words_learned": [
            {"no": 1, "word": "book", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.3},
            {"no": 2, "word": "ruler", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.3},
            {"no": 3, "word": "pencil", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.3},
            {"no": 4, "word": "schoolbag", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.3},
            {"no": 5, "word": "teacher", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.3},
            {"no": 6, "word": "I", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.3},
            {"no": 7, "word": "have", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.3},
            {"no": 8, "word": "a/an", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.3},
            {"no": 9, "word": "face", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.3},
            {"no": 10, "word": "ear", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.3}
        ]
    },
    {
        "log_id": 2,
        "date": "2023-10-02",
        "words_learned": [
            {"no": 1, "word": "book", "review_count": 2, "mastery_level_before": 0.3, "mastery_level_after": 0.5},
            {"no": 2, "word": "ruler", "review_count": 2, "mastery_level_before": 0.3, "mastery_level_after": 0.5},
            {"no": 3, "word": "pencil", "review_count": 2, "mastery_level_before": 0.3, "mastery_level_after": 0.5},
            {"no": 4, "word": "schoolbag", "review_count": 2, "mastery_level_before": 0.3, "mastery_level_after": 0.5},
            {"no": 5, "word": "teacher", "review_count": 2, "mastery_level_before": 0.3, "mastery_level_after": 0.5},
            {"no": 6, "word": "I", "review_count": 2, "mastery_level_before": 0.3, "mastery_level_after": 0.5},
            {"no": 7, "word": "have", "review_count": 2, "mastery_level_before": 0.3, "mastery_level_after": 0.5},
            {"no": 8, "word": "a/an", "review_count": 2, "mastery_level_before": 0.3, "mastery_level_after": 0.5},
            {"no": 9, "word": "face", "review_count": 2, "mastery_level_before": 0.3, "mastery_level_after": 0.5},
            {"no": 10, "word": "ear", "review_count": 2, "mastery_level_before": 0.3, "mastery_level_after": 0.5},
            {"no": 11, "word": "eye", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.5},
            {"no": 12, "word": "nose", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.5},
            {"no": 13, "word": "mouth", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.5},
            {"no": 14, "word": "this", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.5},
            {"no": 15, "word": "is", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.5},
            {"no": 16, "word": "my", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.5},
            {"no": 17, "word": "dog", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.5},
            {"no": 18, "word": "bird", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.5},
            {"no": 19, "word": "tiger", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.5},
            {"no": 20, "word": "monkey", "review_count": 1, "mastery_level_before": 0, "mastery_level_after": 0.5}
        ]
    }
]
```

### 说明

- log_id: 学习日志的唯一标识符。
- date: 学习日志的日期，格式为 YYYY-MM-DD。
- words_learned: 本次学习的所有单词及其相关信息。
- no: 单词的唯一编号。
- word: 单词本身。
- review_count: 该单词已经被学习的次数。
- mastery_level_before: 学习前的掌握程度。
- mastery_level_after: 学习后的掌握程度。

## 学习任务文件示例

```json
{
    "date": "2023-10-03",
    "tasks": [
        {"no": 1, "word": "book", "review_count": 2, "mastery_level": 0.5},
        {"no": 2, "word": "ruler", "review_count": 2, "mastery_level": 0.5},
        {"no": 3, "word": "pencil", "review_count": 2, "mastery_level": 0.5},
        {"no": 4, "word": "schoolbag", "review_count": 2, "mastery_level": 0.5},
        {"no": 5, "word": "teacher", "review_count": 2, "mastery_level": 0.5},
        {"no": 6, "word": "I", "review_count": 2, "mastery_level": 0.5},
        {"no": 7, "word": "have", "review_count": 2, "mastery_level": 0.5},
        {"no": 8, "word": "a/an", "review_count": 2, "mastery_level": 0.5},
        {"no": 9, "word": "face", "review_count": 2, "mastery_level": 0.5},
        {"no": 10, "word": "ear", "review_count": 2, "mastery_level": 0.5},
        {"no": 11, "word": "eye", "review_count": 1, "mastery_level": 0.5},
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

### 说明

- date: 学习任务的日期，格式为 YYYY-MM-DD。
- tasks: 本次学习任务中的所有单词及其相关信息。
- no: 单词的唯一编号。
- word: 单词本身。
- review_count: 该单词已经被学习的次数。
- mastery_level: 单词的当前掌握程度。
