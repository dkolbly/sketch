/// Thick lines and block arrows: a filled band along a polyline, with shaped
/// ends, rounded bends and a label running along it.
/// @title Thick lines
package thick;

import (
   "gitlab.com/donovan4/fufoo/sys/illus/std/path"
   "gitlab.com/donovan4/fufoo/sys/illus/std/style"
   "gitlab.com/donovan4/fufoo/sys/fu/std/types"
   "shapes/v2"
)

/// a thick block arrow: a band of the given thickness along the points, with
/// a triangle head by default.  radius rounds the bends of the centerline
/// (so the inner edge of a bend has radius - thickness/2 and the outer one
/// radius + thickness/2).  headWidth and headLength are multiples of the
/// thickness.  The label is centered on the visible shaft (the line without its heads),
/// along it, in the font color (default: the stroke color).
/// @component
/// @choices start none triangle round sharp indent
/// @choices end none triangle round sharp indent
/// @choices sloppiness none casual sketch xkcd
/// @basic start
/// @basic end
/// @basic label
/// @basic font.color
/// @basic thickness
/// @basic radius
/// @basic sloppiness
module Arrow(points=[path.Point(0mm, 0mm), path.Point(40mm, 0mm)],
             label="",
             start: types.String = "none", end: types.String = "triangle",
             thickness=6mm, radius=4mm,
             headWidth=2.2, headLength=1.4,
             stroke: style.Stroke = style.Stroke(color="black", width=0.5mm, style="solid"),
             fill: style.Fill = style.Fill(color="white", style="solid"),
             sloppiness: types.String = "none",
             font: style.Font = style.Font(family="CMU Serif", size=3.5mm, weight=400,
                                           style="normal", line_spacing=1.2, letter_spacing=0)) {
  Band(points, label, start, end, thickness, radius, headWidth, headLength,
       stroke, fill, sloppiness, font, style.Paragraph(align="center", valign="middle"));
}

/// a thick line: like Arrow, but with plain ends by default.
/// @component
/// @choices start none triangle round sharp indent
/// @choices end none triangle round sharp indent
/// @choices sloppiness none casual sketch xkcd
/// @basic start
/// @basic end
/// @basic label
/// @basic font.color
/// @basic thickness
/// @basic radius
/// @basic sloppiness
module Line(points=[path.Point(0mm, 0mm), path.Point(40mm, 0mm)],
            label="",
            start: types.String = "none", end: types.String = "none",
            thickness=6mm, radius=4mm,
            headWidth=2.2, headLength=1.4,
            stroke: style.Stroke = style.Stroke(color="black", width=0.5mm, style="solid"),
            fill: style.Fill = style.Fill(color="white", style="solid"),
            sloppiness: types.String = "none",
            font: style.Font = style.Font(family="CMU Serif", size=3.5mm, weight=400,
                                          style="normal", line_spacing=1.2, letter_spacing=0)) {
  Band(points, label, start, end, thickness, radius, headWidth, headLength,
       stroke, fill, sloppiness, font, style.Paragraph(align="center", valign="middle"));
}
