// Generated by CoffeeScript 1.3.3
var Baddie,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Baddie = (function(_super) {

  __extends(Baddie, _super);

  function Baddie(handle, level) {
    Baddie.__super__.constructor.call(this, handle, level);
    this.width = this.sprite.width;
    this.height = this.sprite.height;
    this.x = Math.floor(Math.random() * (this.level.context_width - this.width) + 1);
    this.y = 0;
    this.xAcceleration = 0;
    this.yAcceleration = this.level.baseSpeed;
    this.points = this.level.baseSpeed;
  }

  Baddie.prototype.update = function() {
    var ySpeed;
    if (this.level.speedModifier !== 1) {
      ySpeed = this.yAcceleration * this.level.speedModifier;
    } else {
      ySpeed = this.yAcceleration;
    }
    if (this.y + ySpeed > 0 && this.y + ySpeed + this.height < this.level.ground) {
      return this.y = this.y + ySpeed;
    } else {
      this.level.player.damageHealth();
      this.level.effects.push(new Explosion(this.level, this.x, this.y));
      return this.destroy();
    }
  };

  Baddie.prototype.destroy = function() {
    Baddie.__super__.destroy.call(this);
    return this.level.effects.push(new Explosion(this.level, this.x, this.y));
  };

  return Baddie;

})(Sprite);
