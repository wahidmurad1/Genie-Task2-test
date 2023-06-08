import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:genie_task/const/global_variable.dart';

class CustomDatePicker extends StatefulWidget {
  CustomDatePicker({
    Key? key,
    required this.boxTextString,
    required this.dateortimepicker,
    required this.dateortime,
    required this.icon,
    required this.isInitialDateTime,
  }) : super(key: key);

  var boxTextString;
  var dateortimepicker;
  var dateortime;
  IconData icon;
  bool isInitialDateTime;
  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))))),
      onPressed: () async {
        if (widget.dateortime == "date") {
          DateTime? pickStartDate = await showDatePicker(
              context: context,
              initialDate: globalvariables.selectedStartDate ??
                  selectedDate ??
                  DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));
          if (pickStartDate != null) {
            //  globalvariables.tempDate = pickStartDate;
            setState(() {
              selectedDate = pickStartDate;
              if (widget.isInitialDateTime) {
                globalvariables.selectedStartDate = pickStartDate;
              }
              widget.dateortimepicker =
                  formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]);
              globalvariables.addData(widget.dateortimepicker);
            });
          }
        } else if (widget.dateortime == "time") {
          TimeOfDay? pickTime = await showTimePicker(
              context: context,
              initialTime: globalvariables.selectedStartTime ??
                  selectedTime ??
                  TimeOfDay(hour: 12, minute: 00));
          if (pickTime != null) {
            setState(() {
              selectedTime = pickTime;
              if (widget.isInitialDateTime) {
                globalvariables.selectedStartTime = pickTime;
              }
              widget.dateortimepicker =
                  '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
              globalvariables.addData(widget.dateortimepicker);
            });
          }
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: [
          labelText(),
          Row(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              boxText(),
              Icon(
                widget.icon,
                color: Color(0xff7488A6),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            child: Divider(
              // height: 0.3,
              thickness: 0.3,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  labelText() {
    if (widget.dateortimepicker == "") {
      return const SizedBox(height: 14);
    } else {
      //widget.boxTextString = widget.dateortimepicker;
      return SizedBox(
        height: 14,
        child: Text(widget.boxTextString,
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Euclid',
                color: Colors.grey,
                fontWeight: FontWeight.w500)),
      );
    }
  }

  boxText() {
    if (widget.dateortimepicker == "") {
      return Text(widget.boxTextString,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ));
    } else {
      return Text(
        widget.dateortimepicker,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Euclid Regular',
          color: Colors.black,
          //fontWeight: FontWeight.w500
        ),
      );
    }
  }
}
