import 'package:flutter/material.dart';
import 'package:procraft/src/app/modules/projects/widgets/project_tile_widget.dart';
import 'package:procraft/src/app/shared/utils/navigation.dart';
import 'package:procraft/src/app/shared/widgets/search_widget.dart';
import 'package:procraft/src/app/shared/widgets/tag_widget.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({required this.pageIndex, super.key});

  final int pageIndex;

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  List<Widget> projects = List.filled(6, const ProjetTileWidget());
  @override
  Widget build(BuildContext context) {
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
                  itemCount: projects.length,
                  itemBuilder: (_, i) {
                    final project = projects[i];
                    return project;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: widget.pageIndex,
        onTap: (value) => pageNavigation(context, value, widget.pageIndex),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        unselectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        selectedIconTheme: const IconThemeData(color: Colors.white),
        items: [
          BottomNavigationBarItem(
            label: "Home",
            activeIcon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Icon(Icons.home_outlined),
              ),
            ),
            icon: const Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Projetos",
            activeIcon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Icon(Icons.insert_chart_outlined_rounded),
              ),
            ),
            icon: const Icon(Icons.insert_chart_outlined_rounded),
          ),
          BottomNavigationBarItem(
            label: "Docs",
            activeIcon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Icon(Icons.document_scanner_outlined),
              ),
            ),
            icon: const Icon(Icons.document_scanner_outlined),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            activeIcon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Icon(Icons.people_outline),
              ),
            ),
            icon: const Icon(Icons.people_outline),
          ),
        ],
      ),
    );
  }
}
