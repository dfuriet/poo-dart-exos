import 'dart:math';

import 'NE_PAS_TOUCHER/user_input.dart';
import 'bot.dart';
import 'player.dart';

void main() {
  final bot = Bot();
  final player = Player();
  player.pseudo = readText("Quel est votre nom ?");
  var isMyTour = Random().nextBool();
  int i = 0;

  do {
    readText(player.pseudo + " : Appuyer sur entrée pour un prochin tour");
    if (isMyTour) {
      attackPlayer(player, bot);
      displayBot(bot);
    } else {
      attackBot(bot, player);
      displayPlayer(player);
    }
    isMyTour = !isMyTour;
    i++;
  } while (bot.health >= 0 && player.health >= 0);

  if (bot.health < 0) {
    print("Gagné en $i coup !");
  }
  if (player.health < 0) {
    print("Perdu en $i coups");
  }
}

int lancerDes() {
  final generator = Random();
  final de = generator.nextInt(12) + 1;
  return de;
}

void displayPlayer(Player player) {
  print(player.pseudo +
      " : force = ${player.strength}, Santé = ${player.health}%");
}

void displayBot(Bot bot) {
  print("Bot : Force = ${bot.strength}, Santé = ${bot.health}%");
}

void attackPlayer(Player player, Bot bot) {
  final dePlayer = lancerDes();
  print(player.pseudo + " : Dé = $dePlayer");
  bot.health -= dePlayer;
}

void attackBot(Bot bot, Player player) {
  final deBot = lancerDes();
  print("Bot : Dé = $deBot");
  player.health -= deBot;
}
