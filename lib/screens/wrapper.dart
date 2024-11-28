import 'package:agenda_medica/modules/user.dart';
import 'package:agenda_medica/screens/authenticate/authenticate.dart';
import 'package:agenda_medica/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AppUser?>(context);

    // retorna ou a pagina home ou authenticate
    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
