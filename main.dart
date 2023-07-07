import 'dart:async';
import 'dart:io';

void main(List<String> args) {
  File("./Articles.txt").readAsString().then((String content) {
    print(content);
  });
}
