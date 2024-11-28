import 'package:cloud_firestore/cloud_firestore.dart';

class Consultas {
  final String name;
  final String telephone;
  final Timestamp date;
  final String title;
  final String description;

  Consultas({
    required this.name,
    required this.telephone,
    required this.date,
    required this.title,
    required this.description,
  });
}