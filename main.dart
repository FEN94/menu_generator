import 'dart:io';
import './Articles.dart';

final days = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"];
//Estos indices definen el numero de articulos por categoría
final qty_articles = [3, 6, 3, 3];

void main(List<String> args) {
  String output = "";
  List<Articles> articles = List<Articles>.empty();
  String file_content = read_article_file();
  articles = create_Articles(file_content);

  for (var day in days) {
    output += "============\n";
    output += "$day\n";
    output += "============\n";
    for (var i = 0; i < articles.length; i++) {
      output += "+${articles[i].get_name()}\n";
      List<String> alist = articles[i].randomized_list(qty_articles[i]);
      for (var article in alist) {
        output += "-$article\n";
      }
      output += '\n';
    }
  }
  write_menuFile(output);
  print(output);
  return;
}

String read_article_file() {
  File file = File("./Articles.txt");
  String content = file.readAsStringSync();
  return content;
}

void write_menuFile(String content) {
  final file = File("Menu.txt");
  var sink = file.openWrite();
  sink.write(content);
  sink.close();
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
