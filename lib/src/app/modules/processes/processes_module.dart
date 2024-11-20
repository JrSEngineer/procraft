import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/processes/processes_page.dart';
import 'package:procraft/src/app/shared/common/common_module.dart';

class ProcessesModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
      ];
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const ProcessesPage(), transition: TransitionType.fadeIn);
  }
}
