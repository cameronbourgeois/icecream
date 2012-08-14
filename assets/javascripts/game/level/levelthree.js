// Generated by CoffeeScript 1.3.3
var LevelThree,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

LevelThree = (function(_super) {

  __extends(LevelThree, _super);

  function LevelThree(game) {
    LevelThree.__super__.constructor.call(this, 'levelthree', game);
    this.baseSpeed = 4;
    this.dropLikelyhood = 0.998;
    this.baddieLikelyhood = 0.96;
    this.addBaddie();
  }

  LevelThree.prototype.checkPassed = function() {
    return this.points > 100;
  };

  LevelThree.prototype.addBaddie = function() {
    if (Math.random() > 0.5) {
      return this.baddies.push(new StrawberryConeBaddie(this));
    } else {
      return this.baddies.push(new StrawberryPopBaddie(this));
    }
  };

  LevelThree.prototype.addDrop = function() {
    return this.drops.push(new PoisonDrop(this));
  };

  return LevelThree;

})(Level);
