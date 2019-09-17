import 'package:coeo/models/VolunteerModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class Post {
  final String title;
  final String description;
  final LatLng location;
  final List<Volunteer> responders;
  final List<Volunteer> viewed;
  final String videoUrl;

  Post(
      {@required this.title,
      @required this.description,
      @required this.location,
      @required this.responders,
      @required this.viewed,
      @required this.videoUrl});
}
