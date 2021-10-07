import 'package:flutter/material.dart';
import 'package:fluttermeal/database/moor_database.dart';

class DetailActivity extends StatefulWidget {
  const DetailActivity({
    Key? key,
    required this.title,
    required this.desc,
    required this.img,
    required this.id,
  }) : super(key: key);

  final String title;
  final String desc;
  final String img;
  final String id;

  @override
  _DetailActivityState createState() => _DetailActivityState();
}

class _DetailActivityState extends State<DetailActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
        children: [
          StreamBuilder(
              stream: AppDatabase().getbyId(int.parse(widget.id)),
              builder: (context, AsyncSnapshot<Food> snapshot) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        widget.img,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      snapshot.data != null
                          ? GestureDetector(
                              onTap: () => {
                                    AppDatabase().deleteFood(Food(
                                        id: int.parse(widget.id),
                                        title: widget.title,
                                        desc: widget.desc,
                                        img: widget.img)),
                                    setState(() {})
                                  },
                              child:
                                  const Icon(Icons.favorite, color: Colors.red))
                          : GestureDetector(
                              onTap: () => {
                                    AppDatabase().insertNew(Food(
                                        id: int.parse(widget.id),
                                        title: widget.title,
                                        desc: widget.desc,
                                        img: widget.img)),
                                    setState(() {})
                                  },
                              child: const Icon(Icons.favorite_border,
                                  color: Colors.red)),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(widget.title,
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(widget.desc,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          )),
                    ],
                  ),
                );
              }),
        ],
      )),
    );
  }
}
