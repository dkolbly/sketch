package aws;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
)

/// Amazon MSK: a Kafka broker triangle above streaming waves (managed Apache Kafka).
/// Drawn in its own frame, rect(0, 0, size, size), with the label centered below it.
/// The tile color is the `color` field (the official art, AWS-Official/.../Managed-Streaming-for-Apache-Kafka.svg, uses a gradient, here flat).
/// @component
module MSK(size=20mm, label="MSK", color="#4d27a8") {
  k = size/80;

  // tile
  path.Path() {
    path.Fill(color);
    path.MoveTo(0, 0); path.LineTo(size, 0); path.LineTo(size, size); path.LineTo(0, size); path.Close();
  }

  path.Path() {
    path.Fill("#ffffff");
    path.MoveTo(36.01*k, 36.98*k);
    path.LineTo(36.01*k, 27.99*k);
    path.LineTo(38*k, 27.99*k);
    path.LineTo(38*k, 31.98*k);
    path.LineTo(40.7*k, 27.99*k);
    path.LineTo(42.91*k, 27.99*k);
    path.LineTo(39.79*k, 32.19*k);
    path.LineTo(43.16*k, 36.98*k);
    path.LineTo(40.8*k, 36.98*k);
    path.LineTo(38*k, 32.63*k);
    path.LineTo(38*k, 36.98*k);
    path.LineTo(36.01*k, 36.98*k);
    path.Close();
    path.MoveTo(66*k, 49.12*k);
    path.LineTo(65.33*k, 49.7*k);
    path.CurveTo(63.98*k, 50.88*k, 62.17*k, 51.47*k, 60.36*k, 51.47*k);
    path.CurveTo(58.54*k, 51.47*k, 56.73*k, 50.88*k, 55.38*k, 49.69*k);
    path.LineTo(54.05*k, 48.54*k);
    path.CurveTo(52.09*k, 46.82*k, 48.67*k, 46.82*k, 46.71*k, 48.53*k);
    path.LineTo(45.37*k, 49.7*k);
    path.CurveTo(42.68*k, 52.06*k, 38.12*k, 52.06*k, 35.42*k, 49.69*k);
    path.LineTo(34.09*k, 48.54*k);
    path.CurveTo(32.13*k, 46.82*k, 28.71*k, 46.82*k, 26.75*k, 48.53*k);
    path.LineTo(25.41*k, 49.7*k);
    path.CurveTo(22.72*k, 52.06*k, 18.16*k, 52.06*k, 15.46*k, 49.69*k);
    path.LineTo(14.8*k, 49.12*k);
    path.LineTo(16.1*k, 47.61*k);
    path.LineTo(16.77*k, 48.19*k);
    path.CurveTo(18.73*k, 49.9*k, 22.15*k, 49.9*k, 24.1*k, 48.19*k);
    path.LineTo(25.44*k, 47.03*k);
    path.CurveTo(28.14*k, 44.67*k, 32.7*k, 44.67*k, 35.4*k, 47.03*k);
    path.LineTo(36.73*k, 48.19*k);
    path.CurveTo(38.69*k, 49.9*k, 42.11*k, 49.9*k, 44.06*k, 48.19*k);
    path.LineTo(45.4*k, 47.03*k);
    path.CurveTo(48.1*k, 44.67*k, 52.66*k, 44.67*k, 55.36*k, 47.03*k);
    path.LineTo(56.69*k, 48.19*k);
    path.CurveTo(58.64*k, 49.9*k, 62.07*k, 49.9*k, 64.02*k, 48.19*k);
    path.LineTo(64.69*k, 47.61*k);
    path.LineTo(66*k, 49.12*k);
    path.Close();
    path.MoveTo(63.9*k, 61.14*k);
    path.LineTo(65.2*k, 62.65*k);
    path.LineTo(64.54*k, 63.23*k);
    path.CurveTo(63.19*k, 64.41*k, 61.38*k, 65*k, 59.56*k, 65*k);
    path.CurveTo(57.75*k, 65*k, 55.93*k, 64.41*k, 54.58*k, 63.23*k);
    path.LineTo(53.25*k, 62.07*k);
    path.CurveTo(51.29*k, 60.36*k, 47.87*k, 60.36*k, 45.92*k, 62.07*k);
    path.LineTo(44.58*k, 63.23*k);
    path.CurveTo(41.89*k, 65.59*k, 37.32*k, 65.59*k, 34.62*k, 63.23*k);
    path.LineTo(33.29*k, 62.07*k);
    path.CurveTo(31.34*k, 60.36*k, 27.91*k, 60.36*k, 25.96*k, 62.07*k);
    path.LineTo(24.62*k, 63.23*k);
    path.CurveTo(21.92*k, 65.59*k, 17.36*k, 65.59*k, 14.66*k, 63.23*k);
    path.LineTo(14*k, 62.65*k);
    path.LineTo(15.31*k, 61.14*k);
    path.LineTo(15.97*k, 61.72*k);
    path.CurveTo(17.93*k, 63.43*k, 21.36*k, 63.43*k, 23.31*k, 61.72*k);
    path.LineTo(24.65*k, 60.56*k);
    path.CurveTo(27.34*k, 58.2*k, 31.9*k, 58.2*k, 34.6*k, 60.56*k);
    path.LineTo(35.93*k, 61.72*k);
    path.CurveTo(37.89*k, 63.43*k, 41.32*k, 63.43*k, 43.27*k, 61.72*k);
    path.LineTo(44.61*k, 60.56*k);
    path.CurveTo(47.3*k, 58.2*k, 51.86*k, 58.2*k, 54.56*k, 60.56*k);
    path.LineTo(55.89*k, 61.72*k);
    path.CurveTo(57.85*k, 63.43*k, 61.27*k, 63.43*k, 63.23*k, 61.72*k);
    path.LineTo(63.9*k, 61.14*k);
    path.Close();
    path.MoveTo(63.9*k, 54.81*k);
    path.LineTo(65.2*k, 56.32*k);
    path.LineTo(64.54*k, 56.9*k);
    path.CurveTo(61.84*k, 59.26*k, 57.28*k, 59.26*k, 54.58*k, 56.89*k);
    path.LineTo(53.25*k, 55.74*k);
    path.CurveTo(51.29*k, 54.02*k, 47.87*k, 54.02*k, 45.92*k, 55.73*k);
    path.LineTo(44.58*k, 56.9*k);
    path.CurveTo(43.23*k, 58.08*k, 41.42*k, 58.67*k, 39.6*k, 58.67*k);
    path.CurveTo(37.79*k, 58.67*k, 35.97*k, 58.08*k, 34.62*k, 56.89*k);
    path.LineTo(33.29*k, 55.74*k);
    path.CurveTo(31.34*k, 54.02*k, 27.91*k, 54.02*k, 25.96*k, 55.73*k);
    path.LineTo(24.62*k, 56.9*k);
    path.CurveTo(21.93*k, 59.26*k, 17.36*k, 59.26*k, 14.66*k, 56.89*k);
    path.LineTo(14*k, 56.32*k);
    path.LineTo(15.31*k, 54.81*k);
    path.LineTo(15.97*k, 55.39*k);
    path.CurveTo(17.93*k, 57.1*k, 21.36*k, 57.1*k, 23.31*k, 55.39*k);
    path.LineTo(24.65*k, 54.23*k);
    path.CurveTo(27.34*k, 51.87*k, 31.9*k, 51.87*k, 34.6*k, 54.23*k);
    path.LineTo(35.93*k, 55.38*k);
    path.CurveTo(37.89*k, 57.1*k, 41.32*k, 57.1*k, 43.27*k, 55.39*k);
    path.LineTo(44.61*k, 54.23*k);
    path.CurveTo(47.3*k, 51.87*k, 51.86*k, 51.87*k, 54.56*k, 54.23*k);
    path.LineTo(55.89*k, 55.38*k);
    path.CurveTo(57.85*k, 57.1*k, 61.27*k, 57.1*k, 63.23*k, 55.39*k);
    path.LineTo(63.9*k, 54.81*k);
    path.Close();
    path.MoveTo(24.03*k, 37.98*k);
    path.CurveTo(25.13*k, 37.98*k, 26.03*k, 38.87*k, 26.03*k, 39.97*k);
    path.CurveTo(26.03*k, 41.08*k, 25.13*k, 41.97*k, 24.03*k, 41.97*k);
    path.CurveTo(22.93*k, 41.97*k, 22.04*k, 41.08*k, 22.04*k, 39.97*k);
    path.CurveTo(22.04*k, 38.87*k, 22.93*k, 37.98*k, 24.03*k, 37.98*k);
    path.Close();
    path.MoveTo(39*k, 17*k);
    path.CurveTo(40.1*k, 17*k, 41*k, 17.89*k, 41*k, 19*k);
    path.CurveTo(41*k, 20.1*k, 40.1*k, 20.99*k, 39*k, 20.99*k);
    path.CurveTo(37.9*k, 20.99*k, 37.01*k, 20.1*k, 37.01*k, 19*k);
    path.CurveTo(37.01*k, 17.89*k, 37.9*k, 17*k, 39*k, 17*k);
    path.Close();
    path.MoveTo(55.97*k, 39.97*k);
    path.CurveTo(55.97*k, 41.08*k, 55.07*k, 41.97*k, 53.97*k, 41.97*k);
    path.CurveTo(52.87*k, 41.97*k, 51.98*k, 41.08*k, 51.98*k, 39.97*k);
    path.CurveTo(51.98*k, 38.87*k, 52.87*k, 37.98*k, 53.97*k, 37.98*k);
    path.CurveTo(55.07*k, 37.98*k, 55.97*k, 38.87*k, 55.97*k, 39.97*k);
    path.Close();
    path.MoveTo(39*k, 22.99*k);
    path.CurveTo(39.67*k, 22.99*k, 40.29*k, 22.81*k, 40.84*k, 22.52*k);
    path.LineTo(51*k, 37.33*k);
    path.CurveTo(50.59*k, 37.79*k, 50.28*k, 38.35*k, 50.12*k, 38.98*k);
    path.LineTo(27.88*k, 38.98*k);
    path.CurveTo(27.72*k, 38.35*k, 27.42*k, 37.79*k, 27*k, 37.33*k);
    path.LineTo(37.17*k, 22.52*k);
    path.CurveTo(37.72*k, 22.81*k, 38.34*k, 22.99*k, 39*k, 22.99*k);
    path.Close();
    path.MoveTo(24.03*k, 43.97*k);
    path.CurveTo(25.89*k, 43.97*k, 27.44*k, 42.69*k, 27.88*k, 40.97*k);
    path.LineTo(50.12*k, 40.97*k);
    path.CurveTo(50.57*k, 42.69*k, 52.12*k, 43.97*k, 53.97*k, 43.97*k);
    path.CurveTo(56.17*k, 43.97*k, 57.96*k, 42.18*k, 57.96*k, 39.97*k);
    path.CurveTo(57.96*k, 37.77*k, 56.17*k, 35.98*k, 53.97*k, 35.98*k);
    path.CurveTo(53.51*k, 35.98*k, 53.08*k, 36.07*k, 52.66*k, 36.22*k);
    path.LineTo(42.34*k, 21.18*k);
    path.CurveTo(42.75*k, 20.55*k, 42.99*k, 19.8*k, 42.99*k, 19*k);
    path.CurveTo(42.99*k, 16.79*k, 41.2*k, 15*k, 39*k, 15*k);
    path.CurveTo(36.8*k, 15*k, 35.01*k, 16.79*k, 35.01*k, 19*k);
    path.CurveTo(35.01*k, 19.8*k, 35.25*k, 20.55*k, 35.67*k, 21.18*k);
    path.LineTo(25.34*k, 36.22*k);
    path.CurveTo(24.93*k, 36.07*k, 24.49*k, 35.98*k, 24.03*k, 35.98*k);
    path.CurveTo(21.83*k, 35.98*k, 20.04*k, 37.77*k, 20.04*k, 39.97*k);
    path.CurveTo(20.04*k, 42.18*k, 21.83*k, 43.97*k, 24.03*k, 43.97*k);
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
