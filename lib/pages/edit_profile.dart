import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/functions/db_functions.dart';
import 'package:quiz_app/model/user_model.dart';

class Editprofile extends StatefulWidget {
  // final  UserModel usermodel;
  final id;
  const Editprofile({
    super.key,
    required this.id,
  });

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  void initState() {
    getUser();
    super.initState();
  }
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
                              SizedBox(
                                height: 80,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                  controller: username,
                                  decoration: InputDecoration(
                                      hintText: 'Username!',
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                    controller: email,
                                    decoration: InputDecoration(
                                        hintText: 'Email!',
                                        border: OutlineInputBorder())),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                             
                              SizedBox(
                                height: 20,
                              ),
                              Card(
                                elevation: 10,
                                child: Container(
                                  width: 120,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(255, 49, 127, 51)),
                                  child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          updateUser(widget.id);
                                        },
                                        child: Text(
                                                                            'Submit',
                                                                            style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                                                          ),
                                      )),
                                ),
                              )
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

  Future<void> updateUser(int id) async {
    final name = username.text;
    final gmail = email.text;

    if (name.isEmpty&&gmail.isEmpty){
      return;
    }else{

    final data = UserModel(
        username: name,
        gmail: gmail,
        age: '',
        question: '',
        correctAnswerIndex: [],
        wrongAnswerIndex: [],
        score: 0,
        firebaseId: '');
        await editUser(data, id);
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, 
         content: Text(' update successfully')));
    }
  }
}
