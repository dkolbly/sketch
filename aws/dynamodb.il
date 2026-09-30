package aws;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
)

// Amazon DynamoDB: a stacked table with a lightning bolt (NoSQL database).
// Drawn in its own frame, rect(0, 0, size, size), with the label centered below it.
// The tile color is the `color` field (the official art uses a gradient, here flat).
module DynamoDB(size=20mm, label="DynamoDB", color="#2e27ad") {
  k = size/80;

  // tile
  path.Path() {
    path.Fill(color);
    path.MoveTo(0, 0); path.LineTo(size, 0); path.LineTo(size, size); path.LineTo(0, size); path.Close();
  }

  path.Path() {
    path.Fill("#ffffff");
    path.MoveTo(52.09*k, 54.85*k);
    path.CurveTo(48.75*k, 57.55*k, 41.74*k, 58.98*k, 35.04*k, 58.98*k);
    path.CurveTo(28.34*k, 58.98*k, 21.34*k, 57.55*k, 18*k, 54.85*k);
    path.LineTo(18*k, 60.28*k);
    path.LineTo(18*k, 60.28*k);
    path.CurveTo(18*k, 63*k, 25*k, 66.02*k, 35.04*k, 66.02*k);
    path.CurveTo(45.08*k, 66.02*k, 52.07*k, 63*k, 52.09*k, 60.29*k);
    path.LineTo(52.09*k, 54.85*k);
    path.Close();
    path.MoveTo(52.09*k, 44.52*k);
    path.LineTo(54.09*k, 44.51*k);
    path.LineTo(54.09*k, 44.52*k);
    path.CurveTo(54.09*k, 45.73*k, 53.48*k, 46.86*k, 52.3*k, 47.89*k);
    path.CurveTo(53.73*k, 49.15*k, 54.09*k, 50.38*k, 54.09*k, 51.26*k);
    path.CurveTo(54.09*k, 51.26*k, 54.09*k, 51.27*k, 54.09*k, 51.27*k);
    path.LineTo(54.09*k, 60.28*k);
    path.LineTo(54.09*k, 60.28*k);
    path.CurveTo(54.09*k, 65.3*k, 44.27*k, 68*k, 35.04*k, 68*k);
    path.CurveTo(25.83*k, 68*k, 16.05*k, 65.31*k, 16*k, 60.32*k);
    path.CurveTo(16*k, 60.31*k, 16*k, 60.31*k, 16*k, 60.3*k);
    path.LineTo(16*k, 51.25*k);
    path.CurveTo(16*k, 50.37*k, 16.36*k, 49.14*k, 17.79*k, 47.89*k);
    path.CurveTo(16.37*k, 46.64*k, 16.01*k, 45.41*k, 16*k, 44.54*k);
    path.LineTo(16*k, 44.54*k);
    path.CurveTo(16*k, 44.54*k, 16*k, 44.54*k, 16*k, 44.53*k);
    path.LineTo(16*k, 35.48*k);
    path.CurveTo(16*k, 35.48*k, 16*k, 35.48*k, 16*k, 35.47*k);
    path.CurveTo(16*k, 34.6*k, 16.36*k, 33.37*k, 17.79*k, 32.12*k);
    path.CurveTo(16.37*k, 30.86*k, 16.01*k, 29.64*k, 16*k, 28.77*k);
    path.LineTo(16*k, 28.77*k);
    path.CurveTo(16*k, 28.77*k, 16*k, 28.76*k, 16*k, 28.76*k);
    path.LineTo(16*k, 19.71*k);
    path.CurveTo(16*k, 19.71*k, 16*k, 19.71*k, 16*k, 19.7*k);
    path.CurveTo(16.02*k, 14.7*k, 25.82*k, 12*k, 35.04*k, 12*k);
    path.CurveTo(40.25*k, 12*k, 45.26*k, 12.83*k, 48.78*k, 14.27*k);
    path.LineTo(48.01*k, 16.11*k);
    path.CurveTo(44.73*k, 14.76*k, 40*k, 13.98*k, 35.04*k, 13.98*k);
    path.CurveTo(25*k, 13.98*k, 18*k, 17*k, 18*k, 19.72*k);
    path.CurveTo(18*k, 22.43*k, 25*k, 25.45*k, 35.04*k, 25.45*k);
    path.CurveTo(35.31*k, 25.45*k, 35.58*k, 25.45*k, 35.85*k, 25.44*k);
    path.LineTo(35.93*k, 27.42*k);
    path.CurveTo(35.64*k, 27.43*k, 35.34*k, 27.43*k, 35.04*k, 27.43*k);
    path.CurveTo(28.34*k, 27.43*k, 21.34*k, 26.01*k, 18*k, 23.31*k);
    path.LineTo(18*k, 28.74*k);
    path.LineTo(18*k, 28.74*k);
    path.LineTo(18*k, 28.76*k);
    path.CurveTo(18.01*k, 29.8*k, 19.08*k, 30.71*k, 19.97*k, 31.29*k);
    path.CurveTo(22.66*k, 33*k, 27.48*k, 34.18*k, 32.86*k, 34.42*k);
    path.LineTo(32.77*k, 36.4*k);
    path.CurveTo(27.32*k, 36.15*k, 22.55*k, 35.02*k, 19.48*k, 33.29*k);
    path.CurveTo(18.73*k, 33.86*k, 18*k, 34.62*k, 18*k, 35.49*k);
    path.CurveTo(18*k, 38.2*k, 25*k, 41.22*k, 35.04*k, 41.22*k);
    path.CurveTo(36.03*k, 41.22*k, 37.01*k, 41.19*k, 37.95*k, 41.12*k);
    path.LineTo(38.09*k, 43.1*k);
    path.CurveTo(37.1*k, 43.17*k, 36.07*k, 43.21*k, 35.04*k, 43.21*k);
    path.CurveTo(28.34*k, 43.21*k, 21.34*k, 41.78*k, 18*k, 39.08*k);
    path.LineTo(18*k, 44.51*k);
    path.LineTo(18*k, 44.51*k);
    path.CurveTo(18.01*k, 45.57*k, 19.08*k, 46.48*k, 19.97*k, 47.06*k);
    path.CurveTo(23.05*k, 49.02*k, 28.82*k, 50.25*k, 35.04*k, 50.25*k);
    path.LineTo(35.48*k, 50.25*k);
    path.LineTo(35.48*k, 52.23*k);
    path.LineTo(35.04*k, 52.23*k);
    path.CurveTo(28.72*k, 52.23*k, 22.98*k, 51.06*k, 19.47*k, 49.07*k);
    path.CurveTo(18.72*k, 49.64*k, 18*k, 50.4*k, 18*k, 51.26*k);
    path.CurveTo(18*k, 53.97*k, 25*k, 56.99*k, 35.04*k, 56.99*k);
    path.CurveTo(45.08*k, 56.99*k, 52.07*k, 53.97*k, 52.09*k, 51.26*k);
    path.LineTo(52.09*k, 51.25*k);
    path.LineTo(52.09*k, 51.25*k);
    path.CurveTo(52.08*k, 50.39*k, 51.36*k, 49.63*k, 50.61*k, 49.07*k);
    path.CurveTo(50.12*k, 49.34*k, 49.6*k, 49.61*k, 49*k, 49.86*k);
    path.LineTo(48.24*k, 48.02*k);
    path.CurveTo(48.96*k, 47.72*k, 49.59*k, 47.4*k, 50.11*k, 47.06*k);
    path.CurveTo(51.01*k, 46.47*k, 52.09*k, 45.55*k, 52.09*k, 44.52*k);
    path.LineTo(52.09*k, 44.52*k);
    path.Close();
    path.MoveTo(60.65*k, 30.02*k);
    path.LineTo(55.05*k, 30.02*k);
    path.CurveTo(54.72*k, 30.02*k, 54.41*k, 29.85*k, 54.22*k, 29.58*k);
    path.CurveTo(54.03*k, 29.31*k, 54*k, 28.96*k, 54.12*k, 28.66*k);
    path.LineTo(57.53*k, 20.14*k);
    path.LineTo(44.62*k, 20.14*k);
    path.LineTo(38.62*k, 32.04*k);
    path.LineTo(45*k, 32.04*k);
    path.CurveTo(45.32*k, 32.04*k, 45.62*k, 32.19*k, 45.81*k, 32.45*k);
    path.CurveTo(46*k, 32.7*k, 46.05*k, 33.03*k, 45.95*k, 33.33*k);
    path.LineTo(40.26*k, 51.09*k);
    path.LineTo(60.65*k, 30.02*k);
    path.Close();
    path.MoveTo(63.72*k, 29.71*k);
    path.LineTo(38.72*k, 55.54*k);
    path.CurveTo(38.53*k, 55.74*k, 38.27*k, 55.84*k, 38*k, 55.84*k);
    path.CurveTo(37.82*k, 55.84*k, 37.65*k, 55.8*k, 37.49*k, 55.71*k);
    path.CurveTo(37.09*k, 55.47*k, 36.91*k, 54.99*k, 37.05*k, 54.55*k);
    path.LineTo(43.63*k, 34.02*k);
    path.LineTo(37*k, 34.02*k);
    path.CurveTo(36.65*k, 34.02*k, 36.33*k, 33.85*k, 36.15*k, 33.55*k);
    path.CurveTo(35.97*k, 33.26*k, 35.95*k, 32.9*k, 36.11*k, 32.59*k);
    path.LineTo(43.11*k, 18.7*k);
    path.CurveTo(43.28*k, 18.37*k, 43.62*k, 18.15*k, 44*k, 18.15*k);
    path.LineTo(59*k, 18.15*k);
    path.CurveTo(59.33*k, 18.15*k, 59.64*k, 18.32*k, 59.83*k, 18.59*k);
    path.CurveTo(60.01*k, 18.86*k, 60.05*k, 19.21*k, 59.93*k, 19.51*k);
    path.LineTo(56.52*k, 28.03*k);
    path.LineTo(63*k, 28.03*k);
    path.CurveTo(63.4*k, 28.03*k, 63.76*k, 28.27*k, 63.92*k, 28.64*k);
    path.CurveTo(64.08*k, 29*k, 64*k, 29.43*k, 63.72*k, 29.71*k);
    path.LineTo(63.72*k, 29.71*k);
    path.Close();
    path.MoveTo(19.45*k, 60.67*k);
    path.CurveTo(20.87*k, 61.47*k, 22.66*k, 62.14*k, 24.76*k, 62.67*k);
    path.LineTo(25.24*k, 60.74*k);
    path.CurveTo(23.35*k, 60.27*k, 21.69*k, 59.65*k, 20.44*k, 58.95*k);
    path.LineTo(19.45*k, 60.67*k);
    path.Close();
    path.MoveTo(24.76*k, 46.8*k);
    path.LineTo(25.24*k, 44.88*k);
    path.CurveTo(23.35*k, 44.4*k, 21.69*k, 43.78*k, 20.44*k, 43.08*k);
    path.LineTo(19.45*k, 44.8*k);
    path.CurveTo(20.87*k, 45.6*k, 22.65*k, 46.27*k, 24.76*k, 46.8*k);
    path.LineTo(24.76*k, 46.8*k);
    path.Close();
    path.MoveTo(19.45*k, 28.94*k);
    path.LineTo(20.44*k, 27.21*k);
    path.CurveTo(21.68*k, 27.91*k, 23.34*k, 28.53*k, 25.24*k, 29.01*k);
    path.LineTo(24.76*k, 30.93*k);
    path.CurveTo(22.65*k, 30.4*k, 20.87*k, 29.73*k, 19.45*k, 28.94*k);
    path.LineTo(19.45*k, 28.94*k);
    path.Close();
  }

  path.Translate(size/2, size*1.06) {
    text.Typeset(label, align="center") {
      font.Family("Go");
      font.Size(size/5);
      path.Fill("black");
    }
  }

  // anchors for connectors: the frame outline, and the middle of each side
  path.ConnectionSurface() {
    path.MoveTo(0, 0);
    path.LineTo(size, 0);
    path.LineTo(size, size);
    path.LineTo(0, size);
    path.Close();
  }
  path.ConnectionPoint(size/2, 0, name="n");
  path.ConnectionPoint(size, size/2, name="e");
  path.ConnectionPoint(size/2, size, name="s");
  path.ConnectionPoint(0, size/2, name="w");
}
