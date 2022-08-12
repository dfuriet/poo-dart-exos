import 'dart:math';

abstract class Fighter {
  int _strength = 0;
  int _health = 0;

  Fighter(int health, int strength) {
    this._health = health;
    this._strength = strength;
  }

  int get strength => _strength;
  set strength(int strength) {
    _strength = max(0, strength);
  }

  int get health => _health;
  set health(int health) {
    _health = max(0, health);
  }

  bool get isAlive => health > 0;

  void display() {
    print("Force = ${this.strength}, Santé = ${this.health}%");
  }
}
