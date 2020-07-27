import 'package:flutter/material.dart';
import 'package:loginfibasee/Views/login_view.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared
      .init("2be83663-9613-4f29-af20-89f62c68ebef", iOSSettings: null);
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: LoginView(),
    );
  }
}
