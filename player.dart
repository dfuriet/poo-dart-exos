import 'dart:math';

import 'bot.dart';
import 'app.dart';
import 'weapon.dart';

class Player {
  final String pseudo;
  int strength = 0;
  int health = 0;
  Weapon _weapon = const Weapon("Batte de baseball", 1, 100);

  Player(this.pseudo);

  bool get isAlive => health > 0;

  void display() {
    print(this.pseudo + " : force = ${this.strength}, Santé = ${this.health}%");
  }

  void attack(Bot bot) {
    final randomPercent = Random().nextInt(100) + 1;
    final dePlayer = lancerDes() + (strength + _weapon.power);
    if (randomPercent <= _weapon.accuracy) {
      print(this.pseudo + " : Dé = $dePlayer");
      bot.health -= dePlayer;
    } else {
      print("Coup manquée .. : Dé = $dePlayer");
    }
  }

  void victory(Bot bot, int i) {
    const newWeapon = Weapon("Fusil à pompe", 2, 75);
    print(
        "Bravo ${this.pseudo}, vous avez gagné en $i coups. J'augmente votre force et vous avez un ${newWeapon.description} !");
    this.strength += 1;
    this.health = 100;
    bot.health = 100;
    this.display();
  }
}
