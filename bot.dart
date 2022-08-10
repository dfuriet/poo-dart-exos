import 'dart:math';
import 'player.dart';
import 'app.dart';

class Bot {
  int _health = 100;
  final int _strength;

  int get strength => _strength;

  int get health => _health;
  set health(int health) {
    _health = max(0, health);
  }

  Bot(this._strength);

  bool get isAlive => health > 0;

  void display() {
    print("Bot : Force = ${this.strength}, Santé = ${this.health}%");
  }

  void attack(Player player) {
    final deBot = lancerDes();
    print("Bot : Dé = $deBot");
    player.health -= deBot;
  }
}
