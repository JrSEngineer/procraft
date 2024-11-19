import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';

pageNavigation(BuildContext context, int value, int pageIndex, ProcraftUser user) {
  if (value != pageIndex) {
    switch (value) {
      case 0:
        Modular.to.navigate('/home/', arguments: user);
        break;
      case 1:
        Modular.to.navigate('/projects/', arguments: user);
        break;
      case 2:
        Modular.to.navigate('/documentation/', arguments: user);
        break;
      case 3:
        Modular.to.navigate('/profile/', arguments: user);
        break;
      default:
        return;
    }
  }
}
