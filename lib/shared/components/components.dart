import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_today/medules/news_screen/webview_screen/web_view.dart';

Widget defultButton({
  required VoidCallback function,
  required String text,
  double width = double.infinity,
  Color backgroundColor = Colors.lightBlueAccent,
  bool isUbberCase = true,
  double radius = 0,

  // required void Function() function,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUbberCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );

Widget defultTextfeild({
  required String? Function(String?) validate,
  required TextEditingController controller,
  required TextInputType inputType,
  required String lableText,
  required IconData prefixicon,
  VoidCallback? showpassword,
  IconData? suffex,
  Function(String)? onFieldSubmitted,
  Function(String)? onChanged,
  bool isobscure = false,
  VoidCallback? onTap,
  Color? lableColor,
  Color? fillolor,
  Color? focuseColor,
  Color? hoverColors
}) =>
    TextFormField(
      controller: controller,
      obscureText: isobscure,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validate,
      onTap: onTap,
      keyboardType: inputType,
      decoration: InputDecoration(
        fillColor: fillolor,
        focusColor: focuseColor,
        hoverColor: hoverColors,
        labelText: lableText,
        labelStyle: TextStyle(color: lableColor),
        prefixIcon: Icon(prefixicon),
        suffix: suffex != null
            ? IconButton(onPressed: showpassword, icon: Icon(suffex))
            : null,
        border: const OutlineInputBorder(),
      ),
    );
// (value){
// if(value!.isEmpty) {
// return 'email mest not be empty';
// };
// return null;
// },
Widget textFormFeild({
  required TextEditingController controller,
  VoidCallback? ontap,
  Function(String)? onchange,
  Function(String)? onsubmit,
  bool isObscure = false,
  required IconData prefix,
  required String lable,
  IconData? suffix,
  required TextInputType inputType,
  required String? Function(String?) validate,
}) =>
    TextFormField(
      controller: controller,
      validator: validate,
      onTap: ontap,
      onChanged: onchange,
      onFieldSubmitted: onsubmit,
      obscureText: isObscure,
      keyboardType: inputType,
      decoration: InputDecoration(
          label: Text(lable),
          prefix: Icon(prefix),
          suffix: Icon(suffix),
          border: const OutlineInputBorder()),
    );
/////////////////////////////////////////
Widget itemNewsAppArticle(article,context)=>InkWell(
  onTap: (){
    goTO(context, WebViewScreen(article['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover
              )
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: SizedBox(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${article['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2
                  ),
                ),
                const SizedBox(height: 10,),
                Text('${article['publishedAt']}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        )
      ],
    ),

  ),
);

Widget myLineSeperated()=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8.0),
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);

void goTO(context,widget)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));

