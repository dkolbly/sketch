package aws;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
)

// Amazon ElastiCache: a database cylinder on a memory module (in-memory cache).
// Drawn in its own frame, rect(0, 0, size, size), with the label centered below it.
// The tile color is the `color` field (the official art uses a gradient, here flat).
module ElastiCache(size=20mm, label="ElastiCache", color="#2e27ad") {
  k = size/80;

  // tile
  path.Path() {
    path.Fill(color);
    path.MoveTo(0, 0); path.LineTo(size, 0); path.LineTo(size, size); path.LineTo(0, size); path.Close();
  }

  path.Path() {
    path.Fill("#ffffff");
    path.MoveTo(51*k, 61.56*k);
    path.LineTo(51*k, 55.7*k);
    path.CurveTo(48.47*k, 57.34*k, 43.9*k, 58.11*k, 39.56*k, 58.11*k);
    path.CurveTo(34.82*k, 58.11*k, 31.12*k, 57.29*k, 29*k, 55.87*k);
    path.LineTo(29*k, 61.56*k);
    path.CurveTo(29*k, 63.25*k, 32.95*k, 65*k, 39.56*k, 65*k);
    path.CurveTo(46.3*k, 65*k, 51*k, 63.18*k, 51*k, 61.56*k);
    path.LineTo(51*k, 61.56*k);
    path.Close();
    path.MoveTo(39.56*k, 49.22*k);
    path.CurveTo(34.82*k, 49.22*k, 31.12*k, 48.39*k, 29*k, 46.98*k);
    path.LineTo(29*k, 52.69*k);
    path.CurveTo(29.03*k, 54.37*k, 32.97*k, 56.11*k, 39.56*k, 56.11*k);
    path.CurveTo(46.28*k, 56.11*k, 50.97*k, 54.31*k, 51*k, 52.68*k);
    path.LineTo(51*k, 46.81*k);
    path.CurveTo(48.47*k, 48.45*k, 43.9*k, 49.22*k, 39.56*k, 49.22*k);
    path.LineTo(39.56*k, 49.22*k);
    path.Close();
    path.MoveTo(51*k, 43.79*k);
    path.LineTo(51*k, 37.03*k);
    path.CurveTo(48.47*k, 38.67*k, 43.9*k, 39.44*k, 39.56*k, 39.44*k);
    path.CurveTo(34.82*k, 39.44*k, 31.12*k, 38.61*k, 29*k, 37.2*k);
    path.LineTo(29*k, 43.79*k);
    path.CurveTo(29.03*k, 45.48*k, 32.97*k, 47.22*k, 39.56*k, 47.22*k);
    path.CurveTo(46.28*k, 47.22*k, 50.97*k, 45.42*k, 51*k, 43.79*k);
    path.LineTo(51*k, 43.79*k);
    path.Close();
    path.MoveTo(29*k, 33.99*k);
    path.CurveTo(29*k, 34*k, 29*k, 34*k, 29*k, 34*k);
    path.LineTo(29*k, 34*k);
    path.LineTo(29*k, 34.01*k);
    path.CurveTo(29.03*k, 35.7*k, 32.97*k, 37.44*k, 39.56*k, 37.44*k);
    path.CurveTo(46.9*k, 37.44*k, 50.97*k, 35.42*k, 51*k, 34.01*k);
    path.LineTo(51*k, 34*k);
    path.LineTo(51*k, 34*k);
    path.CurveTo(51*k, 34*k, 51*k, 34*k, 51*k, 33.99*k);
    path.CurveTo(51*k, 32.58*k, 46.93*k, 30.55*k, 39.56*k, 30.55*k);
    path.CurveTo(32.95*k, 30.55*k, 29*k, 32.3*k, 29*k, 33.99*k);
    path.LineTo(29*k, 33.99*k);
    path.Close();
    path.MoveTo(53*k, 34.02*k);
    path.LineTo(53*k, 43.77*k);
    path.LineTo(53*k, 43.77*k);
    path.CurveTo(53*k, 43.78*k, 53*k, 43.79*k, 53*k, 43.8*k);
    path.LineTo(53*k, 52.67*k);
    path.LineTo(53*k, 52.67*k);
    path.CurveTo(53*k, 52.68*k, 53*k, 52.68*k, 53*k, 52.69*k);
    path.LineTo(53*k, 61.56*k);
    path.CurveTo(53*k, 65.3*k, 46.03*k, 67*k, 39.56*k, 67*k);
    path.CurveTo(31.93*k, 67*k, 27*k, 64.86*k, 27*k, 61.56*k);
    path.LineTo(27*k, 52.7*k);
    path.CurveTo(27*k, 52.69*k, 27*k, 52.68*k, 27*k, 52.67*k);
    path.LineTo(27*k, 52.67*k);
    path.LineTo(27*k, 43.8*k);
    path.CurveTo(27*k, 43.79*k, 27*k, 43.78*k, 27*k, 43.77*k);
    path.LineTo(27*k, 43.77*k);
    path.LineTo(27*k, 34.02*k);
    path.CurveTo(27*k, 34.01*k, 27*k, 34*k, 27*k, 33.99*k);
    path.CurveTo(27*k, 30.68*k, 31.93*k, 28.55*k, 39.56*k, 28.55*k);
    path.CurveTo(46.03*k, 28.55*k, 53*k, 30.25*k, 53*k, 33.99*k);
    path.CurveTo(53*k, 34*k, 53*k, 34.01*k, 53*k, 34.02*k);
    path.LineTo(53*k, 34.02*k);
    path.Close();
    path.MoveTo(67*k, 21.12*k);
    path.CurveTo(67.55*k, 21.12*k, 68*k, 20.67*k, 68*k, 20.12*k);
    path.LineTo(68*k, 15*k);
    path.CurveTo(68*k, 14.45*k, 67.55*k, 14*k, 67*k, 14*k);
    path.LineTo(13*k, 14*k);
    path.CurveTo(12.45*k, 14*k, 12*k, 14.45*k, 12*k, 15*k);
    path.LineTo(12*k, 20.12*k);
    path.CurveTo(12*k, 20.67*k, 12.45*k, 21.12*k, 13*k, 21.12*k);
    path.CurveTo(14.22*k, 21.12*k, 15.21*k, 22.11*k, 15.21*k, 23.32*k);
    path.CurveTo(15.21*k, 24.53*k, 14.22*k, 25.52*k, 13*k, 25.52*k);
    path.CurveTo(12.45*k, 25.52*k, 12*k, 25.97*k, 12*k, 26.52*k);
    path.LineTo(12*k, 47*k);
    path.CurveTo(12*k, 47.56*k, 12.45*k, 48*k, 13*k, 48*k);
    path.LineTo(23*k, 48*k);
    path.LineTo(23*k, 46*k);
    path.LineTo(18*k, 46*k);
    path.LineTo(18*k, 43*k);
    path.LineTo(23*k, 43*k);
    path.LineTo(23*k, 41*k);
    path.LineTo(17*k, 41*k);
    path.CurveTo(16.45*k, 41*k, 16*k, 41.45*k, 16*k, 42*k);
    path.LineTo(16*k, 46*k);
    path.LineTo(14*k, 46*k);
    path.LineTo(14*k, 27.4*k);
    path.CurveTo(15.84*k, 26.95*k, 17.21*k, 25.29*k, 17.21*k, 23.32*k);
    path.CurveTo(17.21*k, 21.35*k, 15.84*k, 19.69*k, 14*k, 19.24*k);
    path.LineTo(14*k, 16*k);
    path.LineTo(66*k, 16*k);
    path.LineTo(66*k, 19.24*k);
    path.CurveTo(64.16*k, 19.69*k, 62.79*k, 21.35*k, 62.79*k, 23.32*k);
    path.CurveTo(62.79*k, 25.29*k, 64.16*k, 26.95*k, 66*k, 27.4*k);
    path.LineTo(66*k, 46*k);
    path.LineTo(64*k, 46*k);
    path.LineTo(64*k, 42*k);
    path.CurveTo(64*k, 41.45*k, 63.55*k, 41*k, 63*k, 41*k);
    path.LineTo(57*k, 41*k);
    path.LineTo(57*k, 43*k);
    path.LineTo(62*k, 43*k);
    path.LineTo(62*k, 46*k);
    path.LineTo(57*k, 46*k);
    path.LineTo(57*k, 48*k);
    path.LineTo(67*k, 48*k);
    path.CurveTo(67.55*k, 48*k, 68*k, 47.56*k, 68*k, 47*k);
    path.LineTo(68*k, 26.52*k);
    path.CurveTo(68*k, 25.97*k, 67.55*k, 25.52*k, 67*k, 25.52*k);
    path.CurveTo(65.78*k, 25.52*k, 64.79*k, 24.53*k, 64.79*k, 23.32*k);
    path.CurveTo(64.79*k, 22.11*k, 65.78*k, 21.12*k, 67*k, 21.12*k);
    path.LineTo(67*k, 21.12*k);
    path.Close();
    path.MoveTo(28*k, 28*k);
    path.LineTo(28*k, 20*k);
    path.CurveTo(28*k, 19.45*k, 27.55*k, 19*k, 27*k, 19*k);
    path.LineTo(21*k, 19*k);
    path.CurveTo(20.45*k, 19*k, 20*k, 19.45*k, 20*k, 20*k);
    path.LineTo(20*k, 37*k);
    path.CurveTo(20*k, 37.55*k, 20.45*k, 38*k, 21*k, 38*k);
    path.LineTo(24*k, 38*k);
    path.LineTo(24*k, 36*k);
    path.LineTo(22*k, 36*k);
    path.LineTo(22*k, 21*k);
    path.LineTo(26*k, 21*k);
    path.LineTo(26*k, 28*k);
    path.LineTo(28*k, 28*k);
    path.Close();
    path.MoveTo(58*k, 36*k);
    path.LineTo(57*k, 36*k);
    path.LineTo(57*k, 38*k);
    path.LineTo(59*k, 38*k);
    path.CurveTo(59.55*k, 38*k, 60*k, 37.55*k, 60*k, 37*k);
    path.LineTo(60*k, 20*k);
    path.CurveTo(60*k, 19.45*k, 59.55*k, 19*k, 59*k, 19*k);
    path.LineTo(53*k, 19*k);
    path.CurveTo(52.45*k, 19*k, 52*k, 19.45*k, 52*k, 20*k);
    path.LineTo(52*k, 28*k);
    path.LineTo(54*k, 28*k);
    path.LineTo(54*k, 21*k);
    path.LineTo(58*k, 21*k);
    path.LineTo(58*k, 36*k);
    path.Close();
    path.MoveTo(50*k, 27*k);
    path.LineTo(50*k, 20*k);
    path.CurveTo(50*k, 19.45*k, 49.55*k, 19*k, 49*k, 19*k);
    path.LineTo(42*k, 19*k);
    path.CurveTo(41.45*k, 19*k, 41*k, 19.45*k, 41*k, 20*k);
    path.LineTo(41*k, 26*k);
    path.LineTo(43*k, 26*k);
    path.LineTo(43*k, 21*k);
    path.LineTo(48*k, 21*k);
    path.LineTo(48*k, 27*k);
    path.LineTo(50*k, 27*k);
    path.Close();
    path.MoveTo(37*k, 26*k);
    path.LineTo(37*k, 21*k);
    path.LineTo(32*k, 21*k);
    path.LineTo(32*k, 27*k);
    path.LineTo(30*k, 27*k);
    path.LineTo(30*k, 20*k);
    path.CurveTo(30*k, 19.45*k, 30.45*k, 19*k, 31*k, 19*k);
    path.LineTo(38*k, 19*k);
    path.CurveTo(38.55*k, 19*k, 39*k, 19.45*k, 39*k, 20*k);
    path.LineTo(39*k, 26*k);
    path.LineTo(37*k, 26*k);
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
