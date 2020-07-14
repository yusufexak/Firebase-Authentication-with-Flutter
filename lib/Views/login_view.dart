import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loginfibasee/Utils/Constants/app_constants.dart';
import 'package:loginfibasee/Utils/Extension/string_extension.dart';
import 'package:loginfibasee/Views/welcome_view.dart';
import 'package:lottie/lottie.dart';

import 'create_ccount_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email, password;
  bool val = false;
  final _formKey = GlobalKey<FormState>();
  double radius = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [buildLottieAsset(), buildLoginForm()],
      ),
    );
  }

  Widget buildLoginForm() {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
        child: Container(
          color: Colors.black45,
          child: Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 35,
              bottom: 20,
            ),
            child: Form(
              autovalidate: val,
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value.isValidEmail() ? null : "Invalid email",
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.mail_outline),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onChanged: (value) => password = value,
                    validator: (value) =>
                        value.length > 6 ? null : "at least 6 characters",
                    decoration: InputDecoration(
                        labelText: "Password", prefixIcon: Icon(Icons.vpn_key)),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print(email + "   " + password);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeView(),
                          ),
                        );
                      } else {
                        setState(() {
                          val = true;
                        });
                      }
                    },
                    child: Text("Sign in"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountView(),
                        ),
                      );
                    },
                    child: Text("Create Account"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: Colors.cyanAccent.withOpacity(.8),
                        width: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLottieAsset() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: SizedBox(
        height: 250,
        child: Center(
          child: Lottie.asset(AppConstants.lottie_world),
        ),
      ),
    );
  }
}
