class GlobalVariables {
  static final _globalvariables = GlobalVariables._internal();

  List<String> options = [];

  bool isVisible = false;

  List<String> licenseNo = [
    "Toyota/97-666",
    "Toyota/122476",
    "Toyota/552738",
    "Toyota/ABC827838"
  ];

  List<String> driver = ["Peter Griffin", "Stewie", "Glen Quagmire", "dfnds"];

  void addData(String newData) {
    //options.clear();
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
