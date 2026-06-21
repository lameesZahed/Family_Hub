import 'package:family_hub/Models/Education/grades_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../Models/Education/task.dart';
class GradesPerformanceChart extends StatelessWidget {
   GradesPerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,left: 16.0,right: 16.0,bottom: 64),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Grades Performance",style: TextStyle(
                color: Color(0xFF9B4747),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
              SizedBox(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: BarChart(
                        BarChartData(
                            minY: 0,
                            maxY: 7,
                            barTouchData: BarTouchData(
                                enabled: true,
                                touchTooltipData: BarTouchTooltipData(
                                  // getTooltipItem: (group, groupIndex, rod, rodIndex){},
                                  // getTooltipColor: (group)=>colors[group.x%3],
                                )
                            ),
                            gridData: FlGridData(
                                show: true,
                                drawVerticalLine: false,
                                drawHorizontalLine: true,
                                horizontalInterval: 0.5,
                                getDrawingHorizontalLine: (value){
                                  return FlLine(
                                    color: Colors.black,
                                    strokeWidth: 1,
                                    dashArray: [2,2],
                                  );
                                }
                            ),
                            borderData: FlBorderData(
                                show: true,
                                border: Border(
                                  top: BorderSide.none,
                                  bottom: BorderSide(
                                    color: Colors.black,
                                  ),
                                  left: BorderSide.none,
                                  right: BorderSide.none,
                                )
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 80,
                                  getTitlesWidget: (value,meta){
                                    return RotatedBox(
                                      quarterTurns: -1,
                                      child: Text(GradesModel().gradesList[value.toInt()].subjectName,style: TextStyle(
                                          fontSize: 8,
                                          color: Color(0xff6E5C52)
                                      )),
                                    );
                                  }
                              )),
                              rightTitles: AxisTitles(sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value,meta){
                                    List <String> days=["Sun","Mon","Tue","Wed","Thu","Fri","Sat",""];
                                    return RotatedBox(
                                      quarterTurns: -1,
                                      child: Text(days[value.toInt()],style: TextStyle(
                                          fontSize: 8,
                                          color: Color(0xff6E5C52)
                                      )),
                                    );
                                  }
                              )),
                            ),
                            barGroups: [for(int i=0;i<GradesModel().gradesList.length;i++)
                                     barGroup(i)
                                    ]



                        )
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 24,),
            ],
          ),
        ),
      ),
    );

  }
  List <Color> colors = [
    Color(0xFF308983),
    Color(0xFF308983),
    Color(0xFF655B5B),
  ];

  BarChartGroupData barGroup(int x){
    return BarChartGroupData(
        x: x,
        barRods: [
          BarChartRodData(
            toY: GradesModel().gradesList[x].currentGrade.toDouble()/GradesModel().gradesList[x].maxGrade.toDouble(),
            color: colors[x%3],
            width: 12,
          )
        ]
    );
  }

}
