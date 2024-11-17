import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/projects/projects_page.dart';

class ProjectsModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const ProjectsPage(pageIndex: 2));
  }
}
