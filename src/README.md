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
4. Visual Studio Code

## 开发环境配置

### 1. 安装 Flutter SDK

1. 访问 [Flutter 官网](https://flutter.dev/docs/get-started/install) 下载 Flutter SDK
2. 解压下载的文件到指定目录（如 `C:\src\flutter`）
3. 将 Flutter SDK 的 bin 目录添加到系统环境变量：
   - 打开系统环境变量设置
   - 在 `Path` 变量中添加 Flutter SDK 的 bin 目录路径（如 `C:\src\flutter\bin`）
4. 打开命令行，运行 `flutter doctor` 检查环境配置

### 2. 配置 VSCode

1. 安装 VSCode
   - 从 [VSCode 官网](https://code.visualstudio.com/) 下载并安装

2. 安装必要的 VSCode 插件：
   - Flutter 插件
   - Dart 插件
   - Flutter Widget Snippets（推荐）
   - Flutter Color（推荐）

3. VSCode Flutter 配置：
   - 打开命令面板（Ctrl+Shift+P）
   - 输入 `Flutter: New Project`
   - 选择项目位置并创建

4. 调试配置：
   - 在 VSCode 中打开项目
   - 点击左侧的调试图标或按 F5
   - 选择调试设备（模拟器或真机）

### 3. 安装依赖

在项目根目录下运行：

```bash
flutter pub get
```

### 4. 运行项目

在 VSCode 中：

1. 确保设备已连接（模拟器或真机）
2. 按 F5 启动调试
3. 或在终端中运行

```bash
flutter run
```

## 常见问题解决

1. Flutter SDK 未找到
   - 检查环境变量是否正确配置
   - 运行 `flutter doctor` 检查具体问题

2. VSCode 插件无法安装
   - 检查网络连接
   - 尝试使用 VSCode 的离线安装方式

3. 模拟器无法启动
   - 确保已安装 Android Studio 或 Xcode
   - 检查 BIOS 中是否启用虚拟化
