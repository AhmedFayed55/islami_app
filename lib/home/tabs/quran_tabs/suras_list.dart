import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';
import 'package:islami_app/models/sura_model.dart';

class SurasList extends StatelessWidget {
  SuraModel suraModel;

  SurasList({required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/shape.png"),
            Text(
              "${suraModel.index + 1}",
              style: TextStyle(color: AppColor.white),
            )
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Column(
          children: [
            text(suraModel.suraEnName, 20),
            SizedBox(
              height: 7,
            ),
            text("${suraModel.ayasNum} Verses", 16),
          ],
        ),
        Spacer(),
        text(suraModel.suraArName, 20)
      ],
    );
  }

  Widget text(String text, double font) {
    return Text(
      text,
      style: TextStyle(
        fontSize: font,
        color: AppColor.white,
      ),
    );
  }
}
