
class NewScopeAbility {
  String name;
  String description;

  NewScopeAbility({
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
    };
  }

  factory NewScopeAbility.fromMap(Map<String, dynamic> map) {
    return NewScopeAbility(
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }
}