// Generated by CoffeeScript 1.3.1
var Game;

Game = (function() {

  function Game() {
    var _this = this;
    this.fps = 70;
    this.canvas = document.getElementById('battlefield');
    this.context = this.canvas.getContext('2d');
    this.context_width = this.canvas.width;
    this.context_height = this.canvas.height;
    this.level = 1;
    this.player = new Player(this);
    this.bullets = [];
    this.enemies = [new Enemy(this)];
    this.explosions = [];
    this.bg = new Image();
    this.bg.src = $('#bg-sky').attr('src');
    window.setInterval(function() {
      _this.updateAll();
      return _this.drawAll();
    }, 1000 / this.fps);
  }

  Game.prototype.updateAll = function() {
    var bullet, enemy, explosion, i, _i, _j, _k, _l, _len, _len1, _len2, _len3, _ref, _ref1, _ref2, _ref3, _results;
    if (this.player) {
      this.player.update();
    }
    _ref = this.enemies;
    for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
      enemy = _ref[i];
      enemy.update();
      _ref1 = this.bullets;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        bullet = _ref1[_j];
        if ((bullet.x > enemy.x && bullet.x < enemy.x + enemy.width) && (bullet.y < enemy.y + enemy.height && bullet.y > enemy.y)) {
          this.level++;
          this.enemies.push(new Enemy(this));
          bullet.destroyed = true;
          enemy.destroyed = true;
          this.explosions.push(new Explosion(this, bullet.x, bullet.y, enemy.width));
        }
      }
      if (enemy.destroyed) {
        this.enemies.splice(i, 1);
      }
    }
    _ref2 = this.bullets;
    for (i = _k = 0, _len2 = _ref2.length; _k < _len2; i = ++_k) {
      bullet = _ref2[i];
      bullet.update();
      if (bullet.destroyed) {
        this.bullets.splice(i, 1);
      }
    }
    _ref3 = this.explosions;
    _results = [];
    for (i = _l = 0, _len3 = _ref3.length; _l < _len3; i = ++_l) {
      explosion = _ref3[i];
      explosion.update();
      if (explosion.destroyed) {
        _results.push(this.explosions.splice(i, 1));
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  Game.prototype.drawAll = function() {
    var bullet, enemy, explosion, _i, _j, _k, _len, _len1, _len2, _ref, _ref1, _ref2, _results;
    $('#status').html(this.level);
    this.drawBG();
    if (this.player) {
      this.player.draw();
    }
    _ref = this.enemies;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      enemy = _ref[_i];
      enemy.draw();
    }
    _ref1 = this.bullets;
    for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
      bullet = _ref1[_j];
      bullet.draw();
    }
    _ref2 = this.explosions;
    _results = [];
    for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
      explosion = _ref2[_k];
      _results.push(explosion.draw());
    }
    return _results;
  };

  Game.prototype.drawRectangle = function(color, x, y, width, height) {
    this.context.fillStyle = color;
    return this.context.fillRect(x, y, width, height);
  };

  Game.prototype.drawCircle = function(color, x, y, diameter) {
    this.context.fillStyle = color;
    this.context.beginPath();
    this.context.arc(x, y, diameter, 0, Math.PI * 2, true);
    this.context.closePath();
    return this.context.fill();
  };

  Game.prototype.drawBG = function() {
    return this.context.drawImage(this.bg, 0, 0);
  };

  Game.prototype.over = function() {
    this.explosions.push(new Explosion(this, this.player.x, this.player.y, 80));
    delete this.player;
    alert(this.level);
    return $('#gameover').show();
  };

  return Game;

})();