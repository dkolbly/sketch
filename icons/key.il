/// Icons: small glyph-like symbols.
/// @title Icons
package icons;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
)

/// Key: a simple solid key lying on its side, with an elliptical bow (the
/// handle, taller than it is wide) on the right, a shaft, and two teeth
/// hanging off the left end. Drawn in its own frame, rect(0, 0, size, 0.44*size),
/// with the label centered below it.
/// @component
/// @frame 1 0.44
module Key(size=20mm, color="#2b2b2b", label="") {
  h = 0.44*size;
  cy = h/2;
  // the bow
  rx = 0.14*size;
  ry = 0.22*size;
  cx = size - rx;
  // the shaft and teeth
  t = 0.09*size;
  tooth = 0.07*size;

  path.Path() {
    path.Fill(color);
    path.Difference() {
    path.Union() {
      path.Ellipse(cx, cy, r=[rx, ry]) {}
      // shaft, running into the bow
      path.Rect(0, cy - t/2, cx, t) {}
      // two teeth hanging below the shaft near its free end
      path.Rect(0.05*size, cy, tooth, 0.2*size) {}
      path.Rect(0.17*size, cy, tooth, 0.2*size) {}
    }
    // the hole of the bow, an ellipse as well
    path.Ellipse(cx, cy, r=[rx*0.5, ry*0.55]) {}
    }
  }

  if (label != "") {
    path.Translate(size/2, h*1.08) {
      text.Typeset(label, align="center") {
        font.Family("Go");
        font.Size(size/5);
        path.Fill("black");
      }
    }
  }

  // anchors for connectors: the frame outline, and the middle of each side
  path.ConnectionSurface() {
    path.MoveTo(0, 0);
    path.LineTo(size, 0);
    path.LineTo(size, h);
    path.LineTo(0, h);
    path.Close();
  }
  path.ConnectionPoint(size/2, 0, name="n");
  path.ConnectionPoint(size, h/2, name="e");
  path.ConnectionPoint(size/2, h, name="s");
  path.ConnectionPoint(0, h/2, name="w");
}
