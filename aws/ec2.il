package aws;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
)

// Amazon EC2: a chip with its offset copy (virtual servers).
// Drawn in its own frame, rect(0, 0, size, size), with the label centered below it.
// The tile color is the `color` field (the official art uses a gradient, here flat).
module EC2(size=20mm, label="EC2", color="#c8511b") {
  k = size/80;

  // tile
  path.Path() {
    path.Fill(color);
    path.MoveTo(0, 0); path.LineTo(size, 0); path.LineTo(size, size); path.LineTo(0, size); path.Close();
  }

  path.Path() {
    path.Fill("#ffffff");
    path.MoveTo(27*k, 53*k);
    path.LineTo(52*k, 53*k);
    path.LineTo(52*k, 28*k);
    path.LineTo(27*k, 28*k);
    path.LineTo(27*k, 53*k);
    path.Close();
    path.MoveTo(54*k, 28*k);
    path.LineTo(58*k, 28*k);
    path.LineTo(58*k, 30*k);
    path.LineTo(54*k, 30*k);
    path.LineTo(54*k, 34*k);
    path.LineTo(58*k, 34*k);
    path.LineTo(58*k, 36*k);
    path.LineTo(54*k, 36*k);
    path.LineTo(54*k, 39*k);
    path.LineTo(58*k, 39*k);
    path.LineTo(58*k, 41*k);
    path.LineTo(54*k, 41*k);
    path.LineTo(54*k, 45*k);
    path.LineTo(58*k, 45*k);
    path.LineTo(58*k, 47*k);
    path.LineTo(54*k, 47*k);
    path.LineTo(54*k, 51*k);
    path.LineTo(58*k, 51*k);
    path.LineTo(58*k, 53*k);
    path.LineTo(54*k, 53*k);
    path.LineTo(54*k, 53.14*k);
    path.CurveTo(54*k, 54.16*k, 53.16*k, 55*k, 52.14*k, 55*k);
    path.LineTo(52*k, 55*k);
    path.LineTo(52*k, 59*k);
    path.LineTo(50*k, 59*k);
    path.LineTo(50*k, 55*k);
    path.LineTo(46*k, 55*k);
    path.LineTo(46*k, 59*k);
    path.LineTo(44*k, 59*k);
    path.LineTo(44*k, 55*k);
    path.LineTo(41*k, 55*k);
    path.LineTo(41*k, 59*k);
    path.LineTo(39*k, 59*k);
    path.LineTo(39*k, 55*k);
    path.LineTo(35*k, 55*k);
    path.LineTo(35*k, 59*k);
    path.LineTo(33*k, 59*k);
    path.LineTo(33*k, 55*k);
    path.LineTo(29*k, 55*k);
    path.LineTo(29*k, 59*k);
    path.LineTo(27*k, 59*k);
    path.LineTo(27*k, 55*k);
    path.LineTo(26.86*k, 55*k);
    path.CurveTo(25.84*k, 55*k, 25*k, 54.16*k, 25*k, 53.14*k);
    path.LineTo(25*k, 53*k);
    path.LineTo(22*k, 53*k);
    path.LineTo(22*k, 51*k);
    path.LineTo(25*k, 51*k);
    path.LineTo(25*k, 47*k);
    path.LineTo(22*k, 47*k);
    path.LineTo(22*k, 45*k);
    path.LineTo(25*k, 45*k);
    path.LineTo(25*k, 41*k);
    path.LineTo(22*k, 41*k);
    path.LineTo(22*k, 39*k);
    path.LineTo(25*k, 39*k);
    path.LineTo(25*k, 36*k);
    path.LineTo(22*k, 36*k);
    path.LineTo(22*k, 34*k);
    path.LineTo(25*k, 34*k);
    path.LineTo(25*k, 30*k);
    path.LineTo(22*k, 30*k);
    path.LineTo(22*k, 28*k);
    path.LineTo(25*k, 28*k);
    path.LineTo(25*k, 27.86*k);
    path.CurveTo(25*k, 26.84*k, 25.84*k, 26*k, 26.86*k, 26*k);
    path.LineTo(27*k, 26*k);
    path.LineTo(27*k, 22*k);
    path.LineTo(29*k, 22*k);
    path.LineTo(29*k, 26*k);
    path.LineTo(33*k, 26*k);
    path.LineTo(33*k, 22*k);
    path.LineTo(35*k, 22*k);
    path.LineTo(35*k, 26*k);
    path.LineTo(39*k, 26*k);
    path.LineTo(39*k, 22*k);
    path.LineTo(41*k, 22*k);
    path.LineTo(41*k, 26*k);
    path.LineTo(44*k, 26*k);
    path.LineTo(44*k, 22*k);
    path.LineTo(46*k, 22*k);
    path.LineTo(46*k, 26*k);
    path.LineTo(50*k, 26*k);
    path.LineTo(50*k, 22*k);
    path.LineTo(52*k, 22*k);
    path.LineTo(52*k, 26*k);
    path.LineTo(52.14*k, 26*k);
    path.CurveTo(53.16*k, 26*k, 54*k, 26.84*k, 54*k, 27.86*k);
    path.LineTo(54*k, 28*k);
    path.Close();
    path.MoveTo(41*k, 65.88*k);
    path.CurveTo(41*k, 65.94*k, 40.94*k, 66*k, 40.88*k, 66*k);
    path.LineTo(14.12*k, 66*k);
    path.CurveTo(14.06*k, 66*k, 14*k, 65.94*k, 14*k, 65.88*k);
    path.LineTo(14*k, 39.12*k);
    path.CurveTo(14*k, 39.06*k, 14.06*k, 39*k, 14.12*k, 39*k);
    path.LineTo(20*k, 39*k);
    path.LineTo(20*k, 37*k);
    path.LineTo(14.12*k, 37*k);
    path.CurveTo(12.95*k, 37*k, 12*k, 37.95*k, 12*k, 39.12*k);
    path.LineTo(12*k, 65.88*k);
    path.CurveTo(12*k, 67.05*k, 12.95*k, 68*k, 14.12*k, 68*k);
    path.LineTo(40.88*k, 68*k);
    path.CurveTo(42.05*k, 68*k, 43*k, 67.05*k, 43*k, 65.88*k);
    path.LineTo(43*k, 61*k);
    path.LineTo(41*k, 61*k);
    path.LineTo(41*k, 65.88*k);
    path.Close();
    path.MoveTo(68*k, 14.12*k);
    path.LineTo(68*k, 40.88*k);
    path.CurveTo(68*k, 42.05*k, 67.05*k, 43*k, 65.88*k, 43*k);
    path.LineTo(60*k, 43*k);
    path.LineTo(60*k, 41*k);
    path.LineTo(65.88*k, 41*k);
    path.CurveTo(65.94*k, 41*k, 66*k, 40.94*k, 66*k, 40.88*k);
    path.LineTo(66*k, 14.12*k);
    path.CurveTo(66*k, 14.06*k, 65.94*k, 14*k, 65.88*k, 14*k);
    path.LineTo(39.12*k, 14*k);
    path.CurveTo(39.06*k, 14*k, 39*k, 14.06*k, 39*k, 14.12*k);
    path.LineTo(39*k, 20*k);
    path.LineTo(37*k, 20*k);
    path.LineTo(37*k, 14.12*k);
    path.CurveTo(37*k, 12.95*k, 37.95*k, 12*k, 39.12*k, 12*k);
    path.LineTo(65.88*k, 12*k);
    path.CurveTo(67.05*k, 12*k, 68*k, 12.95*k, 68*k, 14.12*k);
    path.LineTo(68*k, 14.12*k);
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
