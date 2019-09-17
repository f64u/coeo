import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Authentiaction { LogIn, SignUp }

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  String signInState = "Login";

  Authentiaction state = Authentiaction.LogIn;

  TextEditingController emailTextController;
  AnimationController controller;
  Animation<Offset> postion;
  Animation<double> fadding;

  //enum State {
  //  Login,Signup
  //} f45d27
  // f5851f

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    postion = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
        .animate(controller);
    fadding = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  toggleAuth() {
    if (state == Authentiaction.SignUp) {
      state = Authentiaction.LogIn;
      controller.reverse();
    } else {
      state = Authentiaction.SignUp;
      controller.forward();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32, right: 32),
                      child: FlatButton(
                          onPressed: toggleAuth,
                          child: Text(
                            state == Authentiaction.LogIn ? "Login" : "SignUp",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: state == Authentiaction.SignUp
                  ? MediaQuery.of(context).size.height / 1.7
                  : MediaQuery.of(context).size.height / 1.68,
              width: MediaQuery.of(context).size.width,
              padding: state == Authentiaction.LogIn
                  ? EdgeInsets.only(top: 52)
                  : EdgeInsets.only(top: 52),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: emailTextController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.grey,
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  state == Authentiaction.SignUp
                      ? FadeTransition(
                          opacity: fadding,
                          child: SlideTransition(
                            position: postion,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 45,
                              margin: EdgeInsets.only(top: 32),
                              padding: EdgeInsets.only(
                                  top: 4, left: 16, right: 16, bottom: 4),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 5)
                                  ]),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Confirm Password',
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  state == Authentiaction.LogIn
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16, right: 32),
                            child: FlatButton(
                              child: Text("Forgot Password ?",
                                  style: TextStyle(color: Colors.grey)),
                              onPressed: () {},
                            ),
                          ),
                        )
                      : Container(),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: EdgeInsets.only(top: 32),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: FlatButton(
                      onPressed: () {Navigator.of(context).pushReplacementNamed('/home-screen');},
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Center(
                          child: Text(
                            state == Authentiaction.LogIn
                                ? 'Login'.toUpperCase()
                                : 'SignUp'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, right: 32),
                      child: FlatButton(
                        child: Text(
                            state == Authentiaction.LogIn
                                ? "SignUp?"
                                : "Login?",
                            style: TextStyle(color: Colors.grey)),
                        onPressed: toggleAuth,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
