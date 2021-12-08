import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/my_widgets/app_large_text.dart';
import 'package:flutter_cubit/my_widgets/app_text.dart';
import 'package:flutter_cubit/my_widgets/circle_tab_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "hiking",
    "kayaking.png": "Kayking",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu text
              Container(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black54,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //discover text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Discover"),
              ),
              const SizedBox(
                height: 20,
              ),
              //tabbar
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: _tabController,
                    labelColor: Colors.black54,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                        color: AppColors.mainColor, radius: 4),
                    isScrollable: true,
                    tabs: const [
                      Tab(text: "Places"),
                      Tab(text: "Inspiration"),
                      Tab(text: "Emotions"),
                    ]),
              ),
              Container(
                height: 300,
                width: double.maxFinite,
                padding: const EdgeInsets.only(left: 20),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: info.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubit>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/" +
                                          info[index].img),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    ),
                    const Text("data2"),
                    const Text("data3"),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              //Explore more
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Explore more",
                      size: 22,
                    ),
                    AppText(
                      text: "See all",
                      color: AppColors.textColor1,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //explore list
              Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "img/" + images.keys.elementAt(index)),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text: images.values.elementAt(index),
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
