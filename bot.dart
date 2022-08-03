import 'player.dart';
import 'app.dart';

class Bot {
  final int strength;
  int health = 0;

  Bot(this.strength);

  void display() {
    print("Bot : Force = ${this.strength}, Santé = ${this.health}%");
  }

  void attack(Player player) {
    final deBot = lancerDes();
    print("Bot : Dé = $deBot");
    player.health -= deBot;
  }
}
