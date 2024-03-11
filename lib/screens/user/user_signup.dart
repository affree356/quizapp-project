import 'package:flutter/material.dart';

class SignUpscreen extends StatelessWidget {
   SignUpscreen({super.key});

  final _key =GlobalKey<FormState>();
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

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
                          keyboardType: TextInputType.emailAddress,
                          
                          decoration: InputDecoration(
                             
                              prefixIcon: Icon(Icons.person),
                              hintText: ' Username',
                              
                              hintStyle: TextStyle(color: Colors.grey)),
                         
                        )),
                    SizedBox(
                      height: 10,
                    ),
                     Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          
                          decoration: InputDecoration(
                             
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Email',
                              
                              hintStyle: TextStyle(color: Colors.grey)),
                         
                        )),
                        SizedBox(height: 10,),
                         Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          
                          decoration: InputDecoration(
                             
                              prefixIcon: Icon(Icons.email),
                              hintText: ' Password',
                              
                              hintStyle: TextStyle(color: Colors.grey)),
                         
                        )),
                        SizedBox(height: 10,),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                         
                          obscureText: true,
                          decoration: InputDecoration(
                             
                
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(color: Colors.grey)),
                          
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
}