import 'package:agenda_medica/modules/consultas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference consulta = FirebaseFirestore.instance.collection('consultas');

  Future updateUserData(String title, String name, String telephone, Timestamp date, String desc) async {
    return await consulta.doc(uid).set({
      'title': title,
      'name': name,
      'telephone': telephone,
      'date': date,
      'desc': desc,
    });
  }

  List<Consultas> _consultasListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;

      return Consultas(
        name: data['name'] ?? '',
        telephone: data['telephone'] ?? '',
        date: data['date'] ?? Timestamp(0, 0),
        title: data['title'] ?? '',
        description: data['description'] ?? '',
      );
    }).toList();
  }

  Stream<List<Consultas>> get consultas {
    return consulta.snapshots()
    .map(_consultasListFromSnapshot);
  }
}