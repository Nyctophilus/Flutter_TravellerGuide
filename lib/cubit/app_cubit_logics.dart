import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/pages/details_page.dart';
import 'package:flutter_cubit/pages/nav_pages/main_page.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';

class AppCubicLogics extends StatefulWidget {
  const AppCubicLogics({Key? key}) : super(key: key);

  @override
  _AppCubicLogicsState createState() => _AppCubicLogicsState();
}

class _AppCubicLogicsState extends State<AppCubicLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomeScreen();
          }
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState) {
            return MainPage();
          }
          if (state is DetailState) {
            return DetailPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
