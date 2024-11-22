import 'package:procraft/src/app/modules/processes/entities/new_process/new_scope_hability.dart';

class NewProcessScope {
  List<NewScopeAbility> abilities;
  NewProcessScope({
    required this.abilities,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'abilities': abilities.map((ability) => ability.toMap()).toList(),
    };
  }
}
