import 'dart:async';
import 'dart:io';
import './Articles.dart';

enum Day { Lunes, Martes, Miercoles, Jueves, Viernes, Sabado }

void main(List<String> args) {
  String output = "";
  List<Articles> articles = List<Articles>.empty();
  String file_content = read_article_file();
  articles = create_Articles(file_content);

  return;
}

String read_article_file() {
  File file = File("./Articles.txt");
  String content = file.readAsStringSync();
  return content;
}

List<Articles> create_Articles(String content) {
  List<String> content_splitted = content.split("==");
  List<Articles> output_list = List.empty(growable: true);

  for (var i = 0; i < content_splitted.length; i++) {
    List<String> category_content = content_splitted[i].split('\n');
    Articles articles = Articles("");
    for (var i = 0; i < category_content.length; i++) {
      if (category_content[i].contains('-')) {
        articles = Articles(category_content
            .elementAt(i)
            .replaceAll("-", "")
            .replaceAll(":", ""));
      } else {
        if (!category_content.elementAt(i).isEmpty) {
          articles
              .add_article(category_content.elementAt(i).replaceAll("+", ""));
        }
      }
    }
    output_list.add(articles);
  }
  return output_list;
}
