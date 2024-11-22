import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/processes/data/processes_repository.dart';
import 'package:procraft/src/app/modules/processes/interfaces/iprocesses_repository.dart';
import 'package:procraft/src/app/modules/processes/view/pages/processes_page.dart';
import 'package:procraft/src/app/modules/processes/view/stores/process_store.dart';
import 'package:procraft/src/app/shared/common/common_module.dart';

class ProcessesModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<IProcessesRepository>(ProcessesRepository.new);
    i.add(ProcessStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const ProcessesPage(), transition: TransitionType.fadeIn);
  }
}
