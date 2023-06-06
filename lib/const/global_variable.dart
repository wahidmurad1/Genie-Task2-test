import 'dart:math';

class GlobalVariables {
  static final _globalvariables = GlobalVariables._internal();

  List<String> options = [];

  bool isVisible = false;
  List<Map<String, dynamic>> allUser = [
    {
      "image": 'assets/images/user.png',
      "name": 'Piter',
      "number": 'A0/0100',
      "time": '11 June 2023 8:00'
    },
    {
      "image": 'assets/images/user.png',
      "name": 'Glen',
      "number": 'A0/0100',
      "time": '11 June 2023 8:00'
    },
    {
      "image": 'assets/images/user.png',
      "name": 'Marry',
      "number": 'A0/0100',
      "time": '11 June 2023 8:00'
    },
    {
      "image": 'assets/images/user.png',
      "name": 'David',
      "number": 'A0/0100',
      "time": '11 June 2023 8:00'
    },
    {
      "image": 'assets/images/user.png',
      "name": 'Morgan',
      "number": 'A0/0100',
      "time": '11 June 2023 8:00'
    },
  ];
  //when chip exists and search then search a found list and when clear the list then search same found list if cheap clear then show the full list
  List<Map<String, dynamic>> foundUsers = [];
  List<Map<String, dynamic>> result = [];
  void runFilter(String enteredKeyword) {
    //print(enteredKeyword);
    if (options.isEmpty) {
      print(enteredKeyword);
      if (enteredKeyword.toString().trim() == '') {
        foundUsers = allUser;
        result = foundUsers;
      } else {
        foundUsers = allUser
            .where((user) => user["name"]
                .toString()
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        result = foundUsers;
      }
    } else {
      print(enteredKeyword);
      if (enteredKeyword.toString().trim() == '') {
        foundUsers = result;
      } else {
        foundUsers = foundUsers
            .where((user) => user["name"]
                .toString()
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
    }

    print(result);
    // setState(() {
    //   _foundUsers = result;
    //   //in onChanged (v) => _runFilter(v),
    // else if (enteredKeyword.isEmpty) {
    //   result = allUser;
    // }
    //   else if (isVisible == true) {
    //     foundUsers = foundUsers
    //         .where((user) => user["name"]
    //             .toString()
    //             .toLowerCase()
    //             .contains(enteredKeyword.toLowerCase()))
    //         .toList();
    //   }
    // });
  }
  //

  //List<String> driver = ["Peter Griffin", "Stewie", "Glen Quagmire", "dfnds"];

  void addData(String newData) {
    options.clear();
    //options.add(newData);
    if (newData.toString().trim() != '') {
      options.add(newData.toString().trim());
    }

    //print(options[0]);
  }

//Replace data
  // void ReplaceData(String newData) {
  //   if (newData.toString().trim() == '') {
  //     options.clear();
  //   } else {
  //     options.clear();
  //     options.add(newData);
  //   }
  // }

  void clearData() {
    options.clear();
  }

  factory GlobalVariables() {
    return _globalvariables;
  }
  GlobalVariables._internal();
}

final globalvariables = GlobalVariables();
