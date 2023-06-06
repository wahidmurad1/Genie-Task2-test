import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:genie_task/const/global_variable.dart';

class CustomFilterChips extends StatefulWidget {
  const CustomFilterChips({Key? key, required this.index, required this.onTap})
      : super(key: key);
  final index;
  final onTap;

  @override
  State<CustomFilterChips> createState() => _CustomFilterChipsState();
}

class _CustomFilterChipsState extends State<CustomFilterChips> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25), side: BorderSide(color: Color(0XFFFFFFFF))),
      label: Text(
        globalvariables.options[widget.index],
        style: const TextStyle(
            fontSize: 16.8, fontFamily: 'Euclid Regular', color: Colors.black),
      ),
      onDeleted: () {
        widget.onTap;
      },
      deleteIcon: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: const Color(0XFFFF6368),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.close,
            size: 12,
            color: Colors.white,
          )),
    );
    // Container(
    //   decoration: BoxDecoration(
    //     color: const Color(0XFFF4F7F9),
    //     borderRadius: BorderRadius.circular(25),
    //     boxShadow: const [
    //       BoxShadow(
    //         color: Colors.black45,
    //         blurRadius: 1,
    //         offset: Offset(0, 0),
    //       ),
    //     ],
    //   ),
    //   child: Wrap(
    //     alignment: WrapAlignment.center,
    //     spacing: 5,
    //     children: [
    //       Text(
    //         globalvariables.options[widget.index],
    //         style: const TextStyle(
    //             fontSize: 16.8,
    //             fontFamily: 'Euclid Regular',
    //             color: Colors.black),
    //       ),
    //       GestureDetector(
    //         onTap: widget.onTap,
    //         child: Container(
    //             width: 20,
    //             height: 20,
    //             decoration: BoxDecoration(
    //               color: const Color(0XFFFF6368),
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             child: const Icon(
    //               Icons.close,
    //               size: 12,
    //               color: Colors.white,
    //             )),
    //       )
    //     ],
    //   ),
    // );
  }
}