import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class List extends StatefulWidget {
  const List({super.key});

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {

    final consultas = Provider.of<QuerySnapshot>(context);
    // print(consultas.docs);
    for (var doc in consultas.docs) {
      print(doc.data());
    }
    return const Placeholder();
  }
}
