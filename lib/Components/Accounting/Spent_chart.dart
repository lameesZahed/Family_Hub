import 'package:family_hub/Models/Accounting/categories_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'box_decoration_accounting.dart';

class SpentChart extends StatelessWidget {
  SpentChart({super.key});

  List<String> weekDays = ["0","200","500","1000","2000","3000","5000",""];
  List<String> categories = CategoriesModel().categories.keys.toList();
  ScrollController controller = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BoxDecorationAccounting(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          child: SizedBox(
            height: 260,
            width: MediaQuery.of(context).size.width*2 - 100,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: BarChart(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                BarChartData(
                  backgroundColor: Colors.transparent,
                  groupsSpace: 64,
                  alignment: BarChartAlignment.start,
                  maxY: 7,
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (group)=>colors[group.x%3],
                      getTooltipItem: (group,groupIndex,barRod,barRodIndex){
                        return BarTooltipItem(
                          "${barRod.toY}",
                          TextStyle(
                            color: Colors.white,
                            fontSize: 12
                          )
                        );
                      },
    
                      tooltipPadding: EdgeInsets.all(8),
                    )
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 0.5,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.black,
                      strokeWidth: 1,
                      dashArray: [2, 2]
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value,meta){
                          return Text(categories[value.toInt()],style: TextStyle(
                            color: Colors.black,
                            fontSize: 12
                          ),);
                        }
                      ),
                      // axisNameWidget: Text("Week",style: TextStyle())
                    ),
                    leftTitles: AxisTitles(
                       sideTitles:  SideTitles(
                           showTitles: true,
                           reservedSize: 30,
                           getTitlesWidget: (value,meta){
                             return Text(weekDays[value.toInt()],style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 10
                             ),);
                           }
                       )
                    ),
    
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false
                      )
                    ),
                    rightTitles: AxisTitles(
                      sideTitles:  SideTitles(
                          showTitles: false,
                      )
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(color: Colors.black,width: 1),
                    )
                  ),
                  barGroups: [
                    Rod(0, 1),
                    Rod(1, 2),
                    Rod(2, 3),
                    Rod(3, 4),
                    Rod(4, 5),
                    Rod(5, 6),
                    Rod(6, 7),
                    Rod(7, 8),
                    Rod(8, 9),
                  ]
                )
    
                  ),
            ),
          ),
        ),
      ),
    );

  }

  List <Color> colors = [
    Color(0xFF308983),
    Color(0xFF308983),
    Color(0xFF6E5C52),
  ];

  BarChartGroupData Rod(int x,double length){
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        color: colors[x%3],
        toY: length,
        width: 12,
        borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide(
          //   color: Colors.black,
          //   width: 1
          // ),
        // borderDashArray: [5,5]
        // backDrawRodData: BackgroundBarChartRodData(
        //   show: true,
        //   toY: 6,
        //   color: Color(0xFFC4B7A6)
        // )
      )
    ]
  );

}
}
