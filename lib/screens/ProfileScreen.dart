import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                child: CircleAvatar(),
                onTap: () {
                  print('tapped');
                },
              ),
              TextField()
            ],
          )
        ],
      ),
    );
  }
}
