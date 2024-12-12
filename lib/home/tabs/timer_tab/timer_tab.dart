import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';

class TimerTab extends StatelessWidget {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 14, end: 14),
      child: Column(
        children: [
          Image.asset("assets/images/bar.png"),
          Container(
            decoration: BoxDecoration(
                color: AppColor.brown, borderRadius: BorderRadius.circular(40)),
            child: Stack(
              children: [
                Image.asset("assets/images/times_background.png"),
                Padding(
                  padding:
                      EdgeInsetsDirectional.only(start: 18, end: 18, top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text("16 Jul,\n2024", 16),
                      Column(
                        children: [
                          Text(
                            "Prayer Time",
                            style: TextStyle(
                                color: Color(0xB5202020),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Tuesday",
                            style: TextStyle(
                                color: Color(0xE6202020),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      text("09 Muh,\n1446", 16),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 50,
                  child: SizedBox(
                    height: 160,
                    child: ListView.separated(
                      controller: PageController(initialPage: 1000),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        bool isCenterBox = index == selectedIndex;

                        return Container(
                          width: isCenterBox ? 120 : 80,
                          height: isCenterBox ? 100 : 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset("assets/images/sdsdsd.png"),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    index == 0
                                        ? "Fajr"
                                        : index == 1
                                            ? "Dhuhr"
                                            : index == 2
                                                ? "ASR"
                                                : index == 3
                                                    ? "Maghrib"
                                                    : "Isha",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "04:38\nPM",
                                    style: TextStyle(
                                      fontSize: isCenterBox ? 22 : 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 10);
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget text(String text, double font) {
    return Text(
      text,
      style: TextStyle(fontSize: font, color: Color(0xFFFFFFFF)),
    );
  }
}