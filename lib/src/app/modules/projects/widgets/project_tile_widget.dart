import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProjetTileWidget extends StatelessWidget {
  const ProjetTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    double pageDividerValue = height * 0.042;
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome do Projeto \nem andamento',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: pageDividerValue),
                Text(
                  'Em andamento',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
