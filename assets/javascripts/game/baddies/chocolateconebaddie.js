// Generated by CoffeeScript 1.3.3
var ChocolateConeBaddie,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

ChocolateConeBaddie = (function(_super) {

  __extends(ChocolateConeBaddie, _super);

  function ChocolateConeBaddie(level) {
    ChocolateConeBaddie.__super__.constructor.call(this, 'chocolateconebaddie', level);
    this.yAcceleration = this.yAcceleration * 1.5;
    this.points = this.yAcceleration;
  }

  return ChocolateConeBaddie;

})(Baddie);