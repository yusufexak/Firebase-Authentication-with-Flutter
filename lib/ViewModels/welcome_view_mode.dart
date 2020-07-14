import 'dart:async';

import 'package:mobx/mobx.dart';

part 'welcome_view_mode.g.dart';

class WelcomeViewModel = WelcomeViewModelBase with _$WelcomeViewModel;

abstract class WelcomeViewModelBase with Store {
  @observable
  int numm = 1;

  @action
  void increase() {
    numm++;
  }
}
