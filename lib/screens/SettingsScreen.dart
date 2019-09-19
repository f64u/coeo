import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/VolunteerModel.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Volunteer>(
        future: Volunteer.ofUser(FirebaseAuth.instance.currentUser()),
        builder: (context, snapshot) {
          return ListView(
            children: <Widget>[
              snapshot.hasData
                  ? ListTile(
                      leading: CircleAvatar(
                        child: Image.network(snapshot.data.imageUrl),
                      ),
                      title: Text(snapshot.data.name),
                      subtitle: Text("Tap to edit user info"),
                      onTap: () {
                        Navigator.pushNamed(context, "/volunteerEdit");
                      },
                    )
                  : ListTile(
                      leading: CircularProgressIndicator(),
                      title: Text("Loading..."),
                      onTap: null,
                    ),
              Divider(height: 32.0),
              ListTile(
                title: Text("About"),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: <Widget>[
                            Text(
                              "About",
                              style: Theme.of(context).textTheme.display1,
                            ),
                            Text("""""")
                          ],
                        );
                      });
                },
              ),
              Divider(),
              ListTile(
                title: Text("Achnowledgments"),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: <Widget>[
                            Text(
                              "Acknowledgments",
                              style: Theme.of(context).textTheme.display1,
                            ),
                            Text("""This app's whole purpose is to help. \
                                      This is achieved by utilizing the user's knowledge to help people.""")
                          ],
                        );
                      });
                },
              )
            ],
          );
        },
      ),
    );
  }
}
