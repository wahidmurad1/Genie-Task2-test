import 'package:flutter/material.dart';

class Suggestion extends StatelessWidget {
 final String value;
  const Suggestion({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16).copyWith(bottom: 0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Container(
              width: 80,
              height: 25,
              decoration: BoxDecoration(
                color: const Color(0XFFF4F7F9),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 1,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      '$value',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0XFFFF6368),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 12,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
