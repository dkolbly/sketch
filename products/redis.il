/// Product logos: recognizable marks of software products.
/// @title Products
package products;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
)

/// Redis: the stacked red cube logo, drawn in its own frame, rect(0, 0, size, 0.859*size), with the label centered below it.
/// Converted from redis.svg (art units 256 x 220 scaled to the frame).
/// @component
/// @frame 1 0.859
module Redis(size=20mm, label="Redis") {
  k = size/256;

  path.Path() {
    path.Fill("#912626");
    path.MoveTo(246*k, 169*k);
    path.CurveTo(232.3*k, 176*k, 161.5*k, 205.2*k, 146.5*k, 213*k);
    path.CurveTo(131.4*k, 220.9*k, 123*k, 220.8*k, 111.1*k, 215.1*k);
    path.CurveTo(99.2*k, 209.4*k, 24*k, 179*k, 10.3*k, 172.5*k);
    path.CurveTo(3.6*k, 169.3*k, 0, 166.5*k, 0, 164*k);
    path.LineTo(0, 138*k);
    path.CurveTo(0, 138*k, 98*k, 116.7*k, 113.9*k, 111*k);
    path.CurveTo(129.7*k, 105.4*k, 135.2*k, 105.2*k, 148.7*k, 110.1*k);
    path.CurveTo(162.1*k, 115.1*k, 242.7*k, 129.6*k, 256*k, 134.4*k);
    path.LineTo(256*k, 160*k);
    path.CurveTo(256*k, 162.5*k, 253*k, 165.3*k, 246*k, 169*k);
  }

  path.Path() {
    path.Fill("#c6302b");
    path.MoveTo(246*k, 143.2*k);
    path.CurveTo(232.3*k, 150.3*k, 161.5*k, 179.4*k, 146.5*k, 187.2*k);
    path.CurveTo(131.4*k, 195.2*k, 123*k, 195.1*k, 111.1*k, 189.4*k);
    path.CurveTo(99.2*k, 183.7*k, 23.9*k, 153.3*k, 10.3*k, 146.8*k);
    path.CurveTo(-3.2*k, 140.3*k, -3.5*k, 135.8*k, 9.8*k, 130.6*k);
    path.CurveTo(23.2*k, 125.4*k, 98*k, 96*k, 113.8*k, 90.3*k);
    path.CurveTo(129.8*k, 84.7*k, 135.2*k, 84.5*k, 148.7*k, 89.3*k);
    path.CurveTo(162.1*k, 94.3*k, 232.5*k, 122.3*k, 245.8*k, 127.2*k);
    path.CurveTo(259.1*k, 132.1*k, 259.6*k, 136.1*k, 246*k, 143.2*k);
  }

  path.Path() {
    path.Fill("#912626");
    path.MoveTo(246*k, 127*k);
    path.CurveTo(232.3*k, 134.2*k, 161.5*k, 163.3*k, 146.5*k, 171.2*k);
    path.CurveTo(131.4*k, 179*k, 123*k, 178.9*k, 111.1*k, 173.2*k);
    path.CurveTo(99.2*k, 167.6*k, 23.9*k, 137.2*k, 10.3*k, 130.6*k);
    path.CurveTo(3.6*k, 127.4*k, 0, 124.6*k, 0, 122.1*k);
    path.LineTo(0, 96.2*k);
    path.CurveTo(0, 96.2*k, 98*k, 74.9*k, 113.9*k, 69.2*k);
    path.CurveTo(129.7*k, 63.5*k, 135.2*k, 63.3*k, 148.7*k, 68.2*k);
    path.CurveTo(162.1*k, 73.2*k, 242.7*k, 87.7*k, 256*k, 92.6*k);
    path.LineTo(256*k, 118*k);
    path.CurveTo(256*k, 120.5*k, 253*k, 123.4*k, 246*k, 127*k);
  }

  path.Path() {
    path.Fill("#c6302b");
    path.MoveTo(246*k, 101.4*k);
    path.CurveTo(232.3*k, 108.4*k, 161.5*k, 137.6*k, 146.5*k, 145.4*k);
    path.CurveTo(131.4*k, 153.3*k, 123*k, 153.2*k, 111.1*k, 147.5*k);
    path.CurveTo(99.2*k, 141.8*k, 24*k, 111.4*k, 10.3*k, 105*k);
    path.CurveTo(-3.2*k, 98.5*k, -3.5*k, 94*k, 9.8*k, 88.9*k);
    path.CurveTo(23.2*k, 83.5*k, 98*k, 54*k, 113.8*k, 48.5*k);
    path.CurveTo(129.8*k, 42.8*k, 135.2*k, 42.5*k, 148.7*k, 47.5*k);
    path.CurveTo(162.1*k, 52.5*k, 232.5*k, 80.5*k, 245.8*k, 85.3*k);
    path.CurveTo(259.1*k, 90.3*k, 259.6*k, 94.3*k, 246*k, 101.3*k);
  }

