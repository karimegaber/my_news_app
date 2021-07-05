import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/cubit/news_states.dart';
import 'package:my_news_app/modules/business_screen/business_screen.dart';
import 'package:my_news_app/modules/developer_screen/developer_screen.dart';
import 'package:my_news_app/modules/science_screen/science_screen.dart';
import 'package:my_news_app/modules/sports_screen/sports_screen.dart';
import 'package:my_news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    DeveloperScreen(),
  ];

  List<dynamic> business = [];

  List<dynamic> sports = [];

  List<dynamic> science = [];

  List<dynamic> search = [];

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.code),
      label: 'Developer',
    ),
  ];

  void changeBottomNavBarIndex(index) {
    currentIndex = index;

    if (currentIndex == 1)
      getSportsData();
    else if (currentIndex == 2) getScienceData();

    emit(ChangeBottomNavBarIndexState());
  }

  void getBusinessData() {
    if (business.isEmpty) {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        business = value.data['articles'];
        emit(NewsGetBusinessDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessDataErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessDataSuccessState());
    }
  }

  void getSportsData() {
    if (sports.isEmpty) {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsDataErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsDataSuccessState());
    }
  }

  void getScienceData() {
    if (science.isEmpty) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceDataErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceDataSuccessState());
    }
  }

  void getSearchData(String seachedWord) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$seachedWord',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchDataErrorState(error.toString()));
    });
  }
}
