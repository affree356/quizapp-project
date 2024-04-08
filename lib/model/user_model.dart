import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String? firebaseId;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String gmail;
  @HiveField(3)
  final String age;
  @HiveField(4)
  final String question;
  @HiveField(5)
  final List<String> correctAnswerIndex;
  @HiveField(6)
  final List<String> wrongAnswerIndex;
  @HiveField(7)
  final int score;
  @HiveField(8)
  int? id;

  UserModel({required this.username, required this.gmail, required this.age, required this.question, required this.correctAnswerIndex, required this.wrongAnswerIndex, required this.score,required this.firebaseId});

 

  

 
}
