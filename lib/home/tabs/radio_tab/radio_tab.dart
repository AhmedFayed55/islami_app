import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  List<String> shiekhs = [
    "Ali Mahmoud",
    "Muhammad Rifaat",
    "Muhammad Ahmed Shabib",
    "Abdel Fattah Al-Shasha’i",
    "Mahmoud Ali Al-Banna",
    "Abdel Basset Abdel Samad",
    "Muhammad Siddiq Al-Minshawi",
  ];
  List<String> radios = [
    "Ahl al-Qur’an",
    "Saad Al-Ghamdi",
    "Abu Bakr Al-Shatri",
    "Al-Ruqyah Sharia",
    "Al-Ruqyah Sharia",
    "Al-Ruqyah Sharia",
    "Al-Ruqyah Sharia",
  ];
  int selectedIndex = 0;

  List<bool> isFavoriteRadio = List.filled(7, false);
  List<bool> isPlayingRadio = List.filled(7, false);
  List<bool> isVolumeOnRadio = List.filled(7, true);

  List<bool> isFavoriteReciters = List.filled(7, false);
  List<bool> isPlayingReciters = List.filled(7, false);
  List<bool> isVolumeOnReciters = List.filled(7, true);

  String background2 = "assets/images/sound_wave.png";

  @override
  Widget build(BuildContext context) {
    List<bool> isFavorite =
        selectedIndex == 0 ? isFavoriteRadio : isFavoriteReciters;
    List<bool> isPlaying =
        selectedIndex == 0 ? isPlayingRadio : isPlayingReciters;
    List<bool> isVolumeOn =
        selectedIndex == 0 ? isVolumeOnRadio : isVolumeOnReciters;
    return Container(
      child: Column(
        children: [
          Image.asset("assets/images/bar.png"),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color:
                            selectedIndex == 0 ? AppColor.gold : AppColor.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Radio",
                      style: TextStyle(
                          color: selectedIndex == 0
                              ? AppColor.black
                              : AppColor.white,
                          fontSize: 15,
                          fontWeight: selectedIndex == 0
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color:
                            selectedIndex == 1 ? AppColor.gold : AppColor.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Reciters",
                      style: TextStyle(
                          color: selectedIndex == 1
                              ? AppColor.black
                              : AppColor.white,
                          fontSize: 15,
                          fontWeight: selectedIndex == 1
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 10, left: 17, right: 17),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(background2),
                        fit: BoxFit.cover,
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        selectedIndex == 0 ? radios[index] : shiekhs[index],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorite[index] = !isFavorite[index];
                              });
                            },
                            icon: Icon(
                              isFavorite[index]
                                  ? Icons.favorite
                                  : Icons.favorite_outline_outlined,
                              size: 35,
                            ),
                            color: AppColor.black,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isPlaying[index] = !isPlaying[index];
                              });
                            },
                            icon: Icon(
                              isPlaying[index]
                                  ? Icons.pause_circle_outline
                                  : Icons.play_circle,
                              size: 40,
                            ),
                            color: AppColor.black,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isVolumeOn[index] = !isVolumeOn[index];
                              });
                            },
                            icon: Icon(
                              isVolumeOn[index]
                                  ? Icons.volume_up_rounded
                                  : Icons.volume_off,
                              size: 35,
                            ),
                            color: AppColor.black,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: shiekhs.length,
            ),
          )
        ],
      ),
    );
  }
}
