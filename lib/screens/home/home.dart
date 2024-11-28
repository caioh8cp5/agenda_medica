import 'package:agenda_medica/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:agenda_medica/services/database.dart';
import 'package:provider/provider.dart';
import 'package:agenda_medica/screens/home/list.dart';
import 'package:agenda_medica/modules/consultas.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Boa Consulta'),
          backgroundColor: Colors.greenAccent[100],
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person, color: Colors.black,),
              label: Text('Logout', style: TextStyle(color: Colors.black)),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: List(),
    );
  }
}
