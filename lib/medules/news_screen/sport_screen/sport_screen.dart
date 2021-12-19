import 'package:news_today/layout/news_layout/news_cubit.dart';
import 'package:news_today/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_today/layout/news_layout/news_states.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: ( context , state){
        },
        builder: (context,state){
          var list = NewsCubit.get(context).sportList;
          return
            state is! LoadingSportScreenState? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>itemNewsAppArticle(list[index],context),
                separatorBuilder: (context,index)=>myLineSeperated(),
                itemCount: list.length)
                :const Center(child: CircularProgressIndicator());
        }
    );  }
}
