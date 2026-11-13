package thick;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/fu/std/math"
   "gitlab.com/donovan4/fufoo/sys/fu/std/lang"
   "gitlab.com/donovan4/fufoo/sys/illus/std/style"
   "shapes/v2"
)

// All geometry below is in bare numbers of millimetres; modules multiply
// by 1mm when they emit path elements.

function px(p) = path.X(p);
function py(p) = path.Y(p);
function fmin(a, b) = a < b ? a : b;
function fmax(a, b) = a > b ? a : b;

// dist is the distance between two points
function dist(a, b) = math.Sqrt((px(b) - px(a))*(px(b) - px(a)) + (py(b) - py(a))*(py(b) - py(a)));

// ux, uy: the unit direction from point a to point b (east when they coincide)
function ux(a, b) = dist(a, b) < 0.000001 ? 1 : (px(b) - px(a)) / dist(a, b);
function uy(a, b) = dist(a, b) < 0.000001 ? 0 : (py(b) - py(a)) / dist(a, b);

// the length of a head, shrunk so that its cutback stays within 45% of the
// end segment (seg is that segment's length)
function headLen(kind, t, L, seg) =
  kind == "triangle" ? fmin(L, 0.45*seg) :
  (kind == "sharp" ? fmin(L, 0.45*seg/0.7) : L);

// how far the centerline stops short of the end point
function cutback(kind, t, L, seg) =
  kind == "triangle" ? headLen(kind, t, L, seg) :
  (kind == "sharp" ? 0.7*headLen(kind, t, L, seg) :
  (kind == "round" ? fmin(t/2, 0.45*seg) : 0));

// the part of the cutback the body overlaps into the head, so that no sliver
// shows where they meet
function overlap(kind, t) = kind == "triangle" ? 0.05*t : (kind == "sharp" ? 0.05*t : 0);

// polyline length from point i on
function lengthFrom(pts, i, n) = i >= n - 1 ? 0 : dist(pts[i], pts[i+1]) + lengthFrom(pts, i+1, n);

// the index of the segment holding the point rem along the line, from segment i
function segAt(pts, i, rem, n) =
  (i >= n - 2 ? true : (rem <= dist(pts[i], pts[i+1]))) ? i : segAt(pts, i+1, rem - dist(pts[i], pts[i+1]), n);
// how far along that segment the point is
function remAt(pts, i, rem, n) =
  (i >= n - 2 ? true : (rem <= dist(pts[i], pts[i+1]))) ? rem : remAt(pts, i+1, rem - dist(pts[i], pts[i+1]), n);

// the angle that keeps text running along a direction upright
function upright(a) = a > 90deg ? a - 180deg : (a <= -90deg ? a + 180deg : a);

// CapShape emits the polygon (or circle) added at an end: e is the end
// point, u the unit direction out of the line, kind the style
module CapShape(kind, ex, ey, ux, uy, t, L, H) {
  nx = -uy;
  ny = ux;
  if (kind == "triangle") {
    path.MoveTo((ex)*1mm, (ey)*1mm);
    path.LineTo((ex - L*ux + H/2*nx)*1mm, (ey - L*uy + H/2*ny)*1mm);
    path.LineTo((ex - L*ux - H/2*nx)*1mm, (ey - L*uy - H/2*ny)*1mm);
    path.Close();
  }
  if (kind == "sharp") {
    path.MoveTo((ex)*1mm, (ey)*1mm);
    path.LineTo((ex - L*ux + H/2*nx)*1mm, (ey - L*uy + H/2*ny)*1mm);
    path.LineTo((ex - 0.7*L*ux + t/2*nx)*1mm, (ey - 0.7*L*uy + t/2*ny)*1mm);
    path.LineTo((ex - 0.7*L*ux - t/2*nx)*1mm, (ey - 0.7*L*uy - t/2*ny)*1mm);
    path.LineTo((ex - L*ux - H/2*nx)*1mm, (ey - L*uy - H/2*ny)*1mm);
    path.Close();
  }
  if (kind == "round") {
    cx = ex - t/2*ux;
    cy = ey - t/2*uy;
    r = t/2;
    k = 0.5522847498*r;
    path.MoveTo((cx + r)*1mm, (cy)*1mm);
    path.CurveTo((cx + r)*1mm, (cy + k)*1mm, (cx + k)*1mm, (cy + r)*1mm, (cx)*1mm, (cy + r)*1mm);
    path.CurveTo((cx - k)*1mm, (cy + r)*1mm, (cx - r)*1mm, (cy + k)*1mm, (cx - r)*1mm, (cy)*1mm);
    path.CurveTo((cx - r)*1mm, (cy - k)*1mm, (cx - k)*1mm, (cy - r)*1mm, (cx)*1mm, (cy - r)*1mm);
    path.CurveTo((cx + k)*1mm, (cy - r)*1mm, (cx + r)*1mm, (cy - k)*1mm, (cx + r)*1mm, (cy)*1mm);
    path.Close();
  }
}

