package fufoo;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/style"
   "gitlab.com/donovan4/fufoo/sys/fu/std/types"
   "shapes/v2"
)

/// The fu compiler and runtime: a rounded box with a gear above its label.
/// @component
/// @choices sloppiness none casual sketch xkcd
/// @basic label
module Runtime(w=30mm, h=20mm, label="fu",
             stroke: style.Stroke = style.Stroke(color="black", width=0.5mm, style="solid"),
             fill: style.Fill = style.Fill(color="#fbe3c0", style="solid"),
             sloppiness: types.String = "none",
             font: style.Font = style.Font(family="CMU Serif", size=3.5mm, weight=400,
                                           style="normal", line_spacing=1.2, letter_spacing=0),
             para: style.Paragraph = style.Paragraph(align="center", valign="middle")) {
  r = fmin(3mm, fmin(w, h) * 0.3);
  path.Rect(0, 0, w, h, r=r) {
    style.Pen(stroke, sloppiness);
    style.Brush(fill, sloppiness);
  }
  // the gear: a toothed ring (a dashed fat circle), a body and a hole
  g = fmin(h * 0.17, w * 0.17);
  cx = w / 2;
  cy = label == "" ? h / 2 : h * 0.33;
  teeth = 10;
  circ = 2 * 3.14159265 * g;
  path.Ellipse(cx, cy, r=g) {
    path.Stroke(stroke.color, g * 0.5, dash=[circ / (teeth * 2), circ / (teeth * 2)]);
  }
  path.Ellipse(cx, cy, r=g * 0.92) {
    path.Stroke(stroke.color, 0.35mm);
    path.Fill(path.BlendColor(fill.color, "black", 0.25));
  }
  path.Ellipse(cx, cy, r=g * 0.38) {
    path.Stroke(stroke.color, 0.35mm);
    path.Fill(fill.color);
  }
  if (label != "") {
    v2.Label(label, 0mm, w, h * 0.45, h, font, stroke, para);
  }
  path.ConnectionSurface() {
    RoundOutline(w, h, r);
  }
  Anchors(w, h);
}

/// A compiled fu library: a package with a tab on its top-left.
/// @component
/// @choices sloppiness none casual sketch xkcd
/// @basic label
module Library(w=30mm, h=22mm, label="",
             stroke: style.Stroke = style.Stroke(color="black", width=0.5mm, style="solid"),
             fill: style.Fill = style.Fill(color="#fbe3c0", style="solid"),
             sloppiness: types.String = "none",
             font: style.Font = style.Font(family="CMU Typewriter Text", size=3.5mm, weight=400,
                                           style="normal", line_spacing=1.2, letter_spacing=0),
             para: style.Paragraph = style.Paragraph(align="center", valign="middle")) {
  th = fmin(4mm, h * 0.25);
  tw = w * 0.4;
  path.Rect(0, th, w, h - th) {
    style.Pen(stroke, sloppiness);
    style.Brush(fill, sloppiness);
  }
  path.Rect(0, 0, tw, th) {
    style.Pen(stroke, sloppiness);
    path.Fill(path.BlendColor(fill.color, "black", 0.08), sloppiness=sloppiness);
  }
  v2.Label(label, 0mm, w, th, h, font, stroke, para);
  path.ConnectionSurface() {
    path.MoveTo(0, 0);
    path.LineTo(tw, 0);
    path.LineTo(tw, th);
    path.LineTo(w, th);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
  }
  path.Skeleton() {
    path.MoveTo(0, th);
    path.LineTo(w, th);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
    path.MoveTo(0, th);
    path.LineTo(0, 0);
    path.LineTo(tw, 0);
    path.LineTo(tw, th);
  }
  path.ConnectionPoint(w/2, th, name="n", normal=[0, -1]);
  path.ConnectionPoint(w, (h + th)/2, name="e", normal=[1, 0]);
  path.ConnectionPoint(w/2, h, name="s", normal=[0, 1]);
  path.ConnectionPoint(0, (h + th)/2, name="w", normal=[-1, 0]);
}

/// A fu program, which is essentially a document: a page with a folded
/// corner and a few lines of stand-in code above its label.
/// @component
/// @choices sloppiness none casual sketch xkcd
/// @basic label
module Program(w=26mm, h=32mm, label="",
             stroke: style.Stroke = style.Stroke(color="black", width=0.5mm, style="solid"),
             fill: style.Fill = style.Fill(color="#fbe3c0", style="solid"),
             sloppiness: types.String = "none",
             font: style.Font = style.Font(family="CMU Typewriter Text", size=3.5mm, weight=400,
                                           style="normal", line_spacing=1.2, letter_spacing=0),
             para: style.Paragraph = style.Paragraph(align="center", valign="middle")) {
  m = fmin(6mm, fmin(w, h) * 0.3);
  path.Path() {
    style.Pen(stroke, sloppiness, round=true);
    style.Brush(fill, sloppiness);
    path.MoveTo(0, 0);
    path.LineTo(w - m, 0);
    path.LineTo(w, m);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
  }
  path.Path() {
    style.Pen(stroke, sloppiness, round=true);
    path.Fill(path.BlendColor(fill.color, "black", 0.2));
    path.MoveTo(w - m, 0);
    path.LineTo(w - m, m);
    path.LineTo(w, m);
    path.Close();
  }
  // faint stand-in code: indented lines of different lengths
  lines = label == "" ? 6 : 4;
  y0 = m + 1.5mm;
  dy = (label == "" ? (h - y0 - 3mm) / 6 : (h * 0.55 - y0) / 4);
  for (i = [0:lines]) {
    ind = i == 1 ? w * 0.14 : (i == 2 ? w * 0.14 : 0mm);
    len = (i == 0 ? 0.45 : (i == 1 ? 0.5 : (i == 2 ? 0.38 : (i == 3 ? 0.62 : (i == 4 ? 0.5 : 0.3))))) * w;
    path.Path() {
      path.Stroke(path.BlendColor(fill.color, "black", 0.3), dy * 0.3, cap="round");
      path.MoveTo(w * 0.15 + ind, y0 + dy * i);
      path.LineTo(w * 0.15 + ind + len, y0 + dy * i);
    }
  }
  if (label != "") {
    v2.Label(label, 0mm, w, h * 0.55, h, font, stroke, para);
  }
  path.ConnectionSurface() {
    path.MoveTo(0, 0);
    path.LineTo(w - m, 0);
    path.LineTo(w, m);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
  }
  path.Skeleton() {
    path.MoveTo(0, 0);
    path.LineTo(w - m, 0);
    path.LineTo(w, m);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
    path.MoveTo(w - m, 0);
    path.LineTo(w - m, m);
    path.LineTo(w, m);
  }
  Anchors(w, h);
}
