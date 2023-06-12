import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_task/screens/home_screen.dart';
import 'package:genie_task/screens2/home_screen2.dart';
import 'package:genie_task/screens2/login_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  //RxBool iconVisible = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginUser() async {
    String Link = "https://dev-api.limadi.dk/api/v1/auth/login";
    var data = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    print(data);
    final value = json.encode(data);
    var urlParse = Uri.parse(Link);
    var response = (await http.Client().post(urlParse,
        body: (value),
        headers: {'content-type': 'application/json', 'app-role': 'company'}));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to(() => HomeScreen2());
      Fluttertoast.showToast(msg: "Login Successful");
    } else {
      Get.to(() => LoginScreen());
      Fluttertoast.showToast(msg: "Login Failed");
    }
    update();
  }
}
