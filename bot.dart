
import 'fighter.dart';
import 'player.dart';
import 'app.dart';
import "dart:io";

class Bot extends Fighter {
  Bot(int strength) : super(100, strength);

  @override
  void display() {
    stdout.write("Bot : ");
    super.display();
  }

  void attack(Player player) {
    final deBot = lancerDes();
    print("Bot : Dé = $deBot");
    player.health -= deBot;
  }
}
