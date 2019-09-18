import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Volunteer {
  final String name;
  final String uid;
  final String phoneNumber;
  final int age;
  final List<String> skills;
  final int avaliableHours;
  final String imageUrl;

  const Volunteer({
    @required this.uid,
    @required this.name,
    @required this.age,
    @required this.imageUrl,
    @required this.phoneNumber,
    @required this.avaliableHours,
    this.skills,
  });

  Volunteer.fromJson(dynamic json)
      : uid = json["uid"],
        name = json["name"],
        age = json["age"],
        imageUrl = json["imageUrl"],
        phoneNumber = json["phoneNumber"],
        avaliableHours = json["availableHours"],
        skills = json["skills"];

  static Future<Volunteer> of(String uid) async {
    var doc =
        await Firestore.instance.collection("volunteers").document(uid).get();
    if (uid != doc["uid"]) {
      throw Exception("Volunteer $uid not found.");
    }

    return Volunteer.fromJson(doc);
  }
}
