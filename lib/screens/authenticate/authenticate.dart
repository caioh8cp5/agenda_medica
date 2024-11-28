import 'package:agenda_medica/screens/authenticate/register.dart';
import 'package:agenda_medica/screens/authenticate/sigh_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SighIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
