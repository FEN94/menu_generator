import 'dart:math';

class Articles {
  String _category_name = "";
  final _article_list = <String>[];
  final _priority_articles = <String>[];

  Articles(String category_name) {
    this._category_name = category_name;
  }

  void add_article(String article) {
    this._article_list.add(article);
  }

  void add_priority_article(String article) {
    this._priority_articles.add(article);
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
    bool beef = false, pork = false;

    articles = _set_primaryArticle(this._category_name, articles);
    flag = this._priority_articles.length;
    while (flag < no_articles) {
      int index_random = Random().nextInt(this._article_list.length);
      String article = this._article_list.elementAt(index_random);

      if (this._category_name == "Acompañantes") {
        if (!beef && article.contains("Bistec")) {
          articles.add(article);
          flag++;
          beef = !beef;
          continue;
        }
        if (!pork && article.contains("Cerdo")) {
          articles.add(article);
          flag++;
          pork = !pork;
          continue;
        }
      }

      if (!articles.contains(article) &&
          !article.contains("Bistec") &&
          !article.contains("Cerdo")) {
        articles.add(article);
        flag++;
      }
    }
    return articles;
  }

  List<String> _set_primaryArticle(String category, List<String> articles) {
    if (this._priority_articles.length > 0) {
      for (var article in this._priority_articles) {
        articles.add(article);
      }
    }
    return articles;
  }
}
