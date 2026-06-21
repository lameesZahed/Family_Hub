import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';


class Header extends StatefulWidget {
  final DateTime date;
  bool expand;
  final Function(bool) onViewMore;
  Header({super.key, required this.date, required this.expand, required this.onViewMore});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {


  // String header(DateTime date){
  //   List<String> week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Satuday"];
  //   List<String> months = [
  //     "January",
  //     "February",
  //     "March",
  //     "April",
  //     "May",
  //     "June",
  //     "July",
  //     "August",
  //     "September",
  //     "October",
  //     "November",
  //     "December",
  //   ];
  //   return "${week[date.weekday %7].substring(0,3)}, ${months[date.month-1].substring(0,3)} ${date.day}, ${date.year}";
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(0, 0),
          )
        ],
        borderRadius: BorderRadius.circular(48),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              DateFormat("EE, MMMM d, yyy").format(widget.date),
              style: TextStyle(color: Color(0xFF016B61), fontSize: 16,fontWeight: FontWeight.normal),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.expand = !widget.expand;
                  widget.onViewMore(widget.expand);
                });
              },
              icon: (widget.expand
                  ? Icon(Icons.arrow_drop_up_outlined)
                  : Icon(Icons.arrow_drop_down_outlined)),
                color: Color(0xFF016B61)
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/Icons/Calendar.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
