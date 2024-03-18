import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class levelPage extends StatelessWidget {
  levelPage({super.key});

  final Levels = ['Easy', 'Medium', 'Hard'];

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
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: Levels.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              width: 3,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 16),
                          child: Text(
                            Levels[index],
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
