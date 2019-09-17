import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/voulnteerModal.dart';

class WidgetOfVolunteers extends StatelessWidget {
  List<Volunteer> volunteers;

  WidgetOfVolunteers() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    volunteers = Provider.of<VolunteerProviders>(context).volunteers;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)),
                      child: Image.network(
                        volunteers[index].imageUrl,
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
                            volunteers[index].name,
                            style: TextStyle(color: Colors.white,fontSize: 20),
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
                            Icon(Icons.work),
                            SizedBox(
                              width: 3,
                            ),
                            Text(volunteers[index].type)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.access_time),
                            SizedBox(
                              width: 3,
                            ),
                            FittedBox(child: Text('${volunteers[index].avaliableHours}h'),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.timelapse),
                            SizedBox(
                              width: 3,
                            ),
                            Text('${volunteers[index].age} years')
                          ],
                        ),
                      ],
                    ))
              ],
            ),
        );
      },
      itemCount: volunteers.length,
    );
  }
}
