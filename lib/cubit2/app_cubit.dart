import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/cubit/news_states.dart';
import 'package:my_news_app/shared/network/local/chache_helper.dart';

class AppCubit extends Cubit<NewsStates> {
  AppCubit() : super(AppCubitInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsAppModeChanged());
    } else {
      isDark = !isDark;
      CacheHelper.putModeData(key: 'mode', value: isDark).then((value) {
        emit(NewsAppModeChanged());
      });
    }
  }
}
