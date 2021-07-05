import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/cubit/news_cubit.dart';
import 'package:my_news_app/cubit/news_states.dart';
import 'package:my_news_app/shared/components/components.dart';
import 'package:my_news_app/shared/network/local/chache_helper.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  static String searchScreenRoute = '/search';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    style: TextStyle(
                      color: CacheHelper.getModeData(key: 'mode')
                          ? Colors.white
                          : Colors.black,
                    ),
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter a word to search.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      NewsCubit.get(context).getSearchData(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: articlesScreenBuilder(list, context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
