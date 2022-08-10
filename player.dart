import 'dart:math';

import 'bot.dart';
import 'app.dart';
import 'weapon.dart';
import 'weapon_list_manager.dart';

class Player {
  final String pseudo;
  int _strength = 0;
  int _health = 0;
  final WeaponListManager _weaponListManager = WeaponListManager();
  Weapon _weapon; // = _weaponListManager.getNextWeaponToLoot;  

  int get strength => _strength;
  set strength(int strength) {
    _strength = max(0, strength);
  }

  int get health => _health;
  set health(int health) {
    _health = max(0, health);
  }

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
