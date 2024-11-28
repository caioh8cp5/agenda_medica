import 'package:agenda_medica/screens/authenticate/register.dart';
import 'package:agenda_medica/services/auth.dart';
import 'package:agenda_medica/shared/loading.dart';
import 'package:flutter/material.dart';

class SighIn extends StatefulWidget {
  const SighIn({super.key, required this.toggleView});

  final Function toggleView;

  @override
  State<SighIn> createState() => _SighInState();
}

class _SighInState extends State<SighIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[100],
        title: const Text('Entrar no Boa Consulta'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
            child: Column(
              children: <Widget> [
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                    validator: (val) {
                      if (val == null || val.isEmpty ) {
                        return 'Insira um e-mail';
                      }
                      return null;
                    },
                  onChanged: (val) {
                    setState(() => email = val);
                  }
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      hintStyle: TextStyle(color: Colors.black38),
                    ),
                  obscureText: true,
                    validator: (val) {
                      if (val == null || val.isEmpty || val.length < 6) {
                        return 'Insira uma senha com mais de 6 caracteres';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() => password = val);
                    }
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent[100]),
                      onPressed: () async {
                        widget.toggleView();
                      }, child: Text('Cadastrar', style: TextStyle(color: Colors.black)),),
                    Spacer(flex: 1,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent[100]),
                        child: Text('Entrar', style: TextStyle(color: Colors.black)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()){
                            setState(() => loading = true);
                            dynamic result = await _auth.sighInWithEmailAndPassword(email, password);
                            if(result == null){
                            setState(() {
                              error = 'Login inválido';
                              loading = false;
                            });
                            }
                          }
                        }
                    )
                  ],
                ),
                SizedBox(height: 12.0,),
                Text(error, style: TextStyle(color: Colors.red))
              ],
            ),
        ),
      ),
    );
  }
}
