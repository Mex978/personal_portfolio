import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyModel {
  final String id;
  final String name;
  final String roleName;
  final String local;
  final List<String> descriptions;
  final DateTime date;

  bool selected = false;

  CompanyModel({
    required this.id,
    required this.name,
    required this.roleName,
    required this.local,
    required this.date,
    required this.descriptions,
  });

  factory CompanyModel.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();

    final descriptions = data['descriptions'] as List;

    return CompanyModel(
      id: doc.id,
      name: data['name'],
      roleName: data['roleName'],
      local: data['local'],
      date: (data['date'] as Timestamp).toDate(),
      descriptions: descriptions.map<String>((e) => e).toList(),
    );
  }
}
