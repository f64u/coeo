import 'package:flutter/material.dart';

import '../models/VolunteerModel.dart';

class VolunteerWidget extends StatelessWidget {
  final Volunteer volunteer;

  const VolunteerWidget(this.volunteer);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                child: Image.network(
                  volunteer.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  width: 240,
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Padding(
                    child: Text(
                      volunteer.name,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    padding: EdgeInsets.all(12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(
                        width: 3,
                      ),
                      FittedBox(
                        child: Text('${volunteer.availableHours}h'),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.timelapse),
                      SizedBox(
                        width: 3,
                      ),
                      Text('${volunteer.age} years')
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
