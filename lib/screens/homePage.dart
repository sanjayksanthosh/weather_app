import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/services/api.dart';
import 'package:weather_app/widgets/myText.dart';

import '../constants/screenUtils.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
                    text: 'Kochi',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  MyText(text: 'Today'),
                ],
              ),
              Image.asset(
                'assets/icons/cloudy.png',
                width: 100,
                height: 100,
              ),
              Text(
                '23',
                style: GoogleFonts.notoSans(
                    fontSize: 100, fontWeight: FontWeight.bold),
              ),
              Text('Mostly cloudy', style: GoogleFonts.notoSans(fontSize: 30)),
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
                      Text('9m/s'),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    fetchData();
                  },
                  child: MyText(
                    text: 'Get Data',
                  )),
            ]),
      )),
    );
  }
}
