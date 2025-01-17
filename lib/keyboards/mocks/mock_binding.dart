part of cool_ui;

class MockBinding extends WidgetsFlutterBinding {
  static bool _initFlag = false;

  @override
  void initInstances() {
    // TODO: implement initInstances
    super.initInstances();
    _binaryMessenger = MockBinaryMessenger(super.defaultBinaryMessenger);
    _initFlag = true;
  }

  static WidgetsBinding ensureInitialized() {
    if (!_initFlag) {
      MockBinding();
      _initFlag = true;
    }
    // if (WidgetsBinding.instance == null) MockBinding();
    return WidgetsBinding.instance;
  }

  MockBinaryMessenger? _binaryMessenger;
  @override
  BinaryMessenger get defaultBinaryMessenger {
    return _binaryMessenger != null
        ? _binaryMessenger!
        : super.defaultBinaryMessenger;
  }
}

runMockApp(Widget app) {
  MockBinding.ensureInitialized()
    ..scheduleAttachRootWidget(app)
    ..scheduleWarmUpFrame();
}
