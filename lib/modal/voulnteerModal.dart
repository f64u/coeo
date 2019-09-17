import 'package:flutter/material.dart';

class Volunteer {
  String name;
  String id;
  String phoneNumber;
  int age;
  String type;
  String skills;
  String experience;
  int avaliableHours;
  String imageUrl;
  static const String medical = "Medical";
  static const String educational = "Educational";
  static const String regular = "Regular";

  Volunteer(
      {@required this.name,
      @required this.age,
      @required this.imageUrl,
      this.id,
      @required this.phoneNumber,
      @required this.avaliableHours,
      this.experience,
      this.skills,
      @required this.type});
}

class VolunteerProviders with ChangeNotifier {
  List<Volunteer> _volunteerList = [
    Volunteer(
        name: "Sara Shaker",
        age: 26,
        imageUrl:
            'https://thumbs.dreamstime.com/z/studio-portrait-woman-wearing-volunteer-t-shirt-looking-camera-44158547.jpg',
        phoneNumber: '+201*********',
        avaliableHours: 10,
        experience: '',
        skills: '',
        type: Volunteer.educational),
    Volunteer(
        name: "Abdullah Gamal",
        age: 35,
        imageUrl:
            'https://www.vsointernational.org/sites/default/files/styles/wysiwyg_default/public/ICS%20volunteer%20Ibraham%20Kamara%20Sierra%20Leone%20ebola.jpg?itok=JdTU_3c4',
        phoneNumber: '+201*********',
        avaliableHours: 5,
        experience: '',
        skills: '',
        type: Volunteer.medical),
    Volunteer(
        name: "Hager atef",
        age: 30,
        imageUrl:
            'https://thumbs.dreamstime.com/z/portrait-smiling-young-female-volunteer-holding-clipboard-over-white-background-37372789.jpg',
        phoneNumber: '+201*********',
        avaliableHours: 8,
        experience: '',
        skills: '',
        type: Volunteer.regular),
  ];

  List<Volunteer> get volunteers {
    return [..._volunteerList];
  }

  void addVolunteer(Volunteer volunteer) {
    volunteer.id = DateTime.now().toString();
    _volunteerList.add(volunteer);
    notifyListeners();
  }
}
