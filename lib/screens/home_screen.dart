import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:genie_task/const/global_variable.dart';
import 'package:genie_task/const/search_screen.dart';
import 'package:genie_task/const/suggestion.dart';
import 'package:genie_task/const/suggestion2.dart';
import 'package:genie_task/screens/available_shift.dart';
import 'package:genie_task/screens/available_shift2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _searchTextController;
  late final FocusNode focusNode;
  int tag=3;
  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    focusNode = FocusNode();
  }

  bool isSearching = false;
  @override
  void dispose() {
    if (mounted) {
      _searchTextController.dispose();
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  'Shift Planner',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 15, right: 12),
              child: Row(
                children: [
                 Container(
                  width: 300,
                  height: 40,
                  child: const SearchScreen()),
                  const SizedBox(
                    width: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0XFFF89818),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.asset(
                        'assets/images/vector.png',
                        width: 13,
                        height: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
             if (globalvariables.options.isNotEmpty)
            Visibility(
              visible: globalvariables.isVisible,
              child: Container(
                //height: height*0.25,
                //width: size.width*0.9,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    ChipsChoice<int>.single(
                      value: tag,
                      onChanged: (val) => setState(() => tag = val),
                      choiceItems: C2Choice.listFrom<int, String>(
                        source: globalvariables.options,
                        value: (i, v) => i,
                        label: (i, v) => v,
                        tooltip: (i, v) => v,
                        delete: (i, v) => () {
                          setState(() => globalvariables.options.removeAt(i));
                        },
                      ),
                      choiceStyle: C2ChipStyle.outlined(
                        borderOpacity: 0.3,
                        borderStyle: BorderStyle.solid,
                        color: Colors.black,
                        iconColor: const Color(0xffFF6368),
                        iconSize: 22,
                        // selectedStyle: C2ChipStyle.filled(
                        //     foregroundStyle: const TextStyle(
                        //         fontSize: 16.8,
                        //         fontFamily: 'Euclid',
                        //         color: Colors.white),
                        //     iconColor: Colors.white,
                        //     color: const Color(0xffFF6368)),
                        foregroundStyle: const TextStyle(
                            fontSize: 16.8,
                            fontFamily: 'Euclid',
                            color: Colors.black),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      wrapped: true,
                    ),
                  ],
                ),
              ),
            ),
        
           const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, top: 20),
                  child: Text(
                    'Available Shifts',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                )),
            //Available Shifts UI
            // AvailableShift(),
            // AvailableShift2(),
          ],
        ),
      ),
    );
  }
}

  //  Container(
  //                     width: size.width * 0.75,
  //                     height: 40,
  //                     decoration: BoxDecoration(
  //                       color: const Color(0XFFF4F7F9),
  //                       borderRadius: BorderRadius.circular(4),
  //                       boxShadow: const [
  //                         BoxShadow(
  //                           color: Colors.black45,
  //                           blurRadius: 1,
  //                           offset: Offset(0, 0),
  //                         ),
  //                       ],
  //                     ),
  //                     child: InkWell(
  //                       onTap: () {
  //                           focusNode.unfocus();
  //                     Navigator.pop(context);
  //                       },
  //                       child: TextField(
  //                         focusNode: focusNode,
  //                   controller: _searchTextController,
  //                   style: TextStyle(color: Colors.black),
  //                   autofocus: true,
  //                   textInputAction: TextInputAction.search,
  //                   keyboardType: TextInputType.text,
  //                   onEditingComplete: () async {
  //                     isSearching = true;
  //                     focusNode.unfocus();
  //                     setState(() {});
  //                   },
                      
  //                         decoration: const InputDecoration(
  //                           contentPadding: EdgeInsets.only(top: 8, bottom: 12),
  //                           border: InputBorder.none,
  //                           prefixIcon: Icon(
  //                             Icons.search,
  //                             size: 20,
  //                             color: Color(0XFFB7BAC2),
  //                           ),
  //                           suffixIcon: Icon(Icons.close,
  //                           size: 20,
  //                           ),
  //                           hintText: "Search",
  //                           hintStyle: TextStyle(
  //                             fontSize: 15,
  //                             color: Color(0XFFB7BAC2),
  //                           ),
  //                         ),
  //                          suffix: Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 5),
  //                       child: GestureDetector(
  //                         onTap: () {
  //                           _searchTextController.clear();
  //                           focusNode.unfocus();
  //                           isSearching = false;
  //                           // searchList =[];
  //                           // searchList!.clear();
  //                           setState(() {});
  //                         },
  //                         child: const Icon(
  //                           Icons.close,
  //                           size: 18,
  //                           color: Colors.red,
  //                         ),
  //                       ),
  //                     ),
                    
  //                       ),
  //                     ),
  //                   ),
                   