import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/modules/web_view_screen/web_view_screen.dart';

Widget buildArticleItem(article, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WebViewScreen(article['url'])),
      );
    },
    child: Container(
      height: 120.0,
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                  onError: (x, y) {}),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  '${article['description']}',
                  style: Theme.of(context).textTheme.bodyText2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget articlesScreenBuilder(list, context) {
  return ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) {
      return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => SizedBox(
          height: 10.0,
        ),
        itemCount: list.length,
      );
    },
    fallback: (context) => Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget defaultTextEditing({
  @required TextEditingController controller,
  @required TextInputType type,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  bool isPassword = false,
  Function onChanged,
  Function onSubmitted,
  Function onShowPassword,
  Function validator,
  Function onTap,
  BuildContext context,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyText1,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
          icon: Icon(suffix),
          onPressed: onShowPassword,
        ),
      ),
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      onTap: onTap,
    );

Widget contactInformation({
  @required Color mainColor,
  @required String socialName,
  @required Color socialColor,
  @required Color infoColor,
  @required String infoText,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 70.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
        ),
        child: Center(
          child: Text(
            socialName,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: socialColor,
            ),
          ),
        ),
      ),
      Container(
        width: 200.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: infoColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        child: Center(
          child: Text(
            infoText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    ],
  );
}
