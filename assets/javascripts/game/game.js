// Generated by CoffeeScript 1.3.3
var Game,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Game = (function() {

  function Game() {
    this.startGame = __bind(this.startGame, this);
    this.fps = 60;
    this.levelNum = 0;
    this.canvas = document.getElementById('battlefield');
    this.context = this.canvas.getContext('2d');
    this.bg = getImage('background');
    this.reset();
    $('#start_game').on('click', this.startGame);
  }

  Game.prototype.reset = function() {
    if (getParameterByName('level') !== "") {
      this.levelNum = getParameterByName('level') - 1;
    } else {
      this.levelNum = 0;
    }
    delete this.level;
    this.drawBG();
    return this.showMenu();
  };

  Game.prototype.drawBG = function() {
    return this.context.drawImage(this.bg, 0, 0);
  };

  Game.prototype.startGame = function(e) {
    e.preventDefault();
    this.playing = true;
    this.hideMenu();
    return this.nextLevel();
  };

  Game.prototype.nextLevel = function() {
    this.levelNum++;
    delete this.level;
    switch (this.levelNum) {
      case 1:
        this.level = new LevelOne(this);
        break;
      case 2:
        this.level = new LevelTwo(this);
        break;
      case 3:
        this.level = new LevelThree(this);
        break;
      case 4:
        this.level = new LevelFour(this);
        break;
      case 5:
        this.level = new LevelFive(this);
    }
    return this.level.start();
  };

  Game.prototype.showMenu = function() {
    return $('#menu').removeClass('hidden');
  };

  Game.prototype.hideMenu = function() {
    return $('#menu').addClass('hidden');
  };

  Game.prototype.showHUD = function() {
    return $('#hud').removeClass('hidden');
  };

  Game.prototype.hideHUD = function() {
    return $('#hud').addClass('hidden');
  };

  return Game;

})();
