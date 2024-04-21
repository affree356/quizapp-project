
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/functions/db_functions.dart';
import 'package:quiz_app/model/sharedclass.dart';
import 'package:quiz_app/pages/edit_profile.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/screens/constan.dart';


class ProfilePage extends StatefulWidget {



    // final UserModel userModel;
final String id ;
  const ProfilePage({super.key,required this.id});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  
  

  @override
  void initState() {
    getUser();
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
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomePage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40,left: 20,
                    ),
                    child: Icon(Icons.navigate_before,size: 40,color: Colors.white,),
                  )),
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
                                                    EditProfile()));
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
                                child: Container(
                                  height: 60,
                                  width: double.infinity,

                                 
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)
                                  ),
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance.collection('users').where('mail',isEqualTo:SharedPref().sharedInstanceUSer ).snapshots(),
                                    builder: (context, snapshot) {
                                     if(!snapshot.hasData){
                                      return CircularProgressIndicator();
                                     }else{
                                      return Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(snapshot.data?.docs[0][FbScoreConst.username]),
                                      );
                                     
                                    }
                                    }
                                  ),
                                )
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        // hintText: '${userData?.gmail}',
                                        // hintText: SharedPref().sharedisntancefucniton();
                                        hintText: SharedPref().sharedInstanceUSer,
                                        border: OutlineInputBorder())),
                              ),
                             
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
