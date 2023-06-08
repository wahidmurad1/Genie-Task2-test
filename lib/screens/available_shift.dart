import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AvailableShift extends StatefulWidget {
  const AvailableShift({Key? key}) : super(key: key);

  @override
  State<AvailableShift> createState() => _AvailableShiftState();
}

class _AvailableShiftState extends State<AvailableShift> {
  int groupValue = 0;
  int groupValue2 = 0;

  var start;
  var end;
  DateTime _dateTime = DateTime.now();
  DateTime _dateTime2 = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 01, 01),
      lastDate: DateTime(2040, 12, 31),
    ).then((value) {
      setState(() {
        _dateTime = value!;
        start = DateFormat('yyyy/MM/dd').format(_dateTime);
        print(start);
      });
    });
  }

  void _showDatePicker2() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 01, 01),
      lastDate: DateTime(2035, 12, 31),
    ).then((value) {
      setState(() {
        _dateTime2 = value!;
        end = DateFormat('yyyy/MM/dd').format(_dateTime2);
        print(end);
      });
    });
  }

  @override
  void initState() {
    start = DateFormat('yyyy/MM/dd').format(_dateTime);
    end = DateFormat('yyyy/MM/dd').format(_dateTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
          .copyWith(bottom: 0),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(builder: (context, setState) {
                  setState(
                    () {
                      start = DateFormat('d. MMM yyyy').format(_dateTime);
                      end = DateFormat('d. MMM yyyy').format(_dateTime2);
                    },
                  );
                  return AlertDialog(
                    actions: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Text(
                                  "Filter",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Clear",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0XFFFF6368)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 156),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 16,
                                      color: Color(0XFF0E1826),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Start Date',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        start,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      InkWell(
                                        onTap: _showDatePicker,
                                        child: Icon(
                                          Icons.date_range_rounded,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Container(
                                      width: 135,
                                      height: 1,
                                      color: Color(0XFFD1D5DB),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        'End Date',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        end,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      InkWell(
                                        onTap: _showDatePicker2,
                                        child: Icon(
                                          Icons.date_range_rounded,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Container(
                                      width: 135,
                                      height: 1,
                                      color: Color(0XFFD1D5DB),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Start Time',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '10:00',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          width: 85,
                                        ),
                                        Icon(
                                          Icons.watch_later_rounded,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Container(
                                        width: 135,
                                        height: 1,
                                        color: Color(0XFFD1D5DB),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'End Time',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '18:00',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        Icon(
                                          Icons.watch_later_rounded,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Container(
                                        width: 135,
                                        height: 1,
                                        color: Color(0XFFD1D5DB),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                         
                          Column(
                            children: [
                              const Align(
                                //Select car/License plate
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    'Select car/License plate',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'AA 00 000',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(
                                              builder: (context, setState) {
                                                return SingleChildScrollView(
                                                  child: AlertDialog(
                                                    actions: [
                                                      Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Select Car",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              const Spacer(),
                                                              IconButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                icon: Icon(
                                                                  Icons.close,
                                                                  size: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            width: 300,
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0XFFF4F7F9),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black45,
                                                                  blurRadius: 1,
                                                                  offset:
                                                                      Offset(
                                                                          0, 0),
                                                                ),
                                                              ],
                                                            ),
                                                            child: TextField(
                                                              onChanged:
                                                                  (value) {},
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              decoration:
                                                                  const InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        top: 8,
                                                                        bottom:
                                                                            12),
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons.search,
                                                                  size: 20,
                                                                  color: Color(
                                                                      0XFFB7BAC2),
                                                                ),
                                                                hintText:
                                                                    "Search",
                                                                hintStyle:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                  color: Color(
                                                                      0XFFB7BAC2),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Toyota/AA00000',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              const Spacer(),
                                                              Radio(
                                                                value: 1,
                                                                groupValue:
                                                                    groupValue,
                                                                activeColor:
                                                                    Colors
                                                                        .green,
                                                                onChanged:
                                                                    (val) {
                                                                  print(val);
                                                                  // setState(() {
                                                                  //   groupValue =
                                                                  //       val!;
                                                                  // });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Toyota/AA00000',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              const Spacer(),
                                                              Radio(
                                                                value: 2,
                                                                groupValue:
                                                                    groupValue,
                                                                activeColor:
                                                                    Colors
                                                                        .green,
                                                                onChanged:
                                                                    (val) {
                                                                  print(val);
                                                                  // setState(() {
                                                                  //   groupValue = int.parse(val);

                                                                  // });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Toyota/AA00000',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              const Spacer(),
                                                              Radio(
                                                                value: 3,
                                                                groupValue:
                                                                    groupValue,
                                                                activeColor:
                                                                    Colors
                                                                        .green,
                                                                onChanged:
                                                                    (val) {
                                                                  print(val);
                                                                  // setState(() {
                                                                  //   groupValue = val;
                                                                  // });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Toyota/AA00000',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              const Spacer(),
                                                              Radio(
                                                                value: 4,
                                                                groupValue:
                                                                    groupValue,
                                                                activeColor:
                                                                    Colors
                                                                        .green,
                                                                onChanged:
                                                                    (val) {
                                                                  print(val);
                                                                  setState(() {
                                                                    groupValue =
                                                                        val as int;
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 90,
                                                            height: 30,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0XFFF89818),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                'Submit',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          });
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Container(
                                  width: 280,
                                  height: 1,
                                  color: Color(0XFFD1D5DB),
                                ),
                              ),
                            ],
                          ),
                         
                         //Select Driver
                         
                        ],
                      ),
                   
                    ],
                  );
                });
              });
        
        },

        //Available Shift ui screen
      ),
    );
  }
}
