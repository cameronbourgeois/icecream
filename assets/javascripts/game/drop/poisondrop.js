// Generated by CoffeeScript 1.3.1
var PoisonDrop,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

PoisonDrop = (function(_super) {

  __extends(PoisonDrop, _super);

  function PoisonDrop(level) {
    PoisonDrop.__super__.constructor.call(this, 'poisondrop', level);
  }

  PoisonDrop.prototype.apply = function() {
    PoisonDrop.__super__.apply.call(this);
    return this.level.player.damageHealth();
  };

  return PoisonDrop;

})(Drop);
