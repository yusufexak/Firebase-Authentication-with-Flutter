import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loginfibasee/Firebase/user_firebase.dart';
import 'package:loginfibasee/Utils/Constants/app_constants.dart';
import 'package:loginfibasee/Utils/Extension/string_extension.dart';
import 'package:lottie/lottie.dart';
import 'login_view.dart';

class CreateAccountView extends StatefulWidget {
  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
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
                    "Create Account",
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
                        UserFirebase()..createAccountFirebase(email, password);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => LoginView()),
                            (Route<dynamic> route) => false);
                      } else {
                        setState(() {
                          val = true;
                        });
                      }
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
