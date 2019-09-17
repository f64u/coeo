import 'package:coeo/models/VolunteerModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class Post {
  final String title;
  final String description;
  final LatLng location;
  final List<Volunteer> responders;
  final List<Volunteer> viewed;
  final String imageUrl;

  Post(
      {@required this.title,
      this.description,
      @required this.location,
      @required this.responders,
      @required this.viewed,
      this.imageUrl});
}
