import 'dart:math';
import 'bot.dart';
import 'app.dart';
import 'fighter.dart';
import 'weapon.dart';
import 'weapon_list_manager.dart';
import "dart:io";

class Player extends Fighter {
  final String pseudo;
  Weapon _weapon = const Weapon("Batte de baseball", 1, 100);
  final _weaponListManager = WeaponListManager();

  Player(this.pseudo) : super(100, 1) {
    this._weapon = _weaponListManager.getNextWeaponToLoot();
  }

  @override
  void display() {
    stdout.write(this.pseudo + " : ");
    super.display();
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
    final newWeapon = _weaponListManager.getNextWeaponToLoot();
    if (newWeapon != null) {
      print(
          "Bravo ${this.pseudo}, vous avez gagné en $i coups. J'augmente votre force et vous avez un ${newWeapon.description} !");
      this.strength += 1;
      this.health = 100;
      bot.health = 100;
      this.display();
    } else {
      print(
          "Bravo ${this.pseudo}, vous avez gagné en $i coups. J'ai plus d'arme");
    }
  }
}
