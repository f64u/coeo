import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/VolunteerModel.dart';
import './router.dart';

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
        title: 'Coeo',
        showSemanticsDebugger: false,
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
