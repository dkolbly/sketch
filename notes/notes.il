/// Paper notes: a sticky note with a lifted corner and a page with a folded one.
/// @title Notes
package notes;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/style"
   "gitlab.com/donovan4/fufoo/sys/fu/std/types"
   "shapes/v2"
)

/// A sticky note: light yellow paper with the bottom-right corner lifted
/// and a soft shadow underneath.  The label is centered on the note.
/// @component
/// @choices sloppiness none casual sketch xkcd
/// @basic label
module StickyNote(w=40mm, h=40mm, label="", curl=6mm,
             stroke: style.Stroke = style.Stroke(color="#d9c94a", width=0.2mm, style="solid"),
             fill: style.Fill = style.Fill(color="#fff59d", style="solid"),
             sloppiness: types.String = "none",
             font: style.Font = style.Font(family="CMU Serif", size=4mm, weight=400,
                                           style="normal", line_spacing=1.2, letter_spacing=0),
             para: style.Paragraph = style.Paragraph(align="center", valign="middle")) {
  c = curl;
  // shadow: a few translucent wedges along the bottom edge, widest at the
  // lifted corner, that add up to a soft falloff
  for (k = [0:4]) {
    s = (k + 1) * 1mm;
    path.Path() {
      path.Fill("black", opacity=0.07);
      path.MoveTo(2mm, h - 2mm);
      path.LineTo(w - c, h - 1mm);
      path.LineTo(w + s*0.5, h - c*0.5);
      path.LineTo(w + s*0.5, h - c*0.5 + s);
      path.LineTo(w - c + s*0.5, h + s);
      path.LineTo(3mm, h + s*0.5);
      path.Close();
    }
  }
  // the paper, its corner cut off along the fold line
  path.Path() {
    style.Pen(stroke, sloppiness);
    style.Brush(fill, sloppiness);
    path.MoveTo(0, 0);
    path.LineTo(w, 0);
    path.LineTo(w, h - c);
    path.LineTo(w - c, h);
    path.LineTo(0, h);
    path.Close();
  }
  // the lifted flap, folded back over the paper (a little darker: it faces down)
  path.Path() {
    path.Stroke(stroke.color, stroke.width);
    path.Fill(path.BlendColor(fill.color, "#806000", 0.12));
    path.MoveTo(w - c, h);
    path.LineTo(w, h - c);
    path.LineTo(w - c*0.15, h - c*0.15);
    path.Close();
  }
  if (label != "") {
    path.Translate(3mm, 3mm) {
      v2.Label(label, 0mm, w - 6mm, 0mm, h - 6mm, font, stroke, para);
    }
  }
  path.ConnectionSurface() {
    path.MoveTo(0, 0);
    path.LineTo(w, 0);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
  }
  Anchors(w, h);
}

/// A sheet of paper with one corner folded over.  Without a label it shows
/// faint lines standing in for text.
/// @component
/// @choices corner bottom-right bottom-left top-right top-left
/// @choices sloppiness none casual sketch xkcd
/// @basic label
/// @basic corner
module Page(w=30mm, h=40mm, label="", corner: types.String = "bottom-right", fold=7mm,
             stroke: style.Stroke = style.Stroke(color="#5a5448", width=0.6mm, style="solid"),
             fill: style.Fill = style.Fill(color="#f5ecd7", style="solid"),
             sloppiness: types.String = "none",
             font: style.Font = style.Font(family="CMU Serif", size=3.5mm, weight=400,
                                           style="normal", line_spacing=1.2, letter_spacing=0),
             para: style.Paragraph = style.Paragraph(align="center", valign="middle")) {
  m = fmin(fold, fmin(w, h) * 0.4);
  right = corner == "bottom-right" ? true : (corner == "top-right");
  bottom = corner == "bottom-right" ? true : (corner == "bottom-left");
  // draw with the fold at the bottom right, then mirror into place
  path.Translate(right ? 0mm : w, bottom ? 0mm : h) {
    path.Scale(right ? 1 : -1, bottom ? 1 : -1) {
      path.Path() {
        style.Pen(stroke, sloppiness, round=true);
        style.Brush(fill, sloppiness);
        path.MoveTo(0, 0);
        path.LineTo(w, 0);
        path.LineTo(w, h - m);
        path.LineTo(w - m, h);
        path.LineTo(0, h);
        path.Close();
      }
      path.Path() {
        style.Pen(stroke, sloppiness, round=true);
        path.Fill(path.BlendColor(fill.color, "#808080", 0.35));
        path.MoveTo(w - m, h);
        path.LineTo(w - m, h - m);
        path.LineTo(w, h - m);
        path.Close();
      }
    }
  }
  if (label == "") {
    // faint stand-in text lines
    x0 = w * 0.18;
    x1 = w * 0.82;
    y0 = h * 0.34;
    dy = h * 0.1;
    for (i = [0:5]) {
      path.Path() {
        path.Stroke("#b5afa0", width=h*0.035, cap="round");
        path.MoveTo(x0, y0 + dy*i);
        path.LineTo(i == 4 ? x0 + (x1 - x0)*0.6 : x1, y0 + dy*i);
      }
    }
  } else {
    path.Translate(w*0.1, h*0.1) {
      v2.Label(label, 0mm, w*0.8, 0mm, h*0.8, font, stroke, para);
    }
  }
  path.ConnectionSurface() {
    path.MoveTo(0, 0);
    path.LineTo(w, 0);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
  }
  Anchors(w, h);
}

function fmin(a, b) = a < b ? a : b;

/// The n/e/s/w anchors at the side midpoints of the w by h frame (a helper).
module Anchors(w, h) {
  path.ConnectionPoint(w/2, 0, name="n", normal=[0, -1]);
  path.ConnectionPoint(w, h/2, name="e", normal=[1, 0]);
  path.ConnectionPoint(w/2, h, name="s", normal=[0, 1]);
  path.ConnectionPoint(0, h/2, name="w", normal=[-1, 0]);
}
