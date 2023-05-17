class CompanyModel {
  final int id;
  final String name;
  final String roleName;
  final LocalModel local;
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
}

class LocalModel {
  final String city;
  final String state;

  LocalModel({
    required this.city,
    required this.state,
  });
}
