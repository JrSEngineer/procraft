import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';
import 'package:procraft/src/app/modules/processes/view/stores/process_store.dart';
import 'package:procraft/src/app/modules/processes/widgets/proccesses_fags_widget.dart';
import 'package:procraft/src/app/modules/processes/widgets/process_tile_widget.dart';
import 'package:procraft/src/app/shared/widgets/procraft_bottom_navigation_bar.dart';
import 'package:procraft/src/app/shared/widgets/search_widget.dart';
import 'package:procraft/src/app/shared/widgets/tag_widget.dart';

class ProcessesPage extends StatefulWidget {
  const ProcessesPage({super.key});

  @override
  State<ProcessesPage> createState() => _ProcessesPageState();
}

class _ProcessesPageState extends State<ProcessesPage> {
  late ProcessStore store;

  late ProcraftUser user;

  @override
  void initState() {
    super.initState();
    user = Modular.args.data;

    store = Modular.get<ProcessStore>();
  }

  @override
  Widget build(BuildContext context) {
    store.getUserProcesses(context, user.id);

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    double pageDividerValue = height * 0.032;
    double pageTopPadding = height * 0.048;
    double pageHorizontalPadding = width * 0.064;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: pageTopPadding),
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pageHorizontalPadding),
            child: ValueListenableBuilder(
              valueListenable: store,
              builder: (_, __, ___) {
                return store.loading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Meus Projetos",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(height: pageDividerValue),
                          SearchWidget(
                            onChanged: store.taggedValue ? store.applyFilterInProcessesListWithTagValue : store.applyFilterInProcessesList,
                          ),
                          SizedBox(height: pageDividerValue),
                          ProcessesTagsWidget(store: store),
                          Expanded(
                            child: store.value.isNotEmpty
                                ? ListView.separated(
                                    separatorBuilder: (_, __) {
                                      return SizedBox(height: height * 0.008);
                                    },
                                    itemCount: store.value.length,
                                    itemBuilder: (_, i) {
                                      final process = store.value[i];

                                      return ProcessTileWidget(process: process);
                                    },
                                  )
                                : const Center(
                                    child: Text('Nenhum processo a ser exibido.'),
                                  ),
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: ProcraftBottomNavigationBar(pageIndex: 1, user: user),
    );
  }
}
