import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/model/question_model.dart';

Future addQuiz(QuestionModel data)async{
  await FirebaseFirestore.instance.collection('question_db').add(
    {'question':data.question,
    'options':data.options,
    'correctanswer':data.correctanswerIndex,
    'levels':data.levels,
    'cateory':data.category,
    }
  );
  
}