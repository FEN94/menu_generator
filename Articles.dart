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
    // bool beef = false, pork = false;
    while (flag < no_articles) {
      int index_random = Random().nextInt(this._article_list.length);
      String article = this._article_list.elementAt(index_random);

      if ((article.contains("Bistec") || article.contains("Cerdo")) &&
          this._category_name == "Acompañantes" &&
          articles.length > 0) {
        bool flag2 = false;
        for (var i = 0; i < articles.length; i++) {
          if (articles[i].contains("Bistec") || articles[i].contains("Cerdo")) {
            flag2 = true;
            break;
          }
        }
        if (flag2) {
          flag2 = false;
          continue;
        }
      }

      // if (this._category_name.contains("Acompañantes")) {
      //   if (!beef && article.contains("Bistec")) {
      //     !beef;
      //   }
      //   if (!pork && article.contains("Cerdo")) {
      //     !pork;
      //   }
      // }

      if (!articles.contains(article)) {
        articles.add(article);
        flag++;
      }
    }
    return articles;
  }
}
