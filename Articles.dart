import 'dart:math';

class Articles {
  String _category_name = "";
  final _article_list = <String>[];

  Articles(String category_name) {
    this._category_name = category_name;
  }

  void add_article(String article) {
    this._article_list.add(article);
  }

  List<String> get_articleList() {
    return this._article_list;
  }

  String get_name() {
    return this._category_name;
  }

  List<String> randomized_list(int no_articles) {
    List<String> articles = List.empty(growable: true);
    int flag = 0;
    while (flag < no_articles) {
      int index_random = Random().nextInt(this._article_list.length);
      String article = this._article_list.elementAt(index_random);
      if (!articles.contains(article)) {
        articles.add(article);
        flag++;
      }
    }
    return articles;
  }
}
