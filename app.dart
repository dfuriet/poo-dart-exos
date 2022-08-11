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
      if (isMyTour) {
        readText(player.pseudo + " : Appuyer sur entrée pour un prochin tour");
        player.attack(bot);
        bot.display();
        i++;
      } else {
        bot.attack(player);
        player.display();
      }
      isMyTour = !isMyTour;
    } while (bot.isAlive && player.isAlive);

    if (player.isAlive) {
      player.victory(bot, i);
    }

  } while (player.isAlive);
  print("Game over ...");
}

int lancerDes() {
  final generator = Random();
  final de = generator.nextInt(12) + 1;
  return de;
}
