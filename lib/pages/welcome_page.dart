import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/my_widgets/app_large_text.dart';
import 'package:flutter_cubit/my_widgets/app_text.dart';
import 'package:flutter_cubit/my_widgets/responsive_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("img/" + images[index]),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Mountain", size: 30),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: AppText(
                          text:
                              "Mountain hikes give you an incredible sense of freedom along with endurance test",
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context).getData();
                        },
                        child: SizedBox(
                          width: 200,
                          child: Row(
                            children: [
                              ResponsiveButton(
                                width: 180,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                      children: List.generate(3, (indexDots) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots
                            ? AppColors.mainColor
                            : AppColors.mainColor.withOpacity(.5),
                      ),
                      width: 8,
                      height: index == indexDots ? 25 : 8,
                    );
                  })),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
