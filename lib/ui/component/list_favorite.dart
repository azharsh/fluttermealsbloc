import 'package:flutter/material.dart';
import 'package:fluttermeal/model/food_response.dart';
import 'package:fluttermeal/database/moor_database.dart';

import '../detail_activity.dart';

class ListFavorite extends StatefulWidget {
  const ListFavorite({Key? key}) : super(key: key);

  @override
  _ListFavoriteState createState() => _ListFavoriteState();
}

class _ListFavoriteState extends State<ListFavorite> {
  var listFood = <Meals>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
            stream: AppDatabase().watchAll(),
            builder: (context, AsyncSnapshot<List<Food>> snapshot) {
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(snapshot.data!.length, (index) {
                  var item = snapshot.data![index];
                  return Container(
                      height: double.infinity,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailActivity(
                                    title: item.title,
                                    desc: item.desc,
                                    img: item.img,
                                    id: item.id.toString()),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Image.network(
                                item.img,
                                height: 145,
                              ),
                              Text(item.title)
                            ],
                          )));
                }),
              );
            }));
  }
}
