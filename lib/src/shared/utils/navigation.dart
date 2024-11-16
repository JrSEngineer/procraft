import 'package:flutter/material.dart';
import 'package:procraft/src/app/modules/documentation/documentations_page.dart';
import 'package:procraft/src/app/modules/home/home_page.dart';
import 'package:procraft/src/app/modules/profile/profile_page.dart';
import 'package:procraft/src/app/modules/projects/projects_page.dart';

pageNavigation(BuildContext context, int value, int pageIndex) {
  if (value != pageIndex) {
    switch (value) {
      case 0:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(pageIndex: value)));
        break;
      case 1:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProjectsPage(pageIndex: value)));
        break;
      case 2:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DocumentationsPage(pageIndex: value)));
        break;
      case 3:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage(pageIndex: value)));
        break;
      default:
        return;
    }
  }
}
