// Generated by CoffeeScript 1.3.3
var Level,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Level = (function() {

  function Level(handle, game) {
    this.loopFunc = __bind(this.loopFunc, this);
    this.game = game;
    this.handle = handle;
    this.playing = false;
    this.bg = window.getImage(this.handle + '-bg');
    this.game.showHUD();
    this.fps = game.fps;
    this.speedModifier = 1;
    this.context = game.context;
    this.context_width = game.canvas.width;
    this.context_height = game.canvas.height;
    this.ground = this.context_height - 30;
    this.player = new Player(this);
    this.points = 0;
    this.bullets = [];
    this.effects = [];
    this.drops = [];
    this.baddies = [];
  }

  Level.prototype.start = function() {
    var _this = this;
    if (!this.playing) {
      $('#messages').html('');
      $('#messages').append('<div id="level_header" class="level_' + this.game.levelNum + '"></div>');
      $('#messages').removeClass('hidden');
      window.setTimeout(function() {
        $('#messages').addClass('hidden');
        _this.playing = true;
        return _this.loop = window.setInterval(_this.loopFunc, 1000 / _this.fps);
      }, 2000);
      return this.playing = true;
    }
  };

  Level.prototype.loopFunc = function() {
    if (this.checkPassed()) {
      this.over();
    }
    this.update();
    this.updateAll();
    this.drawAll();
    if (Math.random() > this.dropLikelyhood) {
      this.addDrop();
    }
    if (Math.random() > this.baddieLikelyhood) {
      return this.addBaddie();
    }
  };

  Level.prototype.update = function() {};

  Level.prototype.updateAll = function() {
    var baddie, bullet, drop, effect, i, _i, _j, _k, _l, _len, _len1, _len2, _len3, _len4, _m, _ref, _ref1, _ref2, _ref3, _ref4, _results;
    if (this.player) {
      this.player.update();
    }
    _ref = this.baddies;
    for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
      baddie = _ref[i];
      if (baddie) {
        baddie.update();
        _ref1 = this.bullets;
        for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
          bullet = _ref1[_j];
          if (this.haveCollided(bullet, baddie)) {
            this.player.incrementKillStreak();
            this.points = Math.floor(this.points + (baddie.points * this.player.killStreak));
            bullet.destroy();
            baddie.destroy();
          }
        }
        if (baddie.destroyed) {
          this.baddies.splice(i, 1);
        }
      }
    }
    _ref2 = this.bullets;
    for (i = _k = 0, _len2 = _ref2.length; _k < _len2; i = ++_k) {
      bullet = _ref2[i];
      if (bullet) {
        bullet.update();
        if (bullet.destroyed) {
          this.bullets.splice(i, 1);
        }
      }
    }
    _ref3 = this.effects;
    for (i = _l = 0, _len3 = _ref3.length; _l < _len3; i = ++_l) {
      effect = _ref3[i];
      if (effect) {
        effect.update();
        if (effect.destroyed) {
          this.effects.splice(i, 1);
        }
      }
    }
    _ref4 = this.drops;
    _results = [];
    for (i = _m = 0, _len4 = _ref4.length; _m < _len4; i = ++_m) {
      drop = _ref4[i];
      if (drop) {
        if (this.haveCollided(drop, this.player)) {
          drop.apply();
          drop.destroy();
        }
        drop.update();
        if (drop.destroyed) {
          _results.push(this.drops.splice(i, 1));
        } else {
          _results.push(void 0);
        }
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  Level.prototype.haveCollided = function(sprite1, sprite2) {
    return (sprite1.x < sprite2.x + sprite2.width) && (sprite1.x + sprite1.width > sprite2.x) && (sprite1.y < sprite2.y + sprite2.height) && (sprite1.y + sprite1.height > sprite2.y);
  };

  Level.prototype.drawAll = function() {
    var baddie, bullet, drop, effect, _i, _j, _k, _l, _len, _len1, _len2, _len3, _ref, _ref1, _ref2, _ref3, _results;
    $('#points').html(this.points);
    this.drawBG();
    if (this.player) {
      this.player.draw();
    }
    _ref = this.baddies;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      baddie = _ref[_i];
      baddie.draw();
    }
    _ref1 = this.bullets;
    for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
      bullet = _ref1[_j];
      bullet.draw();
    }
    _ref2 = this.effects;
    for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
      effect = _ref2[_k];
      effect.draw();
    }
    _ref3 = this.drops;
    _results = [];
    for (_l = 0, _len3 = _ref3.length; _l < _len3; _l++) {
      drop = _ref3[_l];
      _results.push(drop.draw());
    }
    return _results;
  };

  Level.prototype.drawBG = function() {
    return this.context.drawImage(this.bg, 0, 0);
  };

  Level.prototype.addDrop = function() {};

  Level.prototype.addBaddie = function() {};

  Level.prototype.stop = function() {
    this.playing = false;
    window.clearInterval(this.loop);
    return this.game.hideHUD();
  };

  Level.prototype.over = function() {
    this.stop();
    if (this.checkPassed()) {
      return this.game.nextLevel();
    } else {
      return this.game.reset();
    }
  };

  return Level;

})();
