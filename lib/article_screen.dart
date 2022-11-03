import 'package:fake_amazon/dropdown_button.dart';
import 'package:fake_amazon/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        backgroundColor: Colors.teal.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(article.category, style: const TextStyle(color: Color.fromARGB(255, 81, 128, 116)),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 4, child: Text(article.title)),
                Flexible(
                  flex: 1,
                  child: RatingBarIndicator(
                    rating: article.rating.rate,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 12.0,
                    direction: Axis.horizontal,
                  ),
                ),
                Flexible(child: Text(article.rating.count.toString(), style: const TextStyle(color: Color.fromARGB(255, 81, 128, 116))),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Image.network(
                article.image,
                height: 180,
              ),
            ),
            
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${NumberFormat("####0.00", "fr_FR").format(article.price)}€',
                      style: const TextStyle(fontSize: 25)
                      //overflow: TextOverflow.ellipsis,
                      ),
                  const Text(
                    "En stock.",
                    style: TextStyle(color: Color(0xff007600), fontSize: 20.0),
                  ),
                  const DropdownButtonCustom(),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (() {
                    print('test');
                  }),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xffFFA41B),
                      textStyle: const TextStyle(color: Colors.black)),
                  child: const Text('Ajouter au panier')),
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (() {
                    print('test');
                  }),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xffFA8900),
                      textStyle: const TextStyle(color: Colors.black)),
                  child: const Text('Achetez maintenant')),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0),
                    child: Text("Description du produit",
                        style:
                            TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(article.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 101, 101, 101)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(article.description),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
