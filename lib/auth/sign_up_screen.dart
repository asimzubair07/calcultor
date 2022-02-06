import 'package:calculator/auth/authservice.dart';
import 'package:calculator/main.dart';
import 'package:calculator/widgets/auth_text_filed.dart';
import 'package:calculator/widgets/primary_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    passwordFocusNode.addListener(_onOnFocusNodeEvent);
    usernameFocusNode.addListener(_onOnFocusNodeEvent);
    super.initState();
  }

  _onOnFocusNodeEvent() {
    setState(() {});
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ValueNotifier province = ValueNotifier(null);
  ValueNotifier rememberPassword = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    // AuthService _authService = AuthService(_firebaseAuth);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            AuthTextFiled(
              controller: userNameController,
              focusNode: usernameFocusNode,
              heading: "Username",
              hintText: "Enter Username",
              validation: (String value) {
                if (value.toString().isEmpty) {
                  return "please_fill_it";
                }
              },
              suffixIcon: const Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              keybardType: TextInputType.emailAddress,
              onChanged: (String v) {},
              onTap: () {},
              headingColor: Colors.deepPurple,
            ),
            const SizedBox(height: 20),
            AuthTextFiled(
              controller: passwordController,
              focusNode: passwordFocusNode,
              heading: "Password",
              hintText: "Enter Password",
              hideText: true,
              validation: (value) {
                if (value.isEmpty) {
                  return "please_fill_it";
                }
              },
              suffixIcon: const Icon(
                Icons.lock,
                color: Colors.deepPurple,
              ),
              keybardType: TextInputType.emailAddress,
              onChanged: (v) {},
              onTap: () {},
              headingColor: Colors.red,
            ),
            const SizedBox(
              height: 50,
            ),
            PrimaryButton(
              height: 48,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CalcApp()));
                /*      _authService
                    .signUp(userNameController.text, passwordController.text)
                    .then((value) {
                  if (value == "Signed In") {
                 
                  } else {
                    print("Something went wrong");
                  }
                }); */

                // Routes.routeReplace(TabsScreen(), context);
                //Routes.route(CustomTabbar(), context);
              },
              text: "Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}
