package aws;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
)

// Amazon S3: a bucket (object storage).
// Drawn in its own frame, rect(0, 0, size, size), with the label centered below it.
// The tile color is the `color` field (the official art uses a gradient, here flat).
module S3(size=20mm, label="S3", color="#1b660f") {
  k = size/80;

  // tile
  path.Path() {
    path.Fill(color);
    path.MoveTo(0, 0); path.LineTo(size, 0); path.LineTo(size, size); path.LineTo(0, size); path.Close();
  }

  path.Path() {
    path.Fill("#ffffff");
    path.MoveTo(60.84*k, 42.89*k);
    path.LineTo(61.22*k, 40.19*k);
    path.CurveTo(64.76*k, 42.31*k, 64.81*k, 43.19*k, 64.81*k, 43.21*k);
    path.CurveTo(64.8*k, 43.21*k, 64.2*k, 43.72*k, 60.84*k, 42.89*k);
    path.LineTo(60.84*k, 42.89*k);
    path.Close();
    path.MoveTo(58.89*k, 42.35*k);
    path.CurveTo(52.77*k, 40.5*k, 44.25*k, 36.59*k, 40.8*k, 34.96*k);
    path.CurveTo(40.8*k, 34.95*k, 40.8*k, 34.93*k, 40.8*k, 34.92*k);
    path.CurveTo(40.8*k, 33.59*k, 39.73*k, 32.52*k, 38.4*k, 32.52*k);
    path.CurveTo(37.08*k, 32.52*k, 36*k, 33.59*k, 36*k, 34.92*k);
    path.CurveTo(36*k, 36.24*k, 37.08*k, 37.32*k, 38.4*k, 37.32*k);
    path.CurveTo(38.98*k, 37.32*k, 39.51*k, 37.11*k, 39.93*k, 36.76*k);
    path.CurveTo(43.99*k, 38.68*k, 52.44*k, 42.53*k, 58.61*k, 44.35*k);
    path.LineTo(56.17*k, 61.56*k);
    path.CurveTo(56.16*k, 61.61*k, 56.16*k, 61.65*k, 56.16*k, 61.7*k);
    path.CurveTo(56.16*k, 63.22*k, 49.45*k, 66*k, 38.49*k, 66*k);
    path.CurveTo(27.42*k, 66*k, 20.64*k, 63.22*k, 20.64*k, 61.7*k);
    path.CurveTo(20.64*k, 61.66*k, 20.64*k, 61.61*k, 20.63*k, 61.57*k);
    path.LineTo(15.54*k, 24.36*k);
    path.CurveTo(19.95*k, 27.39*k, 29.43*k, 29*k, 38.5*k, 29*k);
    path.CurveTo(47.56*k, 29*k, 57.02*k, 27.4*k, 61.44*k, 24.37*k);
    path.LineTo(58.89*k, 42.35*k);
    path.Close();
    path.MoveTo(15*k, 20.48*k);
    path.CurveTo(15.07*k, 19.16*k, 22.63*k, 14*k, 38.5*k, 14*k);
    path.CurveTo(54.36*k, 14*k, 61.93*k, 19.16*k, 62*k, 20.48*k);
    path.LineTo(62*k, 20.93*k);
    path.CurveTo(61.13*k, 23.88*k, 51.33*k, 27*k, 38.5*k, 27*k);
    path.CurveTo(25.65*k, 27*k, 15.84*k, 23.87*k, 15*k, 20.91*k);
    path.LineTo(15*k, 20.48*k);
    path.Close();
    path.MoveTo(64*k, 20.5*k);
    path.CurveTo(64*k, 17.03*k, 54.07*k, 12*k, 38.5*k, 12*k);
    path.CurveTo(22.93*k, 12*k, 13*k, 17.03*k, 13*k, 20.5*k);
    path.LineTo(13.09*k, 21.25*k);
    path.LineTo(18.64*k, 61.78*k);
    path.CurveTo(18.77*k, 66.31*k, 30.86*k, 68*k, 38.49*k, 68*k);
    path.CurveTo(47.97*k, 68*k, 58.03*k, 65.82*k, 58.16*k, 61.78*k);
    path.LineTo(60.55*k, 44.88*k);
    path.CurveTo(61.89*k, 45.2*k, 62.98*k, 45.37*k, 63.87*k, 45.37*k);
    path.CurveTo(65.05*k, 45.37*k, 65.85*k, 45.08*k, 66.33*k, 44.5*k);
    path.CurveTo(66.73*k, 44.02*k, 66.88*k, 43.45*k, 66.77*k, 42.84*k);
    path.CurveTo(66.51*k, 41.46*k, 64.87*k, 39.96*k, 61.52*k, 38.05*k);
    path.LineTo(63.9*k, 21.29*k);
    path.LineTo(64*k, 20.5*k);
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
