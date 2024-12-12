import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';
import 'package:islami_app/home/tabs/quran_tabs/sura_content_line_by_line.dart';
import 'package:islami_app/home/tabs/quran_tabs/sura_details.dart';
import 'package:islami_app/home/tabs/quran_tabs/suras_list.dart';
import 'package:islami_app/models/sura_model.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/bar.png"),
          TextField(
            cursorColor: AppColor.white,
            decoration: InputDecoration(
                hintText: "  Sura Name",
                hintStyle: TextStyle(
                  color: AppColor.white,
                ),
                prefixIcon: ImageIcon(
                    color: AppColor.gold,
                    AssetImage(
                      "assets/images/search_icon.png",
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColor.gold, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColor.gold, width: 2))),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Most Recently",
            style: TextStyle(color: AppColor.white, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.gold,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("Sura Arabic", 24),
                    text("Sura English", 24),
                    text("Verses Count", 14)
                  ],
                ),
                Image.asset("assets/images/quran3.png")
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Suras List",
            style: TextStyle(color: AppColor.white, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 2,
                  indent: 45,
                  endIndent: 35,
                );
              },
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Display view"),
                              content: Text("Choose your preferred view"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pushNamed(
                                          Sequential.routeName,
                                          arguments:
                                              SuraModel.getSuraModel(index));
                                    },
                                    child: Text("Sequentially")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pushNamed(
                                          SuraDetailsScreen.routeName,
                                          arguments:
                                              SuraModel.getSuraModel(index));
                                    },
                                    child: Text("One aya per line"))
                              ],
                            );
                          });
                    },
                    child: SurasList(suraModel: SuraModel.getSuraModel(index)));
              },
              itemCount: SuraModel.getSuraItemCount(),
            ),
          ))
        ],
      ),
    );
  }

  Widget text(String text, double font) {
    return Text(
      text,
      style: TextStyle(
        fontSize: font,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
