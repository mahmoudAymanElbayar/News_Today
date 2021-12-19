import 'package:news_today/layout/news_layout/news_cubit.dart';
import 'package:news_today/medules/news_screen/search_screen/search_screen.dart';
import 'package:news_today/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_today/layout/news_layout/news_states.dart';
import 'cubit_main.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News app'),
            actions: [
              IconButton(icon: const Icon(Icons.search),
                onPressed: (){
                goTO(context, SearchScreen());
                },
              ),
              IconButton(icon: const Icon(Icons.brightness_4_outlined),
                onPressed: (){
                MainCubit.get(context).changeAppTheme();
                },
              )

            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavItem,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            currentIndex: cubit.currentIndex,
          ),
          body: cubit.currentScreen[cubit.currentIndex],
        );
      },);
  }
}
