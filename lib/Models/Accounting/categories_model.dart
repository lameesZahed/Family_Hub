import 'package:family_hub/Models/Accounting/transactions_model.dart';

class CategoriesModel{
  Map<String,List<TransactionsModel>> categories = {
    "Food":[
      TransactionsModel(name: 'Chicken nuggets', amount: 2.5, dateTime: DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Sushi', amount: 2, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Ice coffee', amount: 3.5, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
    ],
    "Transport":[
      TransactionsModel(name: 'Uber', amount: 3.54, dateTime: DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Uber', amount: 4.67, dateTime: DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Taxi', amount: 3.45, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Taxi', amount: 1.3, dateTime: DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
    ],
    "Sport":[
      TransactionsModel(name: 'Club', amount: 8.9, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'football math', amount: 9.76, dateTime: DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Tennis', amount: 34.89, dateTime: DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
    ],
    "Pets":[
      TransactionsModel(name: 'Dry food', amount: 100.5, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'New toy', amount: 23.6, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Milk', amount: 45.6, dateTime: DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Brush', amount: 49.5, dateTime:DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
    ],
    "Clothes":[
      TransactionsModel(name: 'Shirt', amount: 100.5, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Skirt', amount: 23.6, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Pants', amount: 45.6, dateTime: DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Shoes', amount: 49.5, dateTime:DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
    ],
    "Health":[
      TransactionsModel(name: 'medicine 1', amount: 100.5, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'medicine 2', amount: 23.6, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'medicine 3', amount: 45.6, dateTime: DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'medicine 4', amount: 49.5, dateTime:DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
    ],
    "Children":[
      TransactionsModel(name: 'Toys', amount: 100.5, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Clothes', amount: 23.6, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
    ],
    "Education":[
      TransactionsModel(name: 'Book', amount: 45.6, dateTime: DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Book', amount: 49.5, dateTime:DateTime(4,7), duration: Duration(hours: 9,minutes: 30)),
    ],
    "Dept":[
      TransactionsModel(name: 'Salary', amount: 100.5, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
      TransactionsModel(name: 'Salary', amount: 23.6, dateTime:DateTime(4,7) , duration: Duration(hours: 9,minutes: 30)),
    ]
  };

  int sum(String category){
    double sum = 0;
    for(int i=0;i<categories[category]!.length;i++){
      sum+=categories[category]![i].amount;
    }
    return sum.toInt();
  }






}

// String DateFormat(DateTime dateTime){
//   List <String> months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
//   return "${months[dateTime.month-1]} ${dateTime.day}";
// }