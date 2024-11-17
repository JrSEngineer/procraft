import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/documentation/documentations_page.dart';

class DocumentationModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const DocumentationsPage(pageIndex: 2));
  }
}
