import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/user_auth/firebase_auth.dart';

class SignUpscreen extends StatefulWidget {
   SignUpscreen({super.key});

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignUpscreen> {
  final _key =GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final TextEditingController confirmController = TextEditingController();

   bool _obscuretext = true;
   bool _ispassword =true;
  
    final FirebaseAuthService _auth =FirebaseAuthService();
   @override
  void dispose() {
   usernameController.dispose();
   emailController.dispose();
   passController.dispose();
   confirmController.dispose();
       super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
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
              'Create your\nAccount !',
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
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: usernameController,
                          decoration: InputDecoration(
                             
                              prefixIcon: Icon(Icons.person),
                              hintText: ' Username',
                              
                              hintStyle: TextStyle(color: Colors.grey)),
                         validator: (value) {
                           if(value!.isEmpty){
                            return 'please enter username';
                           }
                         },
                        )),
                    SizedBox(
                      height: 10,
                    ),
                     Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                             
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Email',
                              
                              hintStyle: TextStyle(color: Colors.grey)),
                         validator: (value) {
                           if(value!.isEmpty){
                            return 'Enter a valid email';
                           }
                         },
                        )),
                        SizedBox(height: 10,),
                         Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: passController,
                          obscureText: _obscuretext,
                          decoration: InputDecoration(
                             suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscuretext=!_obscuretext;
                                });
                                
                              },
                              child:_obscuretext? Icon(Icons.visibility_off):
                              Icon(Icons.visibility)
                              ),
                              prefixIcon: Icon(Icons.lock),
                              hintText: ' create a Password',
                              
                              hintStyle: TextStyle(color: Colors.grey)),
                         validator: (value) {
                           if(value!.isEmpty){
                            return 'please create a password';
                           }else if(passController.text.length<8){
                            return 'password should be atleast 8 charecters';
                           }else if(value=='12345678'){
                            return 'please enter strong password';
                           }else{
                            return null;
                           }
                         },
                        )),
                        SizedBox(height: 10,),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                         controller: confirmController,
                          obscureText: _ispassword,
                          decoration: InputDecoration(
                             suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _ispassword=!_ispassword;
                                });
                              },
                              child:_ispassword? Icon(Icons.visibility_off):
                              Icon(Icons.visibility)
                              ),
                
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(color: Colors.grey)),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please confirm your pssword';
                            }else if(passController.text!=confirmController.text){
                              return 'please check your password';
                            }else{
                              return null;
                            }
                          },
                        )),
                        
                    SizedBox(
                      height: 100,
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
                         signUp();
                        },
                        child: const Text(
                          'SIGN UP',
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
                    SizedBox(height: 90,),
                    Text("Already have an account?",style: TextStyle(fontSize: 16,),),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SignUpscreen()));
                      },
                      child: Text('Sign in',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blue),))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    )); 
    
  }

  void signUp()async{
    String username = usernameController.text;
    String email = emailController.text;
    String pass = passController.text;
    String confirmpass = confirmController.text;
     
     
    User? user =await _auth.signUpWithEmailandPass(email, pass);

    if(user!=null){
      print('user is successfully created');
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>homePage()));
    }else{
    print('some error occured');
    }
  }
}