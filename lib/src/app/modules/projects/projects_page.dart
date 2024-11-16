import 'package:flutter/material.dart';
import 'package:procraft/src/shared/utils/navigation.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({required this.pageIndex, super.key});

  final int pageIndex;

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    double pageDividerValue = height * 0.032;
    double pageVerticalPadding = height * 0.036;
    double pageHorizontalPadding = width * 0.064;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: pageVerticalPadding, horizontal: pageHorizontalPadding),
          child: Column(
            children: [
              Text(
                "Meus Projetos",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: pageDividerValue),
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
                color: Theme.of(context).primaryColor,
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
                color: Theme.of(context).primaryColor,
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
                color: Theme.of(context).primaryColor,
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
                color: Theme.of(context).primaryColor,
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
