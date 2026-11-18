/// Components for designing applications on fufoo: the fu language (runtime, libraries, programs) and the foo store (blobs, messages, observables, domains).
/// @title fufoo
package fufoo;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
)

/// The n/e/s/w anchors at the side midpoints of the w by h frame (a helper).
module Anchors(w, h) {
  path.ConnectionPoint(w/2, 0, name="n", normal=[0, -1]);
  path.ConnectionPoint(w, h/2, name="e", normal=[1, 0]);
  path.ConnectionPoint(w/2, h, name="s", normal=[0, 1]);
  path.ConnectionPoint(0, h/2, name="w", normal=[-1, 0]);
}

/// The smaller of two numbers (a helper).
function fmin(a, b) = a < b ? a : b;

/// The outline of a w by h rectangle with corners of radius r, as path
/// operations, for a ConnectionSurface or Skeleton (a helper).
module RoundOutline(w, h, r) {
  path.MoveTo(r, 0);
  path.LineTo(w - r, 0);
  path.ArcTo(w, r, radius=r, negative=true);
  path.LineTo(w, h - r);
  path.ArcTo(w - r, h, radius=r, negative=true);
  path.LineTo(r, h);
  path.ArcTo(0, h - r, radius=r, negative=true);
  path.LineTo(0, r);
  path.ArcTo(r, 0, radius=r, negative=true);
  path.Close();
}

/// The outline of the w by h rectangle at the origin, as path operations (a helper).
module RectOutline(w, h) {
  path.MoveTo(0, 0);
  path.LineTo(w, 0);
  path.LineTo(w, h);
  path.LineTo(0, h);
  path.Close();
}

/// The outline of a w by h box whose top-left corner is square and whose
/// other corners have radius r (a helper, for Domain).
module TabFrame(w, h, r) {
  path.MoveTo(0, 0);
  path.LineTo(w - r, 0);
  path.ArcTo(w, r, radius=r, negative=true);
  path.LineTo(w, h - r);
  path.ArcTo(w - r, h, radius=r, negative=true);
  path.LineTo(r, h);
  path.ArcTo(0, h - r, radius=r, negative=true);
  path.Close();
}
