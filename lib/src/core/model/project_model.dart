import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  final String id;
  final String imageUrl;
  final String name;
  final String description;
  final List<String> technologies;

  ProjectModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.technologies,
  });

  factory ProjectModel.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();

    final technologies = data['technologies'] as List;

    return ProjectModel(
      id: doc.id,
      name: data['name'],
      description: data['description'],
      imageUrl: data['imageUrl'],
      technologies: technologies.map<String>((e) => e).toList(),
    );
  }
}
