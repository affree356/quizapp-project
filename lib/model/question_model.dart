class QuestionModel{
  final String? id;
  final String question;
  final List<String> options;
  final int correctanswerIndex;
  final String category;
  final String levels;

  QuestionModel({
    this.id,
    required this.question,
   required this.options, 
   required this.correctanswerIndex, 
   required this.category, 
   required this.levels
   });
}