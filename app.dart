import 'dart:math';

import 'NE_PAS_TOUCHER/user_input.dart';
import 'bot.dart';
import 'player.dart';

void main() {
  Map<String, Player> playerList = {};
  String nickname;
  do {
    nickname = readText("Quel est votre nom ?");
    if (nickname.isNotEmpty) {
      final player = playerList[nickname] ?? Player(nickname);
      playerList[nickname] = player;
      final bot = Bot(1);
      player.health = 100;
      //final player = Player(nickname);
      var isMyTour = Random().nextBool();
      int i;

      do {
        i = 1;
        do {
          if (isMyTour) {
            readText(
                player.pseudo + " : Appuyer sur entrée pour un prochin tour");
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
    displayHallOfFame(playerList.values.toList());
  } while (nickname.isNotEmpty);
  print("Fin de partie");
}

int lancerDes() {
  final generator = Random();
  final de = generator.nextInt(12) + 1;
  return de;
}

void displayHallOfFame(List<Player> playerList) {
  playerList.sort((a, b) => b.compareTo(a));
  print("Hall of Fame");
  for (final player in playerList) {
    print("${player.nickname} - ${player.score}");
  }
}
