import 'package:family_hub/Models/Education/task.dart';
import 'package:family_hub/Models/Education/tasks_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyPerformanceChart extends StatelessWidget {
   WeeklyPerformanceChart({super.key});

  List <Color> colors = [
    Color(0xFF308983),
    Color(0xFF308983),
    Color(0xFF655B5B),
  ];
   List <Task> typeList(taskType taskType){
     List <Task> typeList = [];
     for(var task in TasksModel().tasks){
       if(task.type == taskType){
         typeList.add(task);
       }
     }
     return typeList;
   }

   List <Task> completedTasks(taskType taskType){
     List <Task> completedTasksList = [];
     for(var task in typeList(taskType)){
       if(task.isDone == true){
         completedTasksList.add(task);
       }
     }
     return completedTasksList;
   }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Weekly Performance",style: TextStyle(
                color: Color(0xFF9B4747),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
              SizedBox(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BarChart(
                    BarChartData(
                      minY: 0,
                      maxY: 7,
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipItem: (group, groupIndex, rod, rodIndex){
                            return BarTooltipItem(
                                completedTasks(taskType.values[groupIndex]).length.toString(),
                              TextStyle(
                                color: Colors.white
                              )
                            );
                          },
                          getTooltipColor: (group)=>colors[group.x%3],
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
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value,meta){
                            return Text(taskType.values[value.toInt()].name,style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff6E5C52)
                            ));
                          }
                        )),
                        leftTitles: AxisTitles(sideTitles: SideTitles(
                            showTitles: true,
                          getTitlesWidget: (value,meta){
                             List <String> days=["Sun","Mon","Tue","Wed","Thu","Fri","Sat",""];
                              return Text(days[value.toInt()],style: TextStyle(
                                fontSize: 8,
                                color: Color(0xff6E5C52)
                              ));
                          }
                        )),
                      ),
                      barGroups: [
                        barGroup(0,taskType.values[0]),
                        barGroup(1,taskType.values[1]),
                        barGroup(2,taskType.values[2]),
                      ]
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  BarChartGroupData barGroup(int x,taskType taskType){
     return BarChartGroupData(
         x: x,
         barRods: [
           BarChartRodData(
             toY: completedTasks(taskType).length.toDouble(),
             color: colors[x%3],
             width: 12,
           )
         ]
     );
  }


}
