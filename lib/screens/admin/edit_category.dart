import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class categoryEdit extends StatefulWidget {
  final String id;
  const categoryEdit({super.key, required this.id});

  @override
  State<categoryEdit> createState() => _categoryEditState();
}

class _categoryEditState extends State<categoryEdit> {
  TextEditingController categoryName = TextEditingController();
  String category = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('quiz')
              .doc(widget.id)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CupertinoActivityIndicator();
            } else {
              category = snapshot.data!['category'];
              categoryName.text = category;
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'Update Category',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: TextField(
                    controller: categoryName,
                    decoration:
                        InputDecoration(hintText: '  Enter a category name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 280, top: 30),
                  child: Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: () {
                          updateCategory(widget.id, categoryName.text);
                        },
                        child: Text(
                          'update ',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                )
              ],
            );
          }),
    );
  }

  void updateCategory(String categoryId, String newCategoryName) async {
    await FirebaseFirestore.instance
        .collection('quiz')
        .doc(widget.id)
        .update({'category': newCategoryName});
  }
}
