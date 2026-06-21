import 'package:family_hub/Components/Accounting/add_edit_tansaction_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsCards extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime dateTime;
  final Duration duration;
  const TransactionsCards({super.key, required this.title, required this.amount, required this.dateTime, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: Text(title,style: TextStyle(
            color: Colors.black,
            fontSize: 16
          ),),
          titleTextStyle:TextStyle(),
          subtitle: Row(
            children: [
              Text(DateFormat('MMMM d').format(dateTime)),
              SizedBox(width: 8,),
              Text("\u2022",style: TextStyle(
                color: Color(0xFFC4B7A6),
              )),
              SizedBox(width: 8,),
              Text(DateFormat('hh:mm a').format(dateTime)),
            ],
          ),
          subtitleTextStyle: TextStyle(
            color: Color(0xFF6E5C52),
            fontSize: 10
          ),
          trailing: Text("\$ $amount",style: TextStyle(
            color: Color(0xFF9B4747),
            fontSize: 16,
            fontWeight: FontWeight.bold
          )),
          onTap: (){
            showDialog(context: context, builder: (context)=>AddEditTansactionDialog(

            ));

          },

        ),
      ),
    );
  }
}
