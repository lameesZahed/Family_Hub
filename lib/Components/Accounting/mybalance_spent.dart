import 'package:flutter/material.dart';

import '../../Screens/Accounting/spent_details.dart';

class MybalanceSpent extends StatefulWidget {
  final String type;
  int balance;
  // final Function(int value)? onChanged;
  MybalanceSpent({super.key, required this.type,required this.balance, });

  @override
  State<MybalanceSpent> createState() => _MybalanceSpentState();
}

class _MybalanceSpentState extends State<MybalanceSpent> {
  int amount(int balance_count){
    return balance_count-50;
  }

  Widget icon(){
    if(isBalance){
      if(isEdit){
       return Icon(Icons.check,color: Color(0xFFC96868),size: 24,);
      }
      else{
       return Icon(Icons.edit,color: Color(0xFFC96868),size: 24,);
      }
    }else{
      return Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 24,);
    }
  }

  late bool isBalance;
  late bool isSpent;
  TextEditingController controller = TextEditingController();


  @override
  void initState() {
    isBalance= widget.type=="My balance";
    isSpent = widget.type =="Spent";
    controller.text = widget.balance.toString();
    super.initState();
  }

  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
   int spent = amount(widget.balance);
    return GestureDetector(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: (isBalance)?LinearGradient(colors: [Colors.white,Colors.white]):LinearGradient(colors: [Color(0xFF37817D),Color(0xFF0D6E6E)]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.type,style: TextStyle(
                color: (isBalance)?Color(0xFF9B4747):Color(0xFFC4B7A6),
                // fontSize: 14,
                fontWeight: FontWeight.w500,
              ),),
              Row(
                children: [
                  (isEdit)?
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      controller: controller,
                    ),
                  )
                  :Text(
                    (isBalance)? "\$ ${widget.balance}": "\$ $spent "!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color:(isBalance)? Color(0xFF6E5C52):Colors.white,
                   ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: (){
                        setState(() {
                          if(isBalance){
                            isEdit=!isEdit;
                            widget.balance = int.parse(controller.text);
                          }
                          else{
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SpentDetails()));
                          }
                        });
                      },
                      icon: icon()
                  ),
                ],
              )
            ],
          ),
        ),

      ),
      onTap: (){},
    );
  }
}
