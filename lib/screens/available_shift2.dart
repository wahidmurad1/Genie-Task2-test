import 'package:flutter/material.dart';

class AvailableShift2 extends StatelessWidget {
  const AvailableShift2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
              .copyWith(bottom: 0),
          child: Container(
            height: 71,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0XFF2257AA),
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 7),
                    child: Image.asset(
                      'assets/images/user.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'David Morgan',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'AA 99 999',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '11.Jan 2023, 08.00-17:00',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
