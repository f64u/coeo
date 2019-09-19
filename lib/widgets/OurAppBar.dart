import 'package:flutter/material.dart';
import '../models/VolunteerModel.dart';

class OurAppBar extends AppBar {
  final Volunteer volunteer;
  final void Function() onFilter;

  OurAppBar({@required this.volunteer, this.onFilter})
      : super(
          leading: ListTile(
            leading: CircleAvatar(
              child: Image.network(volunteer.imageUrl),
            ),
            title: Text(volunteer.name),
            subtitle: Text(volunteer.points.toString()),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.filter), onPressed: onFilter)
          ],
        );
}
