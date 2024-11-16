import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:procraft/src/shared/widgets/list_item_widget.dart';

class LastProcessWidget extends StatefulWidget {
  const LastProcessWidget({super.key});

  @override
  State<LastProcessWidget> createState() => _LastProcessWidgetState();
}

class _LastProcessWidgetState extends State<LastProcessWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    double pageDividerValue = height * 0.032;
    final charSize = height * 0.102;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          12,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nome do \nprojeto",
                  maxLines: 3,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48),
                    color: const Color(0xff7FB912),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Center(
                      child: Text(
                        "Concluído",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: pageDividerValue),
            ListItemWidget(
              title: "Status",
              content: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  color: const Color(0xffD1D10C),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Center(
                    child: Text(
                      "Estável",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: pageDividerValue),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: const Color(0xff2B4EC0),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text("Concluído 50%"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: const Color(0xff391D37),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text("Restante 50%"),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: SizedBox(
                    height: charSize,
                    width: charSize,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: const Color(0xff2B4EC0),
                            radius: 20,
                          ),
                          PieChartSectionData(
                            color: const Color(0xff391D37),
                            radius: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
