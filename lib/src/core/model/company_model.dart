import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CompanyModel {
  final String id;
  final String name;
  final String roleName;
  final String local;
  final List<String> descriptions;
  final DateTime startDate;
  final DateTime? endDate;

  bool selected = false;

  CompanyModel({
    required this.id,
    required this.name,
    required this.roleName,
    required this.local,
    required this.startDate,
    this.endDate,
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
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: data['endDate'] != null ? (data['endDate'] as Timestamp).toDate() : null,
      descriptions: descriptions.map<String>((e) => e).toList(),
    );
  }

  String get formattedStartDate {
    var inputFormat = DateFormat('MMM yyyy');
    return inputFormat.format(startDate);
  }

  String get formattedEndDate {
    if (endDate != null) {
      var inputFormat = DateFormat('MMM yyyy');
      return inputFormat.format(endDate!);
    }

    return 'Present';
  }
}
