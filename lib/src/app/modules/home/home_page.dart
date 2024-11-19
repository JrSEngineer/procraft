// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';
import 'package:procraft/src/app/modules/home/widgets/last_process_widget.dart';
import 'package:procraft/src/app/shared/widgets/list_item_widget.dart';
import 'package:procraft/src/app/shared/widgets/procraft_appbar.dart';
import 'package:procraft/src/app/shared/widgets/procraft_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.pageIndex}) : super(key: key);

  final int pageIndex;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProcraftUser user = Modular.args.data;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    double pageDividerValue = height * 0.032;
    double pageHorizontalPadding = width * 0.064;
    return Scaffold(
      appBar: ProcraftAppBar(
        user: user,
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
      bottomNavigationBar: ProcraftBottomNavigationBar(pageIndex: 0, user: user),
    );
  }
}
