import 'package:loginfibasee/Firebase/push_noti.dart';
import 'package:mobx/mobx.dart';

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
}
