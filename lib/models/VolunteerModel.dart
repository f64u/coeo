import 'package:flutter/material.dart';

class Volunteer {
  final String name;
  final String id;
  final String phoneNumber;
  final int age;
  final String type;
  final List<String> skills;
  final int avaliableHours;
  final String imageUrl;
  static const String medical = "Medical";
  static const String educational = "Educational";
  static const String regular = "Regular";

  static const List<Volunteer> _volunteerList = const [
    Volunteer(
        name: "Sara Shaker",
        age: 26,
        imageUrl:
            'https://thumbs.dreamstime.com/z/studio-portrait-woman-wearing-volunteer-t-shirt-looking-camera-44158547.jpg',
        phoneNumber: '+201*********',
        avaliableHours: 10,
        skills: [],
        type: Volunteer.educational),
    Volunteer(
        name: "Abdullah Gamal",
        age: 35,
        imageUrl:
            'https://www.vsointernational.org/sites/default/files/styles/wysiwyg_default/public/ICS%20volunteer%20Ibraham%20Kamara%20Sierra%20Leone%20ebola.jpg?itok=JdTU_3c4',
        phoneNumber: '+201*********',
        avaliableHours: 5,
        skills: [],
        type: Volunteer.medical),
    Volunteer(
        name: "Hager atef",
        age: 30,
        imageUrl:
            'https://thumbs.dreamstime.com/z/portrait-smiling-young-female-volunteer-holding-clipboard-over-white-background-37372789.jpg',
        phoneNumber: '+201*********',
        avaliableHours: 8,
        skills: [],
        type: Volunteer.regular),
  ];

  const Volunteer(
      {@required this.name,
      @required this.age,
      @required this.imageUrl,
      this.id,
      @required this.phoneNumber,
      @required this.avaliableHours,
      this.skills,
      @required this.type});
}
