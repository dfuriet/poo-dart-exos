import 'dart:math';

import 'NE_PAS_TOUCHER/user_input.dart';
import 'bot.dart';

void main() {
  print("Bonjour!");
  String nickname = readText("Quel est votre nom ?");

  final bot = Bot();
  int i = 0;
  do {
    readText("$nickname : Appuyer sur entrée pour lancer les des");
    final de = lancerDes();
    print("$nickname : Dé = $de");
    bot.health = bot.health - de;
    print("$nickname : Force = ${bot.health}");
    i++;
  } while (bot.health > 0);
  print("Gagné en $i coup !");
}

int lancerDes() {
  final generator = Random();
  final de = generator.nextInt(12) + 1;
  return de;
}
