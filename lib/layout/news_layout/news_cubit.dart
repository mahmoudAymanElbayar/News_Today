
import 'package:bloc/bloc.dart';
import 'package:news_today/layout/news_layout/news_states.dart';
import 'package:news_today/medules/news_screen/business_screen/business_screen.dart';
import 'package:news_today/medules/news_screen/science_screen/science_screen.dart';
import 'package:news_today/medules/news_screen/sport_screen/sport_screen.dart';
import 'package:news_today/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super (InitialNewsState());
 static NewsCubit get(context)=> BlocProvider.of(context);
   int currentIndex = 0;
 List<BottomNavigationBarItem> bottomNavItem = [
   const BottomNavigationBarItem(icon: Icon(Icons.business),label: 'business'),
   const BottomNavigationBarItem(icon: Icon(Icons.science),label: 'science'),
   const BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'sport'),
 ];
  void changeBottomNav(int index){
    currentIndex = index ;
    if(index==1) getScienceData();
    if(index==2) getSportData();
    emit(ChangeBottomSheetScreenState());
  }
  List <Widget> currentScreen = [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
  ];
  List <dynamic> businessList = [];
  void getBusinessData(){
    emit(LoadingBusinessScreenState());
    DioHelper.getData(
    url:'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'e16a960bae9d404aaaaae6bfad2f61d3'
        }
    ).then((value) {
      businessList = value.data['articles'];
      print(businessList[0]['title']);
      print(businessList.length);
      emit(BusinessGetDataSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(BusinessGetDataErrorState(onError.toString()));
    });
  }
  List <dynamic> scienceList = [];
  void getScienceData(){
    emit(LoadingScienceScreenState());
    if (scienceList.length==0){
      DioHelper.getData(
          url:'v2/top-headlines' ,
          query: {
            'country':'eg',
            'category':'science',
            'apiKey': 'e16a960bae9d404aaaaae6bfad2f61d3'
          }
      ).then((value) {
        scienceList = value.data['articles'];
        print(scienceList[0]['title']);
        print(scienceList.length);
        emit(ScienceGetDataSuccessState());
      }).catchError((onError){
        print(onError.toString());
        emit(ScienceGetDataErrorState(onError.toString()));
      });
    }else{
      emit(ScienceGetDataSuccessState());
    }
  }
  List <dynamic> sportList = [];
  void getSportData(){
    emit(LoadingSportScreenState());
    if(sportList.length==0){

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sport',
            'apiKey':'e16a960bae9d404aaaaae6bfad2f61d3'}).then((value) {
        sportList = value.data['articles'];
        print(sportList.length);
        emit(SportGetDataSuccessState());
      }).catchError((onError){
        emit(SportGetDataErrorState(onError.toString()));
      });
    }else{
      emit(SportGetDataSuccessState());
    }
  }
  List <dynamic> searchList = [];
  void getSearchData(String value){
    emit(LoadingSearchScreenState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':value,
          'apiKey':'e16a960bae9d404aaaaae6bfad2f61d3',
    }
    ).then((value) {
      searchList = value.data['articles'];
      print(searchList.length);
      emit(SearchGetDataSuccessState());
    }).catchError((onError){
      emit(SearchGetDataErrorState(onError));
    });
  }
}