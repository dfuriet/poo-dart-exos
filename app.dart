import 'dart:math';

import 'NE_PAS_TOUCHER/user_input.dart';
import 'bot.dart';
import 'player.dart';

void main() {
  final bot = Bot(1);
  final player = Player(readText("Quel est votre nom ?"));
  var isMyTour = Random().nextBool();
  int i;

  do {
    i = 1;
    do {
      readText(player.pseudo + " : Appuyer sur entrée pour un prochin tour");
      if (isMyTour) {
        player.attack(bot);
        bot.display();
      } else {
        bot.attack(player);
        player.display();
      }
      isMyTour = !isMyTour;
      i++;
    } while (bot.health >= 0 && player.isAlive);

    if (bot.health < 0) {
      player.victory(bot, i);
    }
    if (player.health < 0) {
      print("Perdu en $i coups. Une vie en moins");
      player.health = 100;
      player.strength -= 1;
    }
  } while (player.isAlive);
  print("Game over ...");
}

int lancerDes() {
  final generator = Random();
  final de = generator.nextInt(12) + 1;
  return de;
}
