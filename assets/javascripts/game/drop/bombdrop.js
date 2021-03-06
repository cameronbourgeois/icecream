// Generated by CoffeeScript 1.3.3
var BombDrop,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

BombDrop = (function(_super) {

  __extends(BombDrop, _super);

  function BombDrop(level) {
    BombDrop.__super__.constructor.call(this, 'bombdrop', level);
  }

  BombDrop.prototype.apply = function() {
    var baddie, _i, _len, _ref, _results;
    BombDrop.__super__.apply.call(this);
    _ref = this.level.baddies;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      baddie = _ref[_i];
      _results.push(baddie.destroy());
    }
    return _results;
  };

  return BombDrop;

})(Drop);
