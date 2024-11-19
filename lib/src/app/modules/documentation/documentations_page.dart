import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';
import 'package:procraft/src/app/shared/widgets/procraft_bottom_navigation_bar.dart';

class DocumentationsPage extends StatefulWidget {
  const DocumentationsPage({super.key});

  @override
  State<DocumentationsPage> createState() => _DocumentationsPageState();
}

class _DocumentationsPageState extends State<DocumentationsPage> {
  @override
  Widget build(BuildContext context) {
    ProcraftUser user = Modular.args.data;

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
                "Projetos Documentados",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: pageDividerValue),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ProcraftBottomNavigationBar(pageIndex: 2, user: user),
    );
  }
}
