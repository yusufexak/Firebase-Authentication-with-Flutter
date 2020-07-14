import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loginfibasee/ViewModels/welcome_view_mode.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final vm = WelcomeViewModel();
  @override
  Widget build(BuildContext context) {
    print(vm.toString());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => vm.increase(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Observer(
              builder: (context) => Text(
                vm.numm.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
