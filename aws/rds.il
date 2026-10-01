package aws;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
)

/// Amazon RDS: a database cylinder with resize arrows (relational database).
/// Drawn in its own frame, rect(0, 0, size, size), with the label centered below it.
/// The tile color is the `color` field (the official art uses a gradient, here flat).
/// @component
module RDS(size=20mm, label="RDS", color="#2e27ad") {
  k = size/80;

  // tile
  path.Path() {
    path.Fill(color);
    path.MoveTo(0, 0); path.LineTo(size, 0); path.LineTo(size, size); path.LineTo(0, size); path.Close();
  }

  path.Path() {
    path.Fill("#ffffff");
    path.MoveTo(15.41*k, 14*k);
    path.LineTo(24.71*k, 23.29*k);
    path.LineTo(23.29*k, 24.71*k);
    path.LineTo(14*k, 15.41*k);
    path.LineTo(14*k, 23*k);
    path.LineTo(12*k, 23*k);
    path.LineTo(12*k, 13*k);
    path.CurveTo(12*k, 12.45*k, 12.45*k, 12*k, 13*k, 12*k);
    path.LineTo(23*k, 12*k);
    path.LineTo(23*k, 14*k);
    path.LineTo(15.41*k, 14*k);
    path.Close();
    path.MoveTo(68*k, 13*k);
    path.LineTo(68*k, 23*k);
    path.LineTo(66*k, 23*k);
    path.LineTo(66*k, 15.41*k);
    path.LineTo(56.71*k, 24.71*k);
    path.LineTo(55.29*k, 23.29*k);
    path.LineTo(64.59*k, 14*k);
    path.LineTo(57*k, 14*k);
    path.LineTo(57*k, 12*k);
    path.LineTo(67*k, 12*k);
    path.CurveTo(67.55*k, 12*k, 68*k, 12.45*k, 68*k, 13*k);
    path.LineTo(68*k, 13*k);
    path.Close();
    path.MoveTo(66*k, 57*k);
    path.LineTo(68*k, 57*k);
    path.LineTo(68*k, 67*k);
    path.CurveTo(68*k, 67.55*k, 67.55*k, 68*k, 67*k, 68*k);
    path.LineTo(57*k, 68*k);
    path.LineTo(57*k, 66*k);
    path.LineTo(64.59*k, 66*k);
    path.LineTo(55.29*k, 56.71*k);
    path.LineTo(56.71*k, 55.29*k);
    path.LineTo(66*k, 64.59*k);
    path.LineTo(66*k, 57*k);
    path.Close();
    path.MoveTo(65.5*k, 39.21*k);
    path.CurveTo(65.5*k, 35.89*k, 61.67*k, 32.62*k, 55.25*k, 30.44*k);
    path.LineTo(55.89*k, 28.55*k);
    path.CurveTo(63.27*k, 31.05*k, 67.5*k, 34.93*k, 67.5*k, 39.21*k);
    path.CurveTo(67.5*k, 43.49*k, 63.27*k, 47.38*k, 55.89*k, 49.88*k);
    path.LineTo(55.25*k, 47.98*k);
    path.CurveTo(61.67*k, 45.81*k, 65.5*k, 42.53*k, 65.5*k, 39.21*k);
    path.LineTo(65.5*k, 39.21*k);
    path.Close();
    path.MoveTo(14.56*k, 39.21*k);
    path.CurveTo(14.56*k, 42.39*k, 18.14*k, 45.59*k, 24.15*k, 47.75*k);
    path.LineTo(23.47*k, 49.63*k);
    path.CurveTo(16.54*k, 47.13*k, 12.56*k, 43.33*k, 12.56*k, 39.21*k);
    path.CurveTo(12.56*k, 35.09*k, 16.54*k, 31.3*k, 23.47*k, 28.79*k);
    path.LineTo(24.15*k, 30.67*k);
    path.CurveTo(18.14*k, 32.84*k, 14.56*k, 36.03*k, 14.56*k, 39.21*k);
    path.LineTo(14.56*k, 39.21*k);
    path.Close();
    path.MoveTo(24.71*k, 56.71*k);
    path.LineTo(15.41*k, 66*k);
    path.LineTo(23*k, 66*k);
    path.LineTo(23*k, 68*k);
    path.LineTo(13*k, 68*k);
    path.CurveTo(12.45*k, 68*k, 12*k, 67.55*k, 12*k, 67*k);
    path.LineTo(12*k, 57*k);
    path.LineTo(14*k, 57*k);
    path.LineTo(14*k, 64.59*k);
    path.LineTo(23.29*k, 55.29*k);
    path.LineTo(24.71*k, 56.71*k);
    path.Close();
    path.MoveTo(40*k, 31.29*k);
    path.CurveTo(32.85*k, 31.29*k, 29*k, 29.44*k, 29*k, 28.69*k);
    path.CurveTo(29*k, 27.93*k, 32.85*k, 26.09*k, 40*k, 26.09*k);
    path.CurveTo(47.15*k, 26.09*k, 51*k, 27.93*k, 51*k, 28.69*k);
    path.CurveTo(51*k, 29.44*k, 47.15*k, 31.29*k, 40*k, 31.29*k);
    path.LineTo(40*k, 31.29*k);
    path.Close();
    path.MoveTo(40.03*k, 39.03*k);
    path.CurveTo(33.19*k, 39.03*k, 29*k, 37.16*k, 29*k, 36.15*k);
    path.LineTo(29*k, 31.28*k);
    path.CurveTo(31.46*k, 32.64*k, 35.83*k, 33.29*k, 40*k, 33.29*k);
    path.CurveTo(44.17*k, 33.29*k, 48.54*k, 32.64*k, 51*k, 31.28*k);
    path.LineTo(51*k, 36.15*k);
    path.CurveTo(51*k, 37.16*k, 46.84*k, 39.03*k, 40.03*k, 39.03*k);
    path.LineTo(40.03*k, 39.03*k);
    path.Close();
    path.MoveTo(40.03*k, 46.67*k);
    path.CurveTo(33.19*k, 46.67*k, 29*k, 44.8*k, 29*k, 43.78*k);
    path.LineTo(29*k, 38.86*k);
    path.CurveTo(31.43*k, 40.29*k, 35.74*k, 41.03*k, 40.03*k, 41.03*k);
    path.CurveTo(44.29*k, 41.03*k, 48.58*k, 40.29*k, 51*k, 38.87*k);
    path.LineTo(51*k, 43.78*k);
    path.CurveTo(51*k, 44.8*k, 46.84*k, 46.67*k, 40.03*k, 46.67*k);
    path.LineTo(40.03*k, 46.67*k);
    path.Close();
    path.MoveTo(40*k, 53.52*k);
    path.CurveTo(32.88*k, 53.52*k, 29*k, 51.6*k, 29*k, 50.62*k);
    path.LineTo(29*k, 46.5*k);
    path.CurveTo(31.43*k, 47.93*k, 35.74*k, 48.67*k, 40.03*k, 48.67*k);
    path.CurveTo(44.29*k, 48.67*k, 48.58*k, 47.93*k, 51*k, 46.5*k);
    path.LineTo(51*k, 50.62*k);
    path.CurveTo(51*k, 51.6*k, 47.12*k, 53.52*k, 40*k, 53.52*k);
    path.LineTo(40*k, 53.52*k);
    path.Close();
    path.MoveTo(40*k, 24.09*k);
    path.CurveTo(33.74*k, 24.09*k, 27*k, 25.52*k, 27*k, 28.69*k);
    path.LineTo(27*k, 50.62*k);
    path.CurveTo(27*k, 53.84*k, 33.54*k, 55.52*k, 40*k, 55.52*k);
    path.CurveTo(46.46*k, 55.52*k, 53*k, 53.84*k, 53*k, 50.62*k);
    path.LineTo(53*k, 28.69*k);
    path.CurveTo(53*k, 25.52*k, 46.26*k, 24.09*k, 40*k, 24.09*k);
    path.LineTo(40*k, 24.09*k);
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
