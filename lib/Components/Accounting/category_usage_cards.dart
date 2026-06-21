import 'package:flutter/material.dart';

import '../../Screens/Accounting/show_transactions.dart';

class CategoryUsageCards extends StatelessWidget {
  final String title;
  final IconData icon;
  final int amount;
  final String subtitle;
  final Color color;
  const CategoryUsageCards({
    super.key,
    required this.title,
    required this.icon,
    required this.amount,
    required this.subtitle, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
                  MainData(context),
                  SubData()
                ]),
        ));
  }

  Widget MainData(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: ListTile(
            leading: DecoratedBox(
              decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8)
              ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(icon,color: color,),
                )
            ),
            title: Text(title,style: TextStyle(
                color: Colors.black,
                fontSize: 16
            )),
            subtitle: Text(subtitle,style: TextStyle(
                color: Color(0xFF6E5C52),
                fontSize: 10
            )),
          ),
        ),
        Spacer(),
        Column(
          children: [
            Text("\$ $amount",
              style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
            ),
            Text("OF \$ 3,000",
              style: TextStyle(
                color: Color(0xFF6E5C52),
                fontSize: 10),
            ),
          ],
        ),
        SizedBox(width: 16,),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowTransactions(title: title,)));
          },
            child: Icon(Icons.arrow_forward_ios, color: Color(0xFF6E5C52), size: 18)),
        SizedBox(width: 8,),

      ],

    );
  }

  Widget SubData() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LinearProgressIndicator(
        value: 0.71,
        minHeight: 12,
        borderRadius: BorderRadius.circular(24),
        backgroundColor: color.withOpacity(0.5),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }

}
