package fufoo;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/style"
   fonts "gitlab.com/donovan4/fufoo/sys/illus/std/font"
   "gitlab.com/donovan4/fufoo/sys/illus/std/text"
   "gitlab.com/donovan4/fufoo/sys/fu/std/types"
   "gitlab.com/donovan4/fufoo/sys/fu/std/strings"
   "gitlab.com/donovan4/fufoo/sys/fu/std/array"
   "gitlab.com/donovan4/fufoo/sys/fu/std/lang"
   "gitlab.com/donovan4/fufoo/sys/fu/std/proto"
)

// A field row: [name, type, notes], with "" for the missing columns.
// the line without its trailing whitespace (Split drops the leading)
function msgTrim(line) = strings.Split(line, regex=`\s+$`)[0];

function msgCols(p) = [p[0], lang.Length(p) > 1 ? p[1] : "", lang.Length(p) > 2 ? p[2] : ""];

function msgRow(line) = msgCols(strings.Split(msgTrim(line), n=2));

function msgNotBlank(line) = lang.Length(strings.Split(line)) > 0;

// The non-blank lines of the field list, each as [name, type, notes].
function msgRows(src) = (for l = array.Filter(strings.Lines(src), msgNotBlank), msgRow(l));

// the width, in mm, of s set in the font (0 for "")
function msgWidth(s, font, lh) =
  s == "" ? 0 : path.Width(text.TypesetBox(s, lineheight=lh) { style.UseFont(font); });

function msgMax(a, b) = a > b ? a : b;

// the widest of a column of strings
function msgWidest(col, font, lh) =
  array.Fold(col, 0, function(m, s) = msgMax(m, msgWidth(s, font, lh)));

// one line of text with its box's origin at (x, y), aligned about x
module msgText(s, x, y, align, font, color, bold=false) {
  if (s != "") {
    path.Translate(x, y) {
      text.Typeset(s, align=align) {
        style.UseFont(font);
        if (bold) { fonts.Weight(700); }
        path.Fill(color);
      }
    }
  }
}

/// A structured object (a proto message), drawn like a database table: a
/// header band with the title, and a list of fields under it in aligned columns.
/// `text` has one field per line, written `name type notes...`; the name,
/// the type and the notes (right-aligned) are separated by spaces.  Each
/// field has connection points `<name>.w` and `<name>.e`.
/// @component
/// @basic label
/// @basic text
/// @choices sloppiness none casual sketch xkcd
module Message(w=50mm, label="Message", text="id int64 PK\nname string",
             stroke: style.Stroke = style.Stroke(color="black", width=0.5mm, style="solid"),
             fill: style.Fill = style.Fill(color="#d6e6f5", style="solid"),
             sloppiness: types.String = "none",
             font: style.Font = style.Font(family="CMU Typewriter Text", size=3.5mm, weight=400,
                                           style="normal", line_spacing=1.2, letter_spacing=0)) {
  size = proto.Has(font, "size") ? font.size : 3.5mm;
  spacing = proto.Has(font, "line_spacing") ? font.line_spacing : 1.2;
  lh = spacing * size;
  pad = 0.6 * size;
  gap = 1.5 * size;
  rows = msgRows(text);
  nr = lang.Length(rows);
  names = (for r = rows, r[0]);
  nameW = msgWidest(names, font, lh) * 1mm;
  typeX = pad + nameW + gap;
  ink = style.TextColor(font, stroke, "black");
  headH = lh + 1.2 * size;
  // an empty body still has room for one row
  bodyRows = nr > 0 ? nr : 1;
  h = headH + 0.3 * size + bodyRows * lh + 0.3 * size;
  barColor = path.BlendColor(fill.color, "black", 0.12);

  path.Path() {
    style.Brush(fill, sloppiness);
    RectOutline(w, h);
  }
  path.Path() {
    path.Fill(barColor);
    RectOutline(w, headH);
  }
  path.Path() {
    style.Pen(stroke, sloppiness);
    RectOutline(w, h);
    path.MoveTo(0, headH);
    path.LineTo(w, headH);
  }
  msgText(label, w/2, headH/2 - 0.6*size, "center", font, ink, bold=true);
  for (i = [0:nr]) {
    r = rows[i];
    y = headH + 0.3 * size + (i + 0.5) * lh;
    ty = y - 0.6 * size;
    msgText(r[0], pad, ty, "left", font, ink);
    msgText(r[1], typeX, ty, "left", font, ink);
    msgText(r[2], w - pad, ty, "right", font, ink);
    if (r[0] != "") {
      path.ConnectionPoint(0, y, name=strings.Concat(r[0], ".w"), normal=[-1, 0]);
      path.ConnectionPoint(w, y, name=strings.Concat(r[0], ".e"), normal=[1, 0]);
    }
  }
  path.ConnectionSurface() {
    RectOutline(w, h);
  }
  path.Skeleton() {
    RectOutline(w, h);
    path.MoveTo(0, headH);
    path.LineTo(w, headH);
  }
  // n/s at the box's top and bottom; e/w in the header band, not mid-box
  path.ConnectionPoint(w/2, 0, name="n", normal=[0, -1]);
  path.ConnectionPoint(w, headH/2, name="e", normal=[1, 0]);
  path.ConnectionPoint(w/2, h, name="s", normal=[0, 1]);
  path.ConnectionPoint(0, headH/2, name="w", normal=[-1, 0]);
}
