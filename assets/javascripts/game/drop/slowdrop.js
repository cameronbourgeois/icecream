// Generated by CoffeeScript 1.3.1
var SlowDrop,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

SlowDrop = (function(_super) {

  __extends(SlowDrop, _super);

  function SlowDrop(level) {
    SlowDrop.__super__.constructor.call(this, 'slowdrop', level);
    this.speedModifier = 0.5;
  }

  SlowDrop.prototype.apply = function() {
    var _this = this;
    SlowDrop.__super__.apply.call(this);
    this.level.speedModifier = this.speedModifier * this.level.speedModifier;
    return window.setTimeout(function() {
      return _this.level.speedModifier = _this.level.speedModifier / _this.speedModifier;
    }, 3000);
  };

  return SlowDrop;

})(Drop);
