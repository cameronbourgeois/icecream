/**
Asset Manager
Customised by Cameron using code from https://github.com/sethladd/Bad-Aliens
**/

function AssetManager() {
	this.successCount = 0;
	this.errorCount = 0;
	this.cache = {};
	this.downloadQueue = [];
	this.progressBarID = "assetprogress"
}

AssetManager.prototype.queueDownload = function(path) {
	this.downloadQueue.push(path);
}

AssetManager.prototype.downloadAll = function(downloadCallback) {
	if (this.downloadQueue.length === 0) {
		downloadCallback();
	}
	
	$('#'+this.progressBarID).attr('max',this.downloadQueue.length);

	for (var i = 0; i < this.downloadQueue.length; i++) {
		var path = this.downloadQueue[i];
		var img = new Image();
		var that = this;
		img.addEventListener("load", function() {
			that.successCount += 1;
			$('#'+that.progressBarID).val(that.successCount);
			if (that.isDone()) {
				downloadCallback();
			}
		}, false);
		img.addEventListener("error", function() {
			that.errorCount += 1;
			if (that.isDone()) {
				downloadCallback();
			}
		}, false);
		img.src = path;
		this.cache[path] = img;
	}
}

AssetManager.prototype.getAsset = function(path) {
	return this.cache[path];
}

AssetManager.prototype.isDone = function() {
	if (this.downloadQueue.length == this.successCount + this.errorCount) {
		$('#'+this.progressBarID).hide();
		return true;
	}
	else {
		return false;
	}
}