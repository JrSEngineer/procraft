// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:procraft/src/app/modules/home/entities/user_involved_process.dart';

class ProcessTileWidget extends StatelessWidget {
  const ProcessTileWidget({Key? key, required this.process}) : super(key: key);

  final UserInvolvedProcess process;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    double pageDividerValue = height * 0.024;
    final chartSize = height * 0.072;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  process.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            SizedBox(height: pageDividerValue),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  process.setProcessProgressStatus(process.progress.index),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: process.setProgressStatusColor(
                          process.progress.index,
                        ),
                      ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                    const SizedBox(height: 4),
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
                  padding: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    height: chartSize,
                    width: chartSize,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              color: const Color(0xff2B4EC0),
                              showTitle: false,
                              value: 75,
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
