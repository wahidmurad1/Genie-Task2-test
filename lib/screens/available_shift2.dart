import 'package:flutter/material.dart';
import 'package:genie_task/const/global_variable.dart';

class AvailableShift2 extends StatefulWidget {
  const AvailableShift2({Key? key}) : super(key: key);

  @override
  State<AvailableShift2> createState() => _AvailableShift2State();
}

class _AvailableShift2State extends State<AvailableShift2> {
  @override
  void initState() {
    globalvariables.foundUsers = globalvariables.allUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          itemCount: globalvariables.foundUsers.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                  .copyWith(bottom: 0),
              child: Column(
                children: [
                  Container(
                    height: 74,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0XFF2257AA),
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 7),
                          child: Image.asset(
                            globalvariables.foundUsers[index]["image"],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    globalvariables.foundUsers[index]["name"]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    globalvariables.foundUsers[index]["number"]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    globalvariables.foundUsers[index]["time"]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 61,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0XFFF89818),
                                borderRadius: BorderRadius.circular(4).copyWith(
                                  topLeft: Radius.zero,
                                  bottomLeft: Radius.zero,
                                  bottomRight: Radius.zero,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Status',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
