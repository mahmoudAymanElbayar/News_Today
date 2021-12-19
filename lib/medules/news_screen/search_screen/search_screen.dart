import 'package:news_today/layout/news_layout/news_cubit.dart';
import 'package:news_today/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_today/layout/news_layout/news_states.dart';
class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
      builder: (context,state){
          var list = NewsCubit.get(context).searchList;
          return Scaffold(
            appBar: AppBar(
              title: const Text('newsApp'),
            ),
            body: Container(
              padding: const EdgeInsetsDirectional.all(8.0),
              child: Column(
                children: [
                  defultTextfeild(
                    onChanged: (value){
                      NewsCubit.get(context).getSearchData(value);
                    },
                      validate: (String? value){
                        if(value!.isEmpty ){
                          return 'search must not be empty';
                        }else{
                          return null;
                        }
                      },
                      controller: searchController,
                      inputType: TextInputType.text,
                      lableText: 'search',
                      prefixicon: Icons.search),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index)=> itemNewsAppArticle(list[index], context),
                        separatorBuilder: (context,index)=> myLineSeperated(),
                        itemCount: list.length),
                  )
                ],
              ),
            ),
          );
      },
    );
  }
}
