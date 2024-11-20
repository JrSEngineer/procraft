import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';
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
  @override
  Widget build(BuildContext context) {
    ProcraftUser user = Modular.args.data;

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    double pageDividerValue = height * 0.032;
    double pageHorizontalPadding = width * 0.064;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pageHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: pageDividerValue),
              Text(
                "Meus Projetos",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: pageDividerValue),
              const SearchWidget(),
              SizedBox(height: pageDividerValue),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TagWidget(
                    borderColor: Theme.of(context).primaryColor,
                    backgroundColor: const Color(0xffD3C8D8),
                    label: "Todos",
                    horizontalPadding: 12,
                    verticalPadding: 2,
                  ),
                  TagWidget(
                    borderColor: Theme.of(context).primaryColor,
                    backgroundColor: const Color(0xffF7F7F8),
                    label: "Finalizados",
                    horizontalPadding: 12,
                    verticalPadding: 2,
                  ),
                  TagWidget(
                    borderColor: Theme.of(context).primaryColor,
                    backgroundColor: const Color(0xffF7F7F8),
                    label: "Em Andamento",
                    horizontalPadding: 12,
                    verticalPadding: 2,
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, __) {
                    return SizedBox(height: height * 0.008);
                  },
                  itemCount: user.processes.length,
                  itemBuilder: (_, i) {
                    final process = user.processes[i];
                    return ProcessTileWidget(process: process);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ProcraftBottomNavigationBar(pageIndex: 1, user: user),
    );
  }
}
