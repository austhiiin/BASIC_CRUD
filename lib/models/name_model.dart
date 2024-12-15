// lib/models/name_model.dart
class NameModel {
  final int id;
  final String name;

  NameModel({
    required this.id,
    required this.name,
  });

  // Convert from JSON (Supabase response) to NameModel
  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  // Convert NameModel to JSON for creating/updating
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
