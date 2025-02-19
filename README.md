# DBWords 单词学习软件

一个基于英语教材词汇的智能单词学习软件。

## 软件简介

DBWords 单词学习软件是一个基于智能算法的单词学习工具。结合使用英语教材词汇，智能制定单词计划和AI辅助的单词记忆，帮助智能化学习单词。

## 主要功能

- **制定学习计划**
  - 根据人教版新起点教材词汇量制定学习计划
  - 智能规划每日学习词汇量，支持自定义学习计划

- **智能单词计划**
  - 基于英语教材词汇制定单词计划
  - 智能规划单词计划表
  - 生成单词学习路径和单词学习曲线图

- **AI辅助单词**
  - 使用AI技术辅助记忆单词和释义
  - 制定适合单词难度和学习能力

## 软件结构

```text
%%% doc/                                 # 软件文档
     %%% design/                   # 设计文档
%%% resource/                       # 资源文件
     %%% words/                     # 词汇资源
%%% scripts/                         # 脚本工具
%%% src/                                 # 源代码
        %%% lib/                         # Flutter主要代码
                %%% models/           # 数据模型
                %%% screens/         # 界面
                %%% widgets/         # 组件
                %%% services/       # 服务
                %%% utils/             # 脚本库
```

## 技术栈

- 主要框架：Flutter
- 主要语言：Dart
- 开发环境：
    - Flutter SDK
    - Android Studio / Xcode

## 开始使用

1. 安装Flutter SDK
       - 访问 Flutter官网 (https://flutter.dev/docs/get-started/install)进行安装
       - 配置开发环境
       - 运行`flutter doctor`检查环境

2. 安装软件依赖
   
       ```bash
       flutter pub get
       ```

3. 运行软件

       ```bash
       flutter run
       ```

## 文档

- [设计文档](doc/design/design.md)
- [单词计划设计](doc/design/plan.md)
- [学习曲线图设计](doc/design/mastery.md)
- [单词记忆设计](doc/design/task.md)

## 词汇资源

- [人教版新起点词汇表](resource/words/人教版新起点.json)