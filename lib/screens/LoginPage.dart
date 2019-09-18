import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  static const errors = <String, String>{
    "PASSWORD_NO_MATCH": "Passwords don't match!",
    "ERROR_WEAK_PASSWORD": "Passowrd is weak! Please input a stronger one",
    "ERROR_INVALID_EMAIL": "Email is invalid",
    "ERROR_EMAIL_ALREADY_IN_USE":
        "Email is signed up with a different account!",
    "ERROR_WRONG_PASSWORD": "Passowrd is wrong",
    "ERROR_USER_NOT_FOUND": "The email is not associated with any user",
    "ERROR_USER_DISABLED": "User is disabled",
    "ERROR_TOO_MANY_REQUESTS": "Too many requests by user",
    "ERROR_OPERATION_NOT_ALLOWED": "Operation not allowed"
  };

  AnimationController controller;
  Animation<Offset> postion;
  Animation<double> fadding;

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
    setState(() {
      if (state == Authentiaction.SignUp) {
        state = Authentiaction.LogIn;
        controller.reverse();
      } else {
        state = Authentiaction.SignUp;
        controller.forward();
      }
    });
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
                            "Coeo",
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
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
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
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        controller: passwordTextController,
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
                                  controller: confirmPasswordTextController,
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
                              padding:
                                  const EdgeInsets.only(top: 16, right: 32),
                              child: FlatButton(
                                child: Text("Forgot Password ?",
                                    style: TextStyle(color: Colors.grey)),
                                onPressed: () {},
                              ),
                            ),
                          )
                        : Container(),
                    Builder(
                      builder: (BuildContext context) => Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: EdgeInsets.only(top: 32),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: FlatButton(
                          onPressed: () async {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Processing..."),
                            ));

                            try {
                              if (state == Authentiaction.LogIn) {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailTextController.text,
                                        password: passwordTextController.text);
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Successfully logged in!"),
                                ));
                                Navigator.pushReplacementNamed(
                                    context, "/home");
                              } else {
                                var password = passwordTextController.text;
                                var confirm =
                                    confirmPasswordTextController.text;

                                if (password != confirm)
                                  throw PlatformException(
                                      code: "PASSWORD_NO_MATCH");

                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: emailTextController.text,
                                        password: password);

                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Successfully signed up! Check your email for activation!"),
                                ));
                              }
                            } on PlatformException catch (e) {
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text(errors[e.code])));
                            }
                          },
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
