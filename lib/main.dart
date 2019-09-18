import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './router.dart';

void main() => runApp(CoeoApp());

class CoeoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        title: 'Coeo',
        showSemanticsDebugger: false,
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        initialRoute: '/login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
