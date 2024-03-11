import 'package:flutter/material.dart';
import 'package:quiz_app/screens/user/user_signup.dart';

class userLogin extends StatefulWidget {
  const userLogin({super.key});

  @override
  State<userLogin> createState() => _userLoginState();
}

class _userLoginState extends State<userLogin> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 22),
            child: Text(
              'Hello\nSign in!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                         
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Enter Your Email',
                          
                          hintStyle: TextStyle(color: Colors.grey)),
                     validator: (value) {
                      if(value!.isEmpty){
                        return 'please enter your email';
                      }else{
                        return null;
                      }
                     },
                    )),
                    
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: _passController,
                     obscureText: true,
                      decoration: InputDecoration(
                         
            
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Enter Your Password',
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'please enter your password';
                        }else{
                          return null;
                        }
                      },
                    )),
                SizedBox(
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
                SizedBox(height: 20,),
                Text("Don't have an account?",style: TextStyle(fontSize: 18,),),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SignUpscreen()));
                  },
                  child: Text('Sign up',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blue),))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}