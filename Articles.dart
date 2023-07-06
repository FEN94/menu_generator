import 'Article.dart';
import 'dart:math';

class Articles {
  String _category_name = "";
  final _article_list = <Article>[];

  Articles(String category_name) {
    this._category_name = category_name;
  }

  void add_article(Article article) {
    this._article_list.add(article);
  }

  List<Article> get_articleList() {
    return this._article_list;
  }

  List<Articles> randomized_list(int no_articles) {
    int index_random = Random().nextInt(no_articles);
    return List.empty();
  }
}
