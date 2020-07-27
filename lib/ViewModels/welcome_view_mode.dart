import 'package:loginfibasee/Firebase/push_noti.dart';
import 'package:mobx/mobx.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

part 'welcome_view_mode.g.dart';

class WelcomeViewModel = WelcomeViewModelBase with _$WelcomeViewModel;

abstract class WelcomeViewModelBase with Store {
  final PushNotificationService pns = PushNotificationService();

  @observable
  int numm = 1;

  @action
  void increase() {
    numm++;
  }

  void insOneSignal() {
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      // will be called whenever a notification is received
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // will be called whenever a notification is opened/button pressed.
    });
    print("OneSignal Çalıştı");
  }
}
