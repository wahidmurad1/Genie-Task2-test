import 'dart:ui';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genie_task/const/global_variable.dart';
import 'package:genie_task/const/suggestion.dart';

class SearchScreen extends StatefulWidget {
  final ValueChanged<String>? onSubmit;
  final TextEditingController searchTextController;
  final IconData? icon;
  const SearchScreen(
      {Key? key, this.onSubmit, required this.searchTextController, this.icon})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // late final TextEditingController _searchTextController;
  // late final FocusNode focusNode;
  int tag = 0;
  bool isIconVisible = false;
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 280,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0XFFD1D5DB)),
        ),
        child: TextField(
          onSubmitted: widget.onSubmit,
          // focusNode: focusNode,
          controller: widget.searchTextController,
          style: TextStyle(color: Colors.black),
          autofocus: true,
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
          onEditingComplete: () async {
            isSearching = true;
            // focusNode.unfocus();
            setState(() {});
          },
          onChanged: (v) {
            if (v.toString().trim() == '') {
              setState(() {
                isIconVisible = false;
              });
            } else if (v.isNotEmpty) {
              setState(() {
                isIconVisible = true;
              });
            } else {
              setState(() {
                isIconVisible = false;
              });
            }
          },
          decoration: InputDecoration(
            //contentPadding: EdgeInsets.only(top: 8, bottom: 12),
            // enabledBorder: OutlineInputBorder.none,
            hintText: "Search",
            contentPadding: EdgeInsets.fromLTRB(
              12,
              6,
              10,
              12,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
            ),
            suffix: !isIconVisible
                ? null
                : GestureDetector(
                    onTap: () {
                      isSearching = false;
                      setState(() {
                        widget.searchTextController.clear();
                        //isIconVisible=false;
                      });
                    },
                    child: Icon(
                      widget.icon,
                      size: 18,
                      color: Colors.red,
                    ),
                  ),
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}


//  decoration: const InputDecoration(
//                             contentPadding: EdgeInsets.only(top: 8, bottom: 12),
//                             border: InputBorder.none,
//                             prefixIcon: Icon(
//                               Icons.search,
//                               size: 20,
//                               color: Color(0XFFB7BAC2),
//                             ),
//                             hintText: "Search",
//                             hintStyle: TextStyle(
//                               fontSize: 15,
//                               color: Color(0XFFB7BAC2),
//                             ),
//                           ),