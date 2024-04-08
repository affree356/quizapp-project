import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/model/user_model.dart';

UserModel? userData;

Future<void> addUser(UserModel value) async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  int userId = await userDB.add(value);
  value.id = userId;
  await userDB.put(userId, value);
}

Future<void> AddScore(UserModel value)async{
   final userScore = await Hive.openBox<UserModel>('user_db');
   userScore.add(value);
}

Future getUser() async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  await Future.forEach(userDB.values, (element) {
    if (element.firebaseId == FirebaseAuth.instance.currentUser!.uid) {
      log(element.username);
      userData = element;
    }
  });
}

Future editUser(UserModel value, int id) async {
  final userDB = await Hive.openBox('user_db');
  await Future.forEach(userDB.values, (element) async {
    if (element.firebaseId == value.id) {
      userData = element;
    }

    UserModel temp = UserModel(
        username: value.username,
        gmail: value.gmail,
        age: '',
        question: '',
        correctAnswerIndex: [],
        wrongAnswerIndex: [],
        score: 0,
        firebaseId: '');
    await userDB.put(id, temp);
    await getUser();
  });
}
