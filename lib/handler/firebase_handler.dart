import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/model/news.dart';
import 'package:news/utils/app_functions.dart';

class FirebaseHandler {
  static Future<void> signUp(
      String email, String pass, BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } catch (e) {
      AppFunctions.showSnackbar(e.toString(), context);
    }
  }

  static Future<void> logIn(
      String email, String pass, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } catch (e) {
      AppFunctions.showSnackbar(e.toString(), context);
    }
  }

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> storeData(News liked) async {
    User user = FirebaseAuth.instance.currentUser!;
    DocumentReference favs =
        FirebaseFirestore.instance.collection('favs').doc(user.uid);
    await favs.collection('liked').add(News.toJson(liked));
  }

  static Future<List<News>> getData() async {
    User user = FirebaseAuth.instance.currentUser!;
    CollectionReference favs = FirebaseFirestore.instance.collection('favs');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await favs.doc(user.uid).collection("liked").get();
    List<News> liked = [];
    querySnapshot.docs.forEach((doc) {
      News n = News.fromJson(doc);
      liked.add(n);
    });
    return liked;
  }
}
