import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndCondpage extends StatelessWidget {
  const TermsAndCondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(30), child: Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Terms and Conditions',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
      ))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Divider(),

         Text('Welcome to Quizland!',style: TextStyle(fontSize: 20,),),
         SizedBox(height: 30,),
         Text('These Terms and Conditions govern your use of Quizland.'),
         SizedBox(height: 10,),
         Text('   .Users must be of a certain age or have parental consent to \n    use the application'),
         Text('.Users may be required to register an account to use the \n application, and they agree to provide accurate and \n complete information.'),
         Text(".The application's content, including questions, answers, \n and any other materials, are protected by copyright or \n other intellectual property rights, and users agree not to \n use them in unauthorized ways"),
         Text(' .The developers reserve the right to modify the terms and \n  conditions at any time, with or without notice to users.'),
         SizedBox(height: 20,),
         Padding(
           padding: const EdgeInsets.only(right: 170),
           child: Text('Prohibited Activities',style: TextStyle(fontSize: 20),),
         ),
         SizedBox(height: 10,),
         Text('Users agree not to engage in certain activities, such as\nhacking, distributing spam, or violating the rights of\nothers.')
        ],
      ),
    );
  }
}