import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/category.dart';
import 'package:quiz_app/pages/levels.dart';
import 'package:quiz_app/screens/info.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 500),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => infoScreen()));
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        size: 50,
                      )),
                ],
              ),
            ),
          ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 30),
                  child: Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu,
                            size: 50,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 10),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(40)),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                  size: 60,
                                )),
                          )
                        ],
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Let's Play Quiz",
                    style: TextStyle(fontSize: 30, color: Colors.amber),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: TabBar(
                    tabs: [
                      Tab(
                        child: Text(
                          'Levels',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        child: Text('Category',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ),
                    ],
                    labelColor:
                        Colors.white, // Set the color of the selected tab label
                    unselectedLabelColor:
                        Colors.grey, // Set the color of unselected tab labels
                    indicatorColor: Colors.grey,
                  ),
                ),
                Expanded(
                    child: TabBarView(children: [levelPage(), userCategory()]))
              ],
            ),
          )),
    );
  }
}
