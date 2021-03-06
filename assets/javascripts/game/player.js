// Generated by CoffeeScript 1.3.3
var Player,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Player = (function(_super) {

  __extends(Player, _super);

  function Player(level) {
    var _this = this;
    Player.__super__.constructor.call(this, 'player', level);
    this.spriterocket = window.assets.getAsset(window.asset_map[this.handle + '-rocket']);
    this.health = 6;
    this.updateHealth();
    this.killStreak = 0;
    this.x = this.level.context_width / 2;
    this.y = this.level.ground - this.height;
    this.colour = '#6f46ff';
    this.xAcceleration = 8;
    this.yAcceleration = 0;
    this.upPressed = false;
    this.leftPressed = false;
    this.rightPressed = false;
    $(window).on('keydown', function(e) {
      switch (e.which) {
        case 38:
          return _this.upPressed = true;
        case 39:
          return _this.rightPressed = true;
        case 37:
          return _this.leftPressed = true;
        case 32:
          return _this.level.bullets.push(new Bullet(_this.level));
      }
    });
    $(window).on('keyup', function(e) {
      switch (e.which) {
        case 38:
          return _this.upPressed = false;
        case 39:
          return _this.rightPressed = false;
        case 37:
          return _this.leftPressed = false;
      }
    });
  }

  Player.prototype.update = function() {
    if (this.leftPressed && (this.x - this.xAcceleration) >= 0) {
      this.x = this.x - this.xAcceleration;
    }
    if (this.rightPressed && (this.x + this.xAcceleration + this.width) <= this.level.context_width) {
      this.x = this.x + this.xAcceleration;
    }
    if (this.upPressed && this.yAcceleration < 10) {
      this.yAcceleration++;
    } else {
      if (this.yAcceleration > -10) {
        this.yAcceleration--;
      }
    }
    if ((this.y - this.yAcceleration) > 0 && (this.y - this.yAcceleration) + this.height < this.level.ground) {
      return this.y = this.y - this.yAcceleration;
    }
  };

  Player.prototype.draw = function() {
    var sprite;
    if (this.upPressed) {
      sprite = this.spriterocket;
    } else {
      sprite = this.sprite;
    }
    return this.level.context.drawImage(sprite, this.x, this.y);
  };

  Player.prototype.incrementKillStreak = function() {
    return this.killStreak++;
  };

  Player.prototype.resetKillStreak = function() {
    return this.killStreak = 0;
  };

  Player.prototype.replenishHealth = function(amount) {
    if (amount == null) {
      amount = 1;
    }
    if (this.health < 6) {
      this.health = this.health + amount;
    }
    return this.updateHealth();
  };

  Player.prototype.damageHealth = function(amount) {
    if (amount == null) {
      amount = 1;
    }
    this.resetKillStreak();
    this.health = this.health - amount;
    if (this.health === 0) {
      this.level.over();
    }
    return this.updateHealth();
  };

  Player.prototype.updateHealth = function() {
    return $('#health').removeClass().addClass('health_' + this.health);
  };

  return Player;

})(Sprite);
