import 'package:family_hub/Components/Calendar/EditAdd/edit_add_block.dart';
import 'package:family_hub/Components/Calendar/EditAdd/edit_add_cards.dart';
import 'package:family_hub/Components/Calendar/Expand/expand_time.dart';
import 'package:family_hub/Components/Calendar/old_calendar.dart';
import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Calendar/Expand/expand_alert.dart';
import '../../Components/Calendar/Expand/expand_calendar.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';

class EditAddEvent extends StatefulWidget {
  final String? name;
  final String? description;
  TimeOfDay? time;
  DateTime? date;
  int? alert;
  EditAddEvent({
    super.key,
    this.name,
    this.description,
    this.time,
    this.date,
    this.alert,
  });

  @override
  State<EditAddEvent> createState() => _EditAddEventState();
}

class _EditAddEventState extends State<EditAddEvent> {
  bool expandDate = false;
  bool expandTime = false;
  bool expandAlert = false;
  late DateTime firstDate;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    firstDate = widget.date ?? DateTime.now();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // DateTime dateSelected = widget.date;
    return Scaffold(
      endDrawer: MainDrawer(),
      appBar: MainAppBar(
          title: (widget.name != null)? "Update Event":"Add Event"
      ),
      body: Body(),
    );
  }

  Widget Body() {
    titleController.text = widget.name ?? "";
    descriptionController.text = widget.description ?? "";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EditAddBlock(
                text: "Event Title",
                card: theTextField(1, "Enter Event Title", titleController, 20),
              ),
              EditAddBlock(
                text: "Description",
                card: theTextField(
                  4,
                  "Enter Description",
                  descriptionController,
                  130,
                ),
              ),
              EditAddBlock(
                text: "Date",
                card: EditAddCards(
                  data: (widget.date == null)
                      ? DateFormat("MMMM dd, yyyy").format(DateTime.now())
                      : DateFormat("MMMM dd, yyyy").format(widget.date!),
                  icon: Icons.calendar_month,
                  onTap: Date,

                ),
              ),
              EditAddBlock(
                text: "Time",
                card: EditAddCards(
                  icon: Icons.access_time,
                  data: (widget.time == null)
                      ? TimeOfDay.now().format(context)
                      : widget.time!.format(context),
                  onTap: Timer,
                ),
              ),
              EditAddBlock(
                text: "Remainder Alert",
                card: ExpandAlert(
                  alertValue: widget.alert,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Button(text: (widget.name != null)? "Update Event":"Add Event", onPressed: (){}),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }


  Timer() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: widget.time?? TimeOfDay.now(),
    );
    if(selectedTime != null){
      setState(() {
        widget.time = selectedTime;
      });
    }

  }
  Date() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.date,
      firstDate: firstDate,
      lastDate: DateTime(2030),


    );
    if (selectedDate != null) {
      setState(() {
        widget.date = selectedDate;
      });
    }
  }

  Widget theTextField(
    int lines,
    String hint,
    TextEditingController controller,
    int length,
  ) {
    return TextFormField(
      maxLines: lines,
      maxLength: length,
      controller: controller,
      decoration: InputDecoration(
        hintText: (hint == null) ? " " : hint,
      ),
    );
  }
}
