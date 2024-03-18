import 'package:flutter/material.dart';
import 'package:quiz_app/screens/admin/admin_login.dart';
import 'package:quiz_app/screens/user/user_login.dart';

class infoScreen extends StatelessWidget {
  const infoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffB81736),
              Color(0xff281537),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Union-removebg-preview.png'),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(colors: [
                    Color(0xffB81736),
                    Color(0xff281537),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => adminLoginScreen()));
                },
                child: const Text(
                  'Admin',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                      colors: [Color(0xffB81736), Color(0xff281537)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => userLogin()));
                },
                child: Text(
                  'User',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
