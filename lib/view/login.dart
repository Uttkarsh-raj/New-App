import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/const/color.dart';
import 'package:news/handler/firebase_handler.dart';
import 'package:news/utils/widgets/outlined_container.dart';
import 'package:news/utils/widgets/textfield_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool login = true;
  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.24,
                  width: double.infinity,
                  child: Center(
                    child: Image.asset(
                      "assets/images/news.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.06),
                const Text(
                  "Welcome to the News app ! \n Let's get you updated.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          login = !login;
                        });
                      },
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: (login) ? Colors.cyan : AppColors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          login = !login;
                        });
                      },
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: (!login) ? Colors.cyan : AppColors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                CustomTextFieldContiner(
                  hintText: "Email",
                  controller: email,
                ),
                SizedBox(height: size.height * 0.03),
                CustomTextFieldContiner(
                  hintText: "Password",
                  controller: pass,
                ),
                SizedBox(height: size.height * 0.05),
                GestureDetector(
                  onTap: () {
                    if (login) {
                      FirebaseHandler.logIn(email.text.trim().toString(),
                          pass.text.trim().toString(), context);
                    } else {
                      FirebaseHandler.signUp(email.text.trim().toString(),
                          pass.text.trim().toString(), context);
                    }
                  },
                  child: SizedBox(
                    width: size.width * 0.8,
                    child: CustomOutlinedContainer(
                      padding: const EdgeInsets.all(14),
                      label: (login) ? "LogIn" : "Sign Up",
                      fontsize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
