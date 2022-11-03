import 'package:fake_amazon/article_screen.dart';
import 'package:fake_amazon/core/article_repository.dart';
import 'package:fake_amazon/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Article>>(
        future: ArticleRepository().getArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final value = snapshot.data![index];
                  return GestureDetector(
                    child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(children: [
                              Image.network(
                                value.image,
                                height: 150,
                                width: 150,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: SizedBox(
                                  width: 189,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                                        child: Text(
                                          value.title,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontFamily: 'Amazon', fontSize: 15),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      // Text(
                                      //   value.description,
                                      //   maxLines: 2,
                                      //   style: const TextStyle(
                                      //       fontFamily: 'Amazon', fontSize: 15),
                                      //   overflow: TextOverflow.ellipsis,
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                                        child: Row(
                                          children: [
                                            RatingBarIndicator(
                                              rating: value.rating.rate,
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 18.0,
                                              direction: Axis.horizontal,
                                            ),
                                            Text(value.rating.count.toString())
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                                        child: Text(
                                            '${NumberFormat("####0.00", "fr_FR").format(value.price)}€',
                                            style: const TextStyle(
                                                fontSize: 25)
                                            //overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                      
                                      (value.category.length < 13) ? Row(
                                        children: [
                                          Image.asset("assets/images/prime.png", width: 45),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 3.0),
                                            child: Text("GRATUIT Livraison en 1 jour", style: TextStyle(fontSize: 12, letterSpacing: -0.5),),
                                          )
                                        ],
                                      ):Container()
                                    ],
                                  ),
                                ),
                              )
                            ]))),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleScreen(article: value)));
                    },
                  );
                });
          } else {
            return Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[300]!,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 100,
                    width: 200,
                  ),
                ));
          }
        },
      ),
    );
  }
}
