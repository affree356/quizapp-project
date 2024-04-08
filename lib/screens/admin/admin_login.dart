import 'package:flutter/material.dart';
import 'package:quiz_app/screens/admin/admin_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

class adminLoginScreen extends StatefulWidget {
  const adminLoginScreen({super.key});

  @override
  State<adminLoginScreen> createState() => _adminLoginScreenState();
}

class _adminLoginScreenState extends State<adminLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final email = 'binthassan356@gmail.com';
  final pass = 'affree356';
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffB81736),
              Color(0xff281537),
            ]),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 180),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 150,
                ),
                child: IconButton(
                    iconSize: 40,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.navigate_before)),
              ),
              const Text(
                'Hello\nSign in!',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Enter Your Email',
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter email';
                          } else if (value != email) {
                            return 'incorrect emil';
                          } else {
                            return null;
                          }
                        },
                      )),
                const  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: passController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: _obscureText
                                    ? const Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            prefixIcon: Icon(Icons.lock),
                            hintText: 'Enter Your Password',
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your password';
                          } else if (passController.text.length < 8) {
                            return 'Password should be atleast 8 charecters';
                          } else if (value != pass) {
                            return 'incorrect password';
                          } else {
                            return null;
                          }
                        },
                      )),
                const  SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                        gradient: const LinearGradient(
                            colors: [Color(0xffB81736), Color(0xff281537)])),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        }
                      },
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  void checkLogin(BuildContext ctx) async {
    final username = emailController.text;
    final password = passController.text;
    if (username == email && password == pass) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setString('login_status', 'admin');
      Navigator.of(context)
          .pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1) => AdminPage()), (route) => false);
    }
  }
}
