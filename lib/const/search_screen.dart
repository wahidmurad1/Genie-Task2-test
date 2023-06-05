import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genie_task/const/global_variable.dart';
import 'package:genie_task/const/suggestion.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchTextController;
  late final FocusNode focusNode;
  int tag=0;
  bool isIconVisible = false;
  //GlobalVariables globalvariables = GlobalVariables();


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
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: (value){
          globalvariables.addData(value);
          if(globalvariables.options.isNotEmpty){
            globalvariables.isVisible = true;
            _searchTextController.clear();
          }
            else{
              globalvariables.isVisible = false;
          }
        },
        focusNode: focusNode,
        controller: _searchTextController,
        style: TextStyle(color: Colors.black),
        autofocus: true,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        onEditingComplete: () async {
          isSearching = true;
          focusNode.unfocus();
          setState(() {});
        },
        onChanged: (v) {
            if(v.toString().trim()==''){
            setState(() {
              isIconVisible = false;
            });
          }
          else if (v.isNotEmpty) {
            setState(() {
              isIconVisible = true;
            });
          } 
        
          else {
            setState(() {
              isIconVisible = false;
            });
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            bottom: 8 / 5,
          ),
          hintText: "Search",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffix: !isIconVisible
              ? null
              : GestureDetector(
                  onTap: () {
                    focusNode.unfocus();
                    isSearching = false;
                    setState(() {
                      _searchTextController.clear();
                    });
                  },
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
        ),
      ),
    );
  }
}
