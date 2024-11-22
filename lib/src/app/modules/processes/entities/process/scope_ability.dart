// ignore_for_file: public_member_api_docs, sort_constructors_first
class ScopeAbility {
  String id;
  String description;

  ScopeAbility({
    required this.id,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
    };
  }

  factory ScopeAbility.fromMap(Map<String, dynamic> map) {
    return ScopeAbility(
      id: map['id'] as String,
      description: map['description'] as String,
    );
  }
}
