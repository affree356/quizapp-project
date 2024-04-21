
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditProfile> {


  String? selectedImage;
  final picker = ImagePicker();

  
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
      padding: const EdgeInsets.only(top: 40,left: 20,),
      child: IconButton(onPressed: (){
       Navigator.of(context).pop();
      }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,)),
    ),
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
                        width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    160,
                                  ),
                                  topRight: Radius.circular(160))),
                                  child: Column(
                                    children: [
                                     Container(
                                      
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                         color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 5,
                                          spreadRadius: 1)
                                    ]),
                                      
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20,bottom: 20),
                                        child: IconButton(onPressed: (){
                                        pickImage();
                                        }, icon: Icon(Icons.photo_camera,size: 35,)),
                                      ),
                                     ),
                                     SizedBox(
                                      height: 100,
                                     ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: TextFormField(
                                        
                                        decoration: InputDecoration(
                                          hintText: 'username',
                                          border: OutlineInputBorder(
                                            
                                          )
                                        ),
                                      ),
                                      
                                    ),
                                    SizedBox(height: 50,),
                                    Card(
                                      elevation:5,
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 20,top: 10),
                                          child: Text('Submit',style: TextStyle(
                                            color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                      ),
                                    )
                                    ],
                                  ),
                      )
                    )
                  
  ],
),
  ]
          ),
        ),
        )
      ]
       )
    );
  }

  void pickImage()async{
   final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
   setState(() {
     if (returnedImage!=null) {
       selectedImage=returnedImage.path;
     }
   });
  }
}