import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/projects/projects_page.dart';
import 'package:procraft/src/app/shared/common/common_module.dart';

class ProjectsModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
      ];
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const ProjectsPage(), transition: TransitionType.fadeIn);
  }
}