// Notch emits the V cut out of an indent end: open side at the end point,
// apex depth d back along the line
module Notch(ex, ey, ux, uy, t, d) {
  nx = -uy;
  ny = ux;
  e = 0.05*t;
  path.MoveTo((ex + e*ux + (t/2 + e)*nx)*1mm, (ey + e*uy + (t/2 + e)*ny)*1mm);
  path.LineTo((ex - d*ux)*1mm, (ey - d*uy)*1mm);
  path.LineTo((ex + e*ux - (t/2 + e)*nx)*1mm, (ey + e*uy - (t/2 + e)*ny)*1mm);
  path.Close();
}

// Body is the band along the centerline from (sx, sy) to (fx, fy) through
// the interior points of pts, with bends rounded to radius r
module Body(pts, n, t, r, sx, sy, fx, fy) {
  path.StrokePath(width=t*1mm, cap="butt", join="miter") {
    path.Radius(r*1mm) {
      path.MoveTo(sx*1mm, sy*1mm);
      if (n > 2) {
        for (i = [1:n-1]) { path.LineTo(p=pts[i]); }
      }
      path.LineTo(fx*1mm, fy*1mm);
    }
  }
}

// Band draws the whole thick line: outline, fill and label.
module Band(pts, label, start, end, thickness, radius, headWidth, headLength,
            stroke, fill, sloppiness, font, para) {
  n = lang.Length(pts);
  t = thickness / 1mm;
  r = radius / 1mm;
  L = headLength * t;
  H = fmax(headWidth * t, t);
  p0 = pts[0];
  p1 = pts[1];
  pe = pts[n-1];
  pq = pts[n-2];
  seg0 = dist(p0, p1);
  segN = dist(pq, pe);
  // directions out of the line at each end
  sux = -ux(p0, p1);
  suy = -uy(p0, p1);
  eux = ux(pq, pe);
  euy = uy(pq, pe);
  // effective head lengths and cutbacks
  Ls = headLen(start, t, L, seg0);
  Le = headLen(end, t, L, segN);
  cs = cutback(start, t, L, seg0);
  ce = cutback(end, t, L, segN);
  // a head shrunk by the clamp keeps its proportions (but never narrower than the band)
  Hs = fmax(H*(L > 0 ? Ls/L : 1), t);
  He = fmax(H*(L > 0 ? Le/L : 1), t);
  // body ends
  bsx = px(p0) - sux*(cs - overlap(start, t));
  bsy = py(p0) - suy*(cs - overlap(start, t));
  bex = px(pe) - eux*(ce - overlap(end, t));
  bey = py(pe) - euy*(ce - overlap(end, t));
  // indent notch depths
  ds = fmin(t/2, 0.45*seg0);
  de = fmin(t/2, 0.45*segN);
  notched = start == "indent" ? true : (end == "indent");

  path.Path() {
    style.Pen(stroke, sloppiness);
    style.Brush(fill, sloppiness);
    if (notched) {
      path.Difference() {
        path.Union() {
          Body(pts, n, t, r, bsx, bsy, bex, bey);
          CapShape(start, px(p0), py(p0), sux, suy, t, Ls, Hs);
          CapShape(end, px(pe), py(pe), eux, euy, t, Le, He);
        }
        if (start == "indent") { Notch(px(p0), py(p0), sux, suy, t, ds); }
        if (end == "indent") { Notch(px(pe), py(pe), eux, euy, t, de); }
      }
    } else {
      path.Union() {
        Body(pts, n, t, r, bsx, bsy, bex, bey);
        CapShape(start, px(p0), py(p0), sux, suy, t, Ls, Hs);
        CapShape(end, px(pe), py(pe), eux, euy, t, Le, He);
      }
    }
  }

  if (label != "") {
    half = lengthFrom(pts, 0, n) / 2;
    i = segAt(pts, 0, half, n);
    d = remAt(pts, i, half, n);
    a = upright(math.Atan(py(pts[i+1]) - py(pts[i]), px(pts[i+1]) - px(pts[i])));
    mx = px(pts[i]) + ux(pts[i], pts[i+1])*d;
    my = py(pts[i]) + uy(pts[i], pts[i+1])*d;
    path.Translate(mx*1mm, my*1mm) {
      path.Rotate(a) {
        v2.Label(label, 0mm, 0mm, 0mm, 0mm, font, stroke, para);
      }
    }
  }
}
