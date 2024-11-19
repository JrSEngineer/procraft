// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';
import 'package:procraft/src/app/shared/utils/navigation.dart';

class ProcraftBottomNavigationBar extends StatelessWidget {
  const ProcraftBottomNavigationBar({Key? key, required this.pageIndex, required this.user}) : super(key: key);

  final int pageIndex;
  final ProcraftUser user;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: pageIndex,
      onTap: (value) => pageNavigation(context, value, pageIndex, user),
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
    );
  }
}
