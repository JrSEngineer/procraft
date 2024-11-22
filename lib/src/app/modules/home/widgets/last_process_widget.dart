import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:procraft/src/app/shared/widgets/list_item_widget.dart';
import 'package:procraft/src/app/shared/widgets/tag_widget.dart';

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
    final chartSize = height * 0.102;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
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
                TagWidget(
                  borderColor: Theme.of(context).primaryColor,
                  backgroundColor: const Color(0xff7FB912),
                  label: "Concluído",
                  horizontalPadding: 12,
                  verticalPadding: 2,
                  animation: ValueNotifier(null),
                ),
              ],
            ),
            SizedBox(height: pageDividerValue),
            ListItemWidget(
              title: "Status",
              content: TagWidget(
                borderColor: Theme.of(context).primaryColor,
                backgroundColor: const Color(0xffD1D10C),
                label: "Estável",
                horizontalPadding: 12,
                verticalPadding: 2,
                animation: ValueNotifier(null),
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
                          height: 12,
                          width: 12,
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
                          height: 12,
                          width: 12,
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
                    height: chartSize,
                    width: chartSize,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: const Color(0xff2B4EC0),
                            radius: 12,
                          ),
                          PieChartSectionData(
                            color: const Color(0xff391D37),
                            radius: 12,
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
