import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/model/question_model.dart';

Future addQuiz(QuestionModel data) async {
  await FirebaseFirestore.instance.collection('question_db').add({
    'question': data.question,
    'options': data.options,
    'correctanswer': data.correctanswerIndex,
    'levels': data.levels,
    'category': data.category,
  });
  
}

Future updateQuiz(QuestionModel data, String id) async {
  await FirebaseFirestore.instance.collection('question_db').doc(id).update({
    'question': data.question,
    'options': data.options,
    'correctanswer': data.correctanswerIndex,
    'levels': data.levels,
    'category': data.category
  });
}
Future<void> deleteQuiz(String id)async{
 await FirebaseFirestore.instance.collection('category_db').doc(id).delete();
}

Future <bool> checkQuestion(String id)async{
  final data =  await FirebaseFirestore.instance.collection('question_db').where('category',isEqualTo: id).get();
    if(data.docs.isEmpty){
      return true;
    }else{
      return false;
    }
}
