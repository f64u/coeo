import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screen/HomeScreen.dart';

import './modal/voulnteerModal.dart';
import './screen/LoginPage.dart';

void main() => runApp(SaveMyLife());

class SaveMyLife extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: VolunteerProviders(),
        )
      ],
      child: MaterialApp(
        title: 'Save My Life',
        showSemanticsDebugger: false,
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: LoginPage(),
        routes: {"/home-screen": (ctx) => MainScreen()},
      ),
    );
  }
}
