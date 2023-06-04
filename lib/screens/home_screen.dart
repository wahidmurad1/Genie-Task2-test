import 'package:flutter/material.dart';
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
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
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
                        width: 280,
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
              //Suggestion box After the search box
              // Suggestion(),
              // Suggestion2(),
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
                   