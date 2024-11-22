// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:procraft/src/app/modules/processes/entities/process/scope_ability.dart';

class ProcessScope {
  String id;
  List<ScopeAbility> abilities;

  ProcessScope({
    required this.id,
    required this.abilities,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'abilities': abilities.map((ability) => ability.toMap()).toList(),
    };
  }

  factory ProcessScope.fromMap(Map<String, dynamic> map) {
    return ProcessScope(
      id: map['id'] as String,
      abilities: List<ScopeAbility>.from(
        (map['abilities'] as List).map<ScopeAbility>(
          (x) => ScopeAbility.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
