import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProcessChartWidget extends StatelessWidget {
  const ProcessChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final chartSize = height * 0.102;
    return Row(
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
    );
  }
}
