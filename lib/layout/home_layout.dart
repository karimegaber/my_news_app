import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/cubit/news_cubit.dart';
import 'package:my_news_app/cubit/news_states.dart';
import 'package:my_news_app/cubit2/app_cubit.dart';
import 'package:my_news_app/modules/search_screen/search_screen.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    SearchScreen.searchScreenRoute,
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
                onPressed: () {
                  AppCubit.get(context).changeAppMode();
                },
              ),
            ],
          ),
          body: NewsCubit.get(context)
              .screens[NewsCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: NewsCubit.get(context).currentIndex,
            items: NewsCubit.get(context).bottomNavBarItems,
            onTap: (index) {
              NewsCubit.get(context).changeBottomNavBarIndex(index);
            },
          ),
        );
      },
    );
  }
}
