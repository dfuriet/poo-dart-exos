import 'bot.dart';
import 'app.dart';

class Player {
  final String pseudo;
  int strength = 0;
  int health = 0;

  Player(this.pseudo);

  bool get isAlive => health > 0;

  void display() {
    print(this.pseudo + " : force = ${this.strength}, Santé = ${this.health}%");
  }

  void attack(Bot bot) {
    final dePlayer = lancerDes();
    print(this.pseudo + " : Dé = $dePlayer");
    bot.health -= dePlayer;
  }

  void victory(Bot bot, int i) {
    print(
        "Bravo ${this.pseudo}, vous avez gagné en $i coups. J'augmente votre force !");
    this.strength += 1;
    this.health = 100;
    bot.health = 100;
    this.display();
  }
}
