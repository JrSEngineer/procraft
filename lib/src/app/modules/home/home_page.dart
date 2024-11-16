// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:procraft/src/app/modules/home/widgets/last_process_widget.dart';
import 'package:procraft/src/shared/utils/navigation.dart';
import 'package:procraft/src/shared/widgets/list_item_widget.dart';
import 'package:procraft/src/shared/widgets/procraft_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.pageIndex, Key? key}) : super(key: key);

  final int pageIndex;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    double pageDividerValue = height * 0.032;
    double pageHorizontalPadding = width * 0.064;
    return Scaffold(
      appBar: ProcraftAppBar(
        width: width,
        height: height * 0.092,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: pageHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bem Vindo(a)",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: pageDividerValue),
            Column(
              children: [
                ListItemWidget(
                  title: "Etapas",
                  content: Text(
                    "8",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: pageDividerValue),
                ListItemWidget(
                  title: "Minhas Ações",
                  content: Text(
                    "8",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: pageDividerValue),
                ListItemWidget(
                  title: "Total de Projetos",
                  content: Text(
                    "8",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: pageDividerValue),
              ],
            ),
            const Divider(),
            SizedBox(height: pageDividerValue),
            Text(
              "Mais Recentes",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: pageDividerValue),
            const LastProcessWidget(),
            const Spacer(),
          ],
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
