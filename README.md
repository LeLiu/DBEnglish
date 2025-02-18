# DBWords（大宝背单词）

一个基于安宾浩斯记忆法的小学生英语单词学习工具。

## 项目简介

DBWords（大宝背单词）是一款专为小学生设计的英语单词学习软件。它采用安宾浩斯记忆法，通过智能学习计划和AI动态生成的学习任务，帮助学生高效地掌握英语单词。

## 主要功能

- **智能词表管理**
  - 默认集成人教版新起点一至六年级所有单词
  - 支持自定义添加词表（本地导入/网络导入）

- **个性化学习计划**
  - 基于安宾浩斯记忆法制定学习计划
  - 支持自定义学习计划编辑
  - 根据学习结果动态调整单词掌握度

- **AI辅助学习**
  - 通过AI大模型动态生成学习和测试内容
  - 智能调整学习难度和复习频率

## 项目结构

```text
├── doc/                # 项目文档
│   └── design/         # 设计文档
├── resource/           # 资源文件
│   └── words/          # 词表资源
├── scripts/            # 工具脚本
└── src/                # 源代码
    └── lib/            # Flutter主要代码
        ├── models/     # 数据模型
        ├── screens/    # 页面
        ├── widgets/    # 组件
        ├── services/   # 服务
        └── utils/      # 工具类
```

## 技术栈

- 前端框架：Flutter
- 编程语言：Dart
- 开发环境：
  - Flutter SDK
  - Android Studio / Xcode

## 快速开始

1. 安装Flutter SDK
   - 访问[Flutter官网](https://flutter.dev/docs/get-started/install)下载安装
   - 配置环境变量
   - 运行`flutter doctor`检查配置

2. 安装项目依赖
 
   ```bash
   flutter pub get
   ```

3. 运行项目

   ```bash
   flutter run
   ```

## 文档

- [设计文档](doc/design/design.md)
- [学习计划设计](doc/design/plan.md)
- [单词掌握度设计](doc/design/mastery.md)
- [学习任务设计](doc/design/task.md)

## 词表资源

- [人教版新起点词表示例](resource/words/人教版新起点.json)