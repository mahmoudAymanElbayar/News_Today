import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_today/shared/bloc_observer/block_observer.dart';
import 'package:news_today/shared/network/local/cache_helper.dart';
import 'package:news_today/shared/network/remote/dio_helper.dart';
import 'layout/news_layout/cubit_main.dart';
import 'layout/news_layout/news_cubit.dart';
import 'layout/news_layout/news_layout.dart';
import 'layout/news_layout/states_main.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  // Use cubits...
  DioHelper.init();
  await CacheHelper.init();
  var isDark=CacheHelper.getBoolean(key: 'isDark')??false;
  runApp(MyApp(isDark));
}
class MyApp extends StatelessWidget{
  final bool isDark;
  const MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusinessData(),),
        BlocProvider(create: (context)=>MainCubit()..changeAppTheme(fromShared: isDark
        ),
        ),
      ],
      child: BlocConsumer<MainCubit,MainStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.orange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark
                  ),
                  iconTheme: IconThemeData( /*momken ne8aiar fe l icon bera7tna*/),
                  color: Colors.white,
                  elevation: 0.0,
                  centerTitle: true,
                  titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                ),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.orange
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    //backgroundColor: Colors.orange,
                    selectedItemColor: Colors.orange,
                    elevation: 50.0
                ),
                textTheme: const TextTheme(
                  bodyText2:TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                  ),
                  bodyText1:TextStyle(
                    color: Colors.grey,
                  ),
                )
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.orange,
              scaffoldBackgroundColor: HexColor('272829'),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('1F1A19'),
                    statusBarIconBrightness: Brightness.light
                ),
                iconTheme: const IconThemeData( color: Colors.white/*momken ne8aiar fe l icon bera7tna*/),
                color: HexColor('1F2021'),
                elevation: 0.0,
                centerTitle: true,
                titleTextStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.orange
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(

                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor('1F2021'),
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.grey,
                  elevation: 50.0
              ),
              textTheme: const TextTheme(
                bodyText2:TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                ),
                bodyText1:TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            themeMode: MainCubit.get(context).isdark? ThemeMode.dark:ThemeMode.light,
            home: const NewsApp(),
          );
        },
      ),
    );
  }

}