
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_today/layout/news_layout/news_cubit.dart';
import 'package:news_today/layout/news_layout/news_states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
 // const WebViewScreen({Key? key, this.url}) : super(key: key);
  final String url;
  const WebViewScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
            appBar: AppBar(),
            body: state is LoadingSearchScreenState? const CircularProgressIndicator(): WebView(
              initialUrl: url,
            )
        );
      },
    );
  }
}
