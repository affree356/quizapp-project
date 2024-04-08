import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/functions/db_functions.dart';

import 'package:quiz_app/pages/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  //  final UserModel userModel;
final String id ;
  const ProfilePage({super.key,required this.id,});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  
  

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffB81736),
              Color(0xff281537),
            ]),
          ),
          child: Container(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 120, top: 130),
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 201, 196, 196),
                        borderRadius: BorderRadius.circular(100)),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Image(
                          image: AssetImage(
                              'assets/user-removebg-preview 1 (1).png')),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 250),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    160,
                                  ),
                                  topRight: Radius.circular(160))),
                          child: Column(
                            //  mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 5,
                                          spreadRadius: 1)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 50,
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    Editprofile(id: widget.id,)));
                                      },
                                      icon: Icon(Icons.edit)),
                                ),
                              ),
                              SizedBox(
                                height: 80,
                              ),
                             
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: '${userData?.username}',
                                        border: OutlineInputBorder())),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: '${userData?.gmail}',
                                        border: OutlineInputBorder())),
                              ),
                              // SizedBox(height: 10,),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(horizontal: 20),
                              //   child: TextFormField(decoration: InputDecoration(
                              //       hintText: 'About us',
                              //       border: OutlineInputBorder(

                              //       ))),
                              // ),
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
