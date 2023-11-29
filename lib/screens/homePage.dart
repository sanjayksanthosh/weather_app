import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/services/api.dart';
import 'package:weather_app/widgets/myText.dart';

import '../constants/screenUtils.dart';
import '../models/weatheModel.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();



}

class _HomePageState extends State<HomePage> {
   Weather? model;


   @override
   void initState() {
     super.initState();
     fetchData();
   }

  Future<void> fetchData() async {
    try {
      Weather fetchedModel = await WeatherData.fetchData();
      setState(() {
        model = fetchedModel;
      });
      print('country : ${model?.location.country}');
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = ScreenUtil.screenWidth(context);
    double height = ScreenUtil.screenHeight(context);

    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
          child: Container(
        height: height / 1.8,
        width: width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  MyText(
                    text: model?.location.name,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  MyText(text: 'Today'),
                ],
              ),
              Image.network(
                "http:"+model!.current.condition.icon,
                width: 150,
                height: 150,fit: BoxFit.cover,
              ),
              Text(
                model!.current.feelslikeC.toString(),
                style: GoogleFonts.notoSans(
                    fontSize: 100, fontWeight: FontWeight.bold),
              ),
              Text(model!.current.condition.text, style: GoogleFonts.notoSans(fontSize: 30)),
              Column(
                children: [
                  Text('Wind', style: GoogleFonts.notoSans()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/wind.png',
                          width: 35, height: 40),
                      SizedBox(
                        width: 20,
                      ),
                      Text(model!.current.gustKph.toString()+'kph'),
                    ],
                  ),
                ],
              ),
              // ElevatedButton(
              //     onPressed: () {
              //     },
              //     child: MyText(
              //       text: 'Get Data',
              //     )),
            ]),
      )),
    );
  }
}
