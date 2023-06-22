const Circle = require("./circle.js");

const circles = [];

window.Game = function (xDim, yDim) {
  this.xDim = xDim;
  this.yDim = yDim;

  for (let i = 0; i < Game.NUM_CIRCLES; ++i) {
    circles.push(
      Circle.randomCircle(xDim, yDim, Game.NUM_CIRCLES)
    );
  }
};

Game.NUM_CIRCLES = 4000;

Game.prototype.render = function (ctx) {
  // This will empty the canvas.
  ctx.clearRect(0, 0, this.xDim, this.yDim);

  circles.forEach(function (circle) {
    circle.render(ctx);
  });
};

Game.prototype.moveCircles = function () {
  circles.forEach( circle => {
    circle.moveRandom(this.xDim, this.yDim);
  });
};

Game.prototype.start = function (canvasEl) {
  // Get a 2d canvas drawing context. The canvas API lets you call
  // a `getContext` method on a canvas DOM element.
  const ctx = canvasEl.getContext("2d");

  // This function will update the position of all the circles,
  // clear the canvas, and redraw them.
  const animateCallback = () => {
    this.moveCircles();
    this.render(ctx);
    // This will call your animateCallback again, but only when the browser
    // is ready, usually every 1/60th of a second.
    requestAnimationFrame(animateCallback);

    // If you didn't know about requestAnimationFrame, you could use setTimeout:
    // setTimeout(animateCallback, 1000/60);
  };

  // This will cause the first render and start the endless triggering of
  // the function using requestAnimationFrame
  animateCallback();
};

module.exports = Game;
