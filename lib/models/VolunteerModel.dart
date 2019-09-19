import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Volunteer {
  final String name;
  final String uid;
  final String phoneNumber;
  final int age;
  final List<String> skills;
  final int availableHours;
  final String imageUrl;

  Volunteer(
      {@required this.uid,
      @required this.name,
      @required this.age,
      @required this.imageUrl,
      @required this.phoneNumber,
      @required this.availableHours,
      @required this.skills,
      submitToFirebase = false}) {
    if (submitToFirebase) {
      Firestore.instance.collection("volunteers").document(uid).setData({
        "uid": uid,
        "name": name,
        "age": age,
        "imageUrl": imageUrl,
        "phoneNumber": phoneNumber,
        "availableHours": availableHours,
        "skills": skills,
      });
    }
  }

  Volunteer.fromJson(dynamic json)
      : uid = json["uid"],
        name = json["name"],
        age = json["age"],
        imageUrl = json["imageUrl"],
        phoneNumber = json["phoneNumber"],
        availableHours = json["availableHours"],
        skills = json["skills"];

  static Future<Volunteer> ofUser(Future<FirebaseUser> user) async {
    var uid = (await user).uid;
    print(uid);
    var vol = await Volunteer.of(uid);
    print(vol);
    return vol;
  }

  static Future<Volunteer> of(String uid) async {
    var doc =
        await Firestore.instance.collection("volunteers").document(uid).get();
    if (uid != doc["uid"]) {
      throw Exception("Volunteer $uid not found.");
    }

    return Volunteer.fromJson(doc);
  }
}
