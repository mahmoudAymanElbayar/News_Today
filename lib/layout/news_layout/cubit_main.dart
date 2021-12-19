
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_today/layout/news_layout/states_main.dart';
import 'package:news_today/shared/network/local/cache_helper.dart';

class MainCubit extends Cubit<MainStates>{
  MainCubit():super(InitMainState());
  bool isdark= false;
  static MainCubit get(context)=>BlocProvider.of(context);
  void changeAppTheme({bool? fromShared}){
    if(fromShared != null){
      isdark = fromShared;
      emit(ChangeThemeMode());

    }else{
      isdark =! isdark;
      CacheHelper.putBoolean(key: 'isDark', value: isdark).then((value) {
        emit(ChangeThemeMode());
      });
    }


  }
}