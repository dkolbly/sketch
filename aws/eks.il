package aws;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
)

/// Amazon EKS: nested hexagonal brackets around a K (managed Kubernetes).
/// Drawn in its own frame, rect(0, 0, size, size), with the label centered below it.
/// The tile color is the `color` field (the official art, AWS-Official/.../Elastic-Kubernetes-Service.svg, uses a gradient, here flat).
/// @component
module EKS(size=20mm, label="EKS", color="#c8511b") {
  k = size/80;

  // tile
  path.Path() {
    path.Fill(color);
    path.MoveTo(0, 0); path.LineTo(size, 0); path.LineTo(size, size); path.LineTo(0, size); path.Close();
  }

  path.Path() {
    path.Fill("#ffffff");
    path.MoveTo(46.84*k, 32.2*k);
    path.LineTo(40.01*k, 40.12*k);
    path.LineTo(47.44*k, 48.78*k);
    path.LineTo(44.67*k, 48.78*k);
    path.LineTo(38*k, 41*k);
    path.LineTo(38*k, 49*k);
    path.LineTo(36*k, 49*k);
    path.LineTo(36*k, 32*k);
    path.LineTo(38*k, 32*k);
    path.LineTo(38*k, 39*k);
    path.LineTo(44.18*k, 32.2*k);
    path.LineTo(46.84*k, 32.2*k);
    path.Close();
    path.MoveTo(64*k, 48.23*k);
    path.LineTo(56*k, 43.43*k);
    path.LineTo(56*k, 32*k);
    path.CurveTo(56*k, 31.64*k, 55.81*k, 31.32*k, 55.5*k, 31.14*k);
    path.LineTo(44*k, 24.43*k);
    path.LineTo(44*k, 14.75*k);
    path.LineTo(64*k, 26.57*k);
    path.LineTo(64*k, 48.23*k);
    path.Close();
    path.MoveTo(65.51*k, 25.14*k);
    path.LineTo(43.51*k, 12.14*k);
    path.CurveTo(43.2*k, 11.96*k, 42.82*k, 11.95*k, 42.5*k, 12.13*k);
    path.CurveTo(42.19*k, 12.31*k, 42*k, 12.64*k, 42*k, 13*k);
    path.LineTo(42*k, 25*k);
    path.CurveTo(42*k, 25.36*k, 42.19*k, 25.68*k, 42.5*k, 25.86*k);
    path.LineTo(54*k, 32.57*k);
    path.LineTo(54*k, 44*k);
    path.CurveTo(54*k, 44.35*k, 54.19*k, 44.68*k, 54.49*k, 44.86*k);
    path.LineTo(64.49*k, 50.86*k);
    path.CurveTo(64.64*k, 50.95*k, 64.82*k, 51*k, 65*k, 51*k);
    path.CurveTo(65.17*k, 51*k, 65.34*k, 50.96*k, 65.49*k, 50.87*k);
    path.CurveTo(65.81*k, 50.69*k, 66*k, 50.36*k, 66*k, 50*k);
    path.LineTo(66*k, 26*k);
    path.CurveTo(66*k, 25.65*k, 65.81*k, 25.32*k, 65.51*k, 25.14*k);
    path.Close();
    path.MoveTo(40.45*k, 66.86*k);
    path.LineTo(17*k, 54.4*k);
    path.LineTo(17*k, 26.57*k);
    path.LineTo(37*k, 14.75*k);
    path.LineTo(37*k, 24.45*k);
    path.LineTo(26.46*k, 31.16*k);
    path.CurveTo(26.18*k, 31.34*k, 26*k, 31.66*k, 26*k, 32*k);
    path.LineTo(26*k, 49*k);
    path.CurveTo(26*k, 49.37*k, 26.21*k, 49.72*k, 26.54*k, 49.89*k);
    path.LineTo(39.99*k, 56.89*k);
    path.CurveTo(40.28*k, 57.04*k, 40.62*k, 57.04*k, 40.91*k, 56.89*k);
    path.LineTo(53.96*k, 50.14*k);
    path.LineTo(62*k, 54.96*k);
    path.LineTo(40.45*k, 66.86*k);
    path.Close();
    path.MoveTo(64.52*k, 54.14*k);
    path.LineTo(54.52*k, 48.14*k);
    path.CurveTo(54.22*k, 47.96*k, 53.85*k, 47.95*k, 53.54*k, 48.11*k);
    path.LineTo(40.45*k, 54.87*k);
    path.LineTo(28*k, 48.39*k);
    path.LineTo(28*k, 32.55*k);
    path.LineTo(38.54*k, 25.84*k);
    path.CurveTo(38.83*k, 25.66*k, 39*k, 25.34*k, 39*k, 25*k);
    path.LineTo(39*k, 13*k);
    path.CurveTo(39*k, 12.64*k, 38.81*k, 12.31*k, 38.5*k, 12.13*k);
    path.CurveTo(38.18*k, 11.95*k, 37.8*k, 11.96*k, 37.49*k, 12.14*k);
    path.LineTo(15.49*k, 25.14*k);
    path.CurveTo(15.19*k, 25.32*k, 15*k, 25.65*k, 15*k, 26*k);
    path.LineTo(15*k, 55*k);
    path.CurveTo(15*k, 55.37*k, 15.2*k, 55.71*k, 15.53*k, 55.88*k);
    path.LineTo(39.98*k, 68.88*k);
    path.CurveTo(40.13*k, 68.96*k, 40.29*k, 69*k, 40.45*k, 69*k);
    path.CurveTo(40.62*k, 69*k, 40.79*k, 68.96*k, 40.94*k, 68.88*k);
    path.LineTo(64.48*k, 55.88*k);
    path.CurveTo(64.8*k, 55.7*k, 64.99*k, 55.38*k, 65*k, 55.02*k);
    path.CurveTo(65.01*k, 54.66*k, 64.82*k, 54.33*k, 64.52*k, 54.14*k);
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
