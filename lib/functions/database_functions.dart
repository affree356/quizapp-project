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

Future getQuestionsByCategory(String category) async {
  final QuerySnapshot = await FirebaseFirestore.instance
      .collection('question_db')
      .where('category', isEqualTo: category)
      .get();
  return QuerySnapshot.docs;
}
