// Generated by CoffeeScript 1.3.3
var LevelOne,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

LevelOne = (function(_super) {

  __extends(LevelOne, _super);

  function LevelOne(game) {
    LevelOne.__super__.constructor.call(this, 'levelone', game);
    this.baseSpeed = 3;
    this.dropLikelyhood = 0.996;
    this.baddieLikelyhood = 0.967;
    this.addBaddie();
  }

  LevelOne.prototype.checkPassed = function() {
    return this.points > 2500;
  };

  LevelOne.prototype.addBaddie = function() {
    if (Math.random() > 0.5) {
      return this.baddies.push(new BananaConeBaddie(this));
    } else {
      return this.baddies.push(new BananaPopBaddie(this));
    }
  };

  LevelOne.prototype.addDrop = function() {
    if (Math.random() < 0.5) {
      return this.drops.push(new HealthDrop(this));
    } else {
      return this.drops.push(new SlowDrop(this));
    }
  };

  return LevelOne;

})(Level);
