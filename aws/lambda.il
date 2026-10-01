package aws;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
)

/// AWS Lambda, drawn in its own frame, rect(0, 0, size, size), with the label centered below it.
/// @component
module Lambda(size=20mm, label="Lambda", color="#c8511b") {
  k = size/80;

  // tile
  path.Path() {
    path.Fill(color);
    path.MoveTo(0, 0); path.LineTo(size, 0); path.LineTo(size, size); path.LineTo(0, size); path.Close();
  }

  path.Path() {
    path.Fill("#ffffff");
    path.MoveTo(28.01*k, 66*k);
    path.LineTo(15.59*k, 66*k);
    path.LineTo(29.32*k, 37.3*k);
    path.LineTo(35.55*k, 50.11*k);
    path.LineTo(28.01*k, 66*k);
    path.Close();
    path.MoveTo(30.22*k, 34.55*k);
    path.CurveTo(30.05*k, 34.21*k, 29.7*k, 33.99*k, 29.32*k, 33.99*k);
    path.LineTo(29.31*k, 33.99*k);
    path.CurveTo(28.93*k, 33.99*k, 28.58*k, 34.21*k, 28.41*k, 34.56*k);
    path.LineTo(13.1*k, 66.57*k);
    path.CurveTo(12.95*k, 66.88*k, 12.97*k, 67.24*k, 13.16*k, 67.53*k);
    path.CurveTo(13.34*k, 67.82*k, 13.66*k, 68*k, 14*k, 68*k);
    path.LineTo(28.64*k, 68*k);
    path.CurveTo(29.03*k, 68*k, 29.38*k, 67.78*k, 29.55*k, 67.43*k);
    path.LineTo(37.56*k, 50.53*k);
    path.CurveTo(37.69*k, 50.25*k, 37.69*k, 49.94*k, 37.56*k, 49.66*k);
    path.LineTo(30.22*k, 34.55*k);
    path.Close();
    path.MoveTo(65*k, 66*k);
    path.LineTo(52.66*k, 66*k);
    path.LineTo(32.87*k, 24.57*k);
    path.CurveTo(32.7*k, 24.22*k, 32.35*k, 24*k, 31.96*k, 24*k);
    path.LineTo(23.89*k, 24*k);
    path.LineTo(23.9*k, 14*k);
    path.LineTo(39.72*k, 14*k);
    path.LineTo(59.42*k, 55.43*k);
    path.CurveTo(59.59*k, 55.78*k, 59.94*k, 56*k, 60.33*k, 56*k);
    path.LineTo(65*k, 56*k);
    path.LineTo(65*k, 66*k);
    path.Close();
    path.MoveTo(66*k, 54*k);
    path.LineTo(60.96*k, 54*k);
    path.LineTo(41.26*k, 12.57*k);
    path.CurveTo(41.09*k, 12.22*k, 40.74*k, 12*k, 40.35*k, 12*k);
    path.LineTo(22.9*k, 12*k);
    path.CurveTo(22.35*k, 12*k, 21.9*k, 12.45*k, 21.9*k, 13*k);
    path.LineTo(21.88*k, 25*k);
    path.CurveTo(21.88*k, 25.27*k, 21.99*k, 25.52*k, 22.18*k, 25.71*k);
    path.CurveTo(22.37*k, 25.89*k, 22.62*k, 26*k, 22.89*k, 26*k);
    path.LineTo(31.33*k, 26*k);
    path.LineTo(51.12*k, 67.43*k);
    path.CurveTo(51.29*k, 67.78*k, 51.64*k, 68*k, 52.03*k, 68*k);
    path.LineTo(66*k, 68*k);
    path.CurveTo(66.55*k, 68*k, 67*k, 67.55*k, 67*k, 67*k);
    path.LineTo(67*k, 55*k);
    path.CurveTo(67*k, 54.45*k, 66.55*k, 54*k, 66*k, 54*k);
    path.LineTo(66*k, 54*k);
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
