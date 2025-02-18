# DBWords Flutter 项目

## 项目结构

```text
src/
├── lib/              # Flutter 主要代码目录
│   ├── models/       # 数据模型
│   ├── screens/      # 页面
│   ├── widgets/      # 可重用组件
│   ├── services/     # 服务层
│   └── utils/        # 工具类
├── assets/           # 静态资源
│   ├── images/       # 图片资源
│   └── fonts/        # 字体资源
├── test/             # 测试文件
└── android/          # Android 平台相关代码
└── ios/              # iOS 平台相关代码
```

## 环境要求

1. Flutter SDK
2. Dart SDK
3. Android Studio / Xcode

## 安装说明

1. 安装 Flutter SDK
   - 访问 [Flutter 官网](https://flutter.dev/docs/get-started/install) 下载并安装 Flutter SDK
   - 将 Flutter 添加到系统环境变量
   - 运行 `flutter doctor` 检查环境配置

2. 安装依赖

   ```bash
   flutter pub get
   ```

3. 运行项目

   ```bash
   flutter run
   ```
