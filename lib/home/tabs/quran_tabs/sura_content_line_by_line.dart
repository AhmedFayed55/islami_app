import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/app_colors.dart';
import 'package:islami_app/models/sura_model.dart';

class Sequential extends StatefulWidget {
  static const String routeName = "Sequential";

  @override
  State<Sequential> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<Sequential> {
  List<String> verses = [];

  String ayat = "";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(args.index);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black,
        title: Text(
          args.suraEnName,
          style: TextStyle(color: AppColor.gold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.gold),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
              color: AppColor.black,
              child: Image.asset("assets/images/decoration_nv.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill)),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                args.suraArName,
                style: TextStyle(color: AppColor.gold, fontSize: 24),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColor.gold,
                      ))
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(left: 35, right: 35),
                            child: Text(
                              ayat,
                              // textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: AppColor.gold,
                                fontSize: 20,
                              ),
                            ),
                          );
                        },
                        itemCount: 1,
                      ),
              )
            ],
          )
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String suraContent =
        await rootBundle.loadString("assets/files/suras/${index + 1}.txt");
    List<String> suraLines = suraContent.split("\n");
    verses = suraLines;
    ayat = suraLines.asMap().entries.map((entry) {
      int index = entry.key;
      String verse = entry.value;
      return "$verse (${index + 1})";
    }).join(" ");

    setState(() {});
  }
}
