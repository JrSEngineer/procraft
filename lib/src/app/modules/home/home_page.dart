import 'package:flutter/material.dart';
import 'package:procraft/src/app/modules/home/widgets/last_process_widget.dart';
import 'package:procraft/src/shared/widgets/list_item_widget.dart';
import 'package:procraft/src/shared/widgets/procraft_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    double pageDividerValue = height * 0.032;

    return Scaffold(
      appBar: ProcraftAppBar(
        width: width,
        height: height * 0.092,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.064,
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
            Divider(),
            Spacer(),
            Text(
              "Mais Recentes",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: pageDividerValue),
            LastProcessWidget(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