  path.Path() {
    path.Fill("#912626");
    path.MoveTo(246*k, 83.7*k);
    path.CurveTo(232.3*k, 90.7*k, 161.5*k, 119.9*k, 146.5*k, 127.7*k);
    path.CurveTo(131.4*k, 135.6*k, 123*k, 135.5*k, 111.1*k, 129.8*k);
    path.CurveTo(99.2*k, 124.1*k, 24*k, 93.7*k, 10.3*k, 87.2*k);
    path.CurveTo(3.6*k, 84*k, 0, 81.2*k, 0, 78.7*k);
    path.LineTo(0, 52.7*k);
    path.CurveTo(0, 52.7*k, 98*k, 31.4*k, 113.9*k, 25.7*k);
    path.CurveTo(129.7*k, 20.1*k, 135.2*k, 19.9*k, 148.7*k, 24.8*k);
    path.CurveTo(162.1*k, 29.8*k, 242.7*k, 44.3*k, 256*k, 49.2*k);
    path.LineTo(256*k, 74.7*k);
    path.CurveTo(256*k, 77.2*k, 253*k, 80*k, 246*k, 83.7*k);
  }

  path.Path() {
    path.Fill("#c6302b");
    path.MoveTo(246*k, 58*k);
    path.CurveTo(232.3*k, 65*k, 161.5*k, 94.1*k, 146.5*k, 102*k);
    path.CurveTo(131.4*k, 109.9*k, 123*k, 109.8*k, 111.1*k, 104*k);
    path.CurveTo(99.2*k, 98.5*k, 24*k, 68*k, 10.3*k, 61.6*k);
    path.CurveTo(-3.2*k, 55.1*k, -3.5*k, 50.6*k, 9.8*k, 45.4*k);
    path.CurveTo(23.2*k, 40.1*k, 98*k, 10.7*k, 113.8*k, 5*k);
    path.CurveTo(129.8*k, -0.6*k, 135.2*k, -0.8*k, 148.7*k, 4.1*k);
    path.CurveTo(162.1*k, 9.1*k, 232.5*k, 37.1*k, 245.8*k, 41.9*k);
    path.CurveTo(259.1*k, 46.8*k, 259.6*k, 50.9*k, 246*k, 57.9*k);
  }

  path.Path() {
    path.Fill("#ffffff");
    path.MoveTo(159.3*k, 32.8*k);
    path.LineTo(137.3*k, 35*k);
    path.LineTo(132.3*k, 46.9*k);
    path.LineTo(124.3*k, 33.7*k);
    path.LineTo(99*k, 31.4*k);
    path.LineTo(118*k, 24.5*k);
    path.LineTo(112.2*k, 14*k);
    path.LineTo(130*k, 21*k);
    path.LineTo(146.7*k, 15.5*k);
    path.LineTo(142.2*k, 26.4*k);
    path.LineTo(159.2*k, 32.8*k);
    path.MoveTo(131*k, 90.3*k);
    path.LineTo(90*k, 73.3*k);
    path.LineTo(148.8*k, 64.2*k);
    path.LineTo(131*k, 90.2*k);
    path.MoveTo(74*k, 39.3*k);
    path.CurveTo(91.5*k, 39.3*k, 105.5*k, 44.8*k, 105.5*k, 51.5*k);
    path.CurveTo(105.5*k, 58.3*k, 91.5*k, 63.7*k, 74.1*k, 63.7*k);
    path.CurveTo(56.7*k, 63.7*k, 42.6*k, 58.3*k, 42.6*k, 51.5*k);
    path.CurveTo(42.6*k, 44.8*k, 56.7*k, 39.3*k, 74.1*k, 39.3*k);
  }

  path.Path() {
    path.Fill("#621b1c");
    path.MoveTo(185.3*k, 36*k);
    path.LineTo(220*k, 49.8*k);
    path.LineTo(185.2*k, 63.5*k);
    path.LineTo(185.2*k, 36*k);
  }

  path.Path() {
    path.Fill("#9a2928");
    path.MoveTo(146.8*k, 51.2*k);
    path.LineTo(185.3*k, 36*k);
    path.LineTo(185.3*k, 63.5*k);
    path.LineTo(181.5*k, 65*k);
    path.LineTo(146.8*k, 51.2*k);
  }

  path.Translate(size/2, 0.859*size*1.06) {
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
    path.LineTo(size, 0.859*size);
    path.LineTo(0, 0.859*size);
    path.Close();
  }
  path.ConnectionPoint(size/2, 0, name="n");
  path.ConnectionPoint(size, 0.859*size/2, name="e");
  path.ConnectionPoint(size/2, 0.859*size, name="s");
  path.ConnectionPoint(0, 0.859*size/2, name="w");
}
