package figures

import (
  "shapes"
  
  "gitlab.com/donovan4/fufoo/sys/illus/std/path"
  "gitlab.com/donovan4/fufoo/sys/fu/std/types"
)

// The stick figures stand in a frame rect(0, 0, 0.4*size, size): size
// is their height.  Their art is drawn on a 40 x 100 grid, scaled by
// k = size/100: the head a circle of radius 11 about (20, 13), the
// neck at (20, 24), the shoulders at (20, 33), the hips at (20, 62)
// and the feet on the bottom of the frame.  After the xkcd figures,
// but with shorter arms, held a little away from the body.  A hat
// rises above the frame (to hatTop).

// stickArms adds the arms in pose to the enclosing path: hanging
// (stand), the right one raised and bent (wave), both raised (cheer),
// the right one held out (point), forearms turned up and out (shrug),
// or the right hand at the chin (think).  Any other pose stands.
module stickArms(k, pose) {
  // the left arm hangs, except in cheer and shrug
  if (pose == "cheer") {
    path.MoveTo(3*k, 15*k);
    path.LineTo(20*k, 33*k);
    path.LineTo(37*k, 15*k);
  } else if (pose == "shrug") {
    path.MoveTo(4*k, 36*k);
    path.LineTo(11*k, 45*k);
    path.LineTo(20*k, 33*k);
    path.LineTo(29*k, 45*k);
    path.LineTo(36*k, 36*k);
  } else {
    path.MoveTo(8*k, 56*k);
    path.LineTo(20*k, 33*k);
    if (pose == "wave") {
      path.LineTo(30*k, 28*k);
      path.LineTo(35*k, 15*k);
    } else if (pose == "point") {
      path.LineTo(38*k, 29*k);
    } else if (pose == "think") {
      path.LineTo(31*k, 41*k);
      path.LineTo(25*k, 24*k);
    } else {
      path.LineTo(32*k, 56*k);
    }
  }
}

// hatTop is the top of hat on the grid (the head's, 2, with none)
function hatTop(hat) = hat == "baseball" ? 1.4 : (hat == "cowboy" ? -7 :
  (hat == "beret" ? -5 : (hat == "wizard" ? -24 : 2)));

// hatFill is the color of hat when hatColor is "none"
function hatFill(hat) = hat == "baseball" ? "#e8590c" : (hat == "cowboy" ? "#a0522d" :
  (hat == "beret" ? "#364fc7" : "#5f3dc4"));

// stickHat draws hat on the head: a cap with its bill to the right
// (baseball), a dented crown on an upturned brim (cowboy), a tilted
// flat cap with a stalk (beret) or a floppy cone on a brim (wizard).
// none, or any other hat, draws nothing.  It is filled with hatColor,
// or with the hat's own color when that is "none".  Each part is a
// path of its own, so that the one in front strokes over the other.
module stickHat(k, hat, color, hatColor, width, sloppiness) {
  fill = hatColor == "none" ? hatFill(hat) : hatColor;
  if (hat == "baseball") {
    // the crown, a little larger than the head, then the bill
    path.Path() {
      shapes.Pen(color, width, "solid", sloppiness, round=true);
      path.Fill(fill, sloppiness=sloppiness);
      path.MoveTo(8.7*k, 10*k);
      path.ArcTo(31.3*k, 10*k, radius=[11.6*k, 11.6*k], negative=true);
      path.Close();
    }
    path.Path() {
      shapes.Pen(color, width, "solid", sloppiness, round=true);
      path.Fill(fill, sloppiness=sloppiness);
      path.MoveTo(30*k, 9*k);
      path.CurveTo(35*k, 8*k, 39*k, 9*k, 40*k, 11.5*k);
      path.LineTo(30*k, 11.5*k);
      path.Close();
    }
  } else if (hat == "cowboy") {
    // the crown, dented on top, then the brim, turned up at the ends
    path.Path() {
      shapes.Pen(color, width, "solid", sloppiness, round=true);
      path.Fill(fill, sloppiness=sloppiness);
      path.MoveTo(12*k, 6*k);
      path.CurveTo(11*k, -2*k, 12*k, -6*k, 15*k, -7*k);
      path.CurveTo(18*k, -5*k, 22*k, -5*k, 25*k, -7*k);
      path.CurveTo(28*k, -6*k, 29*k, -2*k, 28*k, 6*k);
      path.Close();
    }
    path.Path() {
      shapes.Pen(color, width, "solid", sloppiness, round=true);
      path.Fill(fill, sloppiness=sloppiness);
      path.MoveTo(3*k, 2*k);
      path.CurveTo(8*k, 7*k, 32*k, 7*k, 37*k, 2*k);
      path.CurveTo(33*k, 10*k, 7*k, 10*k, 3*k, 2*k);
      path.Close();
    }
  } else if (hat == "beret") {
    path.Path() {
      shapes.Pen(color, width, "solid", sloppiness, round=true);
      path.Fill(fill, sloppiness=sloppiness);
      path.MoveTo(8*k, 6*k);
      path.CurveTo(6*k, 0, 18*k, -3*k, 28*k, -1*k);
      path.CurveTo(35*k, 0, 35*k, 5*k, 31*k, 6*k);
      path.CurveTo(24*k, 8*k, 14*k, 8*k, 8*k, 6*k);
      path.Close();
      path.MoveTo(20*k, -2.4*k);
      path.LineTo(21*k, -5*k);
    }
  } else if (hat == "wizard") {
    // the brim, then the cone over it
    path.Path() {
      shapes.Pen(color, width, "solid", sloppiness, round=true);
      path.Fill(fill, sloppiness=sloppiness);
      path.MoveTo(5*k, 5.5*k);
      path.ArcTo(35*k, 5.5*k, radius=[15*k, 2.5*k]);
      path.ArcTo(5*k, 5.5*k, radius=[15*k, 2.5*k]);
      path.Close();
    }
    path.Path() {
      shapes.Pen(color, width, "solid", sloppiness, round=true);
      path.Fill(fill, sloppiness=sloppiness);
      path.MoveTo(10*k, 5*k);
      path.CurveTo(14*k, -6*k, 18*k, -18*k, 26*k, -24*k);
      path.CurveTo(24*k, -15*k, 27*k, -4*k, 30*k, 5*k);
      path.CurveTo(24*k, 7*k, 16*k, 7*k, 10*k, 5*k);
      path.Close();
    }
  }
}

// stickHead draws the head, filled with fill so that it hides what is
// behind it.
module stickHead(k, color, fill, width, sloppiness) {
  path.Path() {
    shapes.Pen(color, width, "solid", sloppiness, round=true);
    path.Fill(fill, sloppiness=sloppiness);
    path.MoveTo(9*k, 13*k);
    path.ArcTo(31*k, 13*k, radius=[11*k, 11*k]);
    path.ArcTo(9*k, 13*k, radius=[11*k, 11*k]);
    path.Close();
  }
}

// stickBody draws the body, arms (in pose) and legs, and the label
// below the feet, and declares the anchors: the frame, extended up to
// the top of hat, as the surface, and the middle of each side.
module stickBody(k, color, width, sloppiness, pose, hat, label, font, fontSize) {
  w = 40*k;
  h = 100*k;
  top = hatTop(hat)*k;
  path.Path() {
    shapes.Pen(color, width, "solid", sloppiness, round=true);
    path.Fill("none");
    path.MoveTo(20*k, 24*k);
    path.LineTo(20*k, 62*k);
    stickArms(k, pose);
    path.MoveTo(10*k, h);
    path.LineTo(20*k, 62*k);
    path.LineTo(30*k, h);
  }

  shapes.Label(label, 0mm, w, h, h, font, fontSize, color, valign="top");

  path.ConnectionSurface() {
    path.MoveTo(0, top);
    path.LineTo(w, top);
    path.LineTo(w, h);
    path.LineTo(0, h);
    path.Close();
  }
  path.ConnectionPoint(w/2, top, name="n", normal=[0, -1]);
  path.ConnectionPoint(w, h/2, name="e", normal=[1, 0]);
  path.ConnectionPoint(w/2, h, name="s", normal=[0, 1]);
  path.ConnectionPoint(0, h/2, name="w", normal=[-1, 0]);
}

/// a stick figure with a bare round head, standing for a user: size
/// tall and 0.4*size wide, in a pose, with an optional hat (rising
/// above the frame) and label below its feet
/// @component
/// @font font
/// @frame 0.4 1
/// @choices pose stand wave cheer point shrug think
/// @choices hat none baseball cowboy beret wizard
/// @choices sloppiness none casual sketch xkcd
module StickFigure(size=30mm, color="black", fill="white", width=0.5mm,
                   label="", font="Go", fontSize=3.5mm,
                   sloppiness: types.String = "none",
                   pose: types.String = "stand",
                   hat: types.String = "none", hatColor="none") {
  k = size/100;
  stickBody(k, color, width, sloppiness, pose, hat, label, font, fontSize);
  stickHead(k, color, fill, width, sloppiness);
  stickHat(k, hat, color, hatColor, width, sloppiness);
}

/// a stick figure with a ponytail, standing for another user: size
/// tall and 0.4*size wide, in a pose, with an optional hat (rising
/// above the frame) and label below its feet
/// @component
/// @font font
/// @frame 0.4 1
/// @choices pose stand wave cheer point shrug think
/// @choices hat none baseball cowboy beret wizard
/// @choices sloppiness none casual sketch xkcd
module StickFigurePonytail(size=30mm, color="black", fill="white", hair="black",
                           width=0.5mm, label="", font="Go", fontSize=3.5mm,
                           sloppiness: types.String = "none",
                           pose: types.String = "stand",
                           hat: types.String = "none", hatColor="none") {
  k = size/100;
  stickBody(k, color, width, sloppiness, pose, hat, label, font, fontSize);
  // the ponytail hangs behind the head, from its upper right
  path.Path() {
    shapes.Pen(color, width, "solid", sloppiness, round=true);
    path.Fill(hair, sloppiness=sloppiness);
    path.MoveTo(27*k, 5*k);
    path.CurveTo(36*k, 4*k, 39*k, 12*k, 36*k, 22*k);
    path.CurveTo(35*k, 25*k, 33*k, 27*k, 31*k, 28*k);
    path.CurveTo(33*k, 22*k, 32*k, 16*k, 29*k, 12*k);
    path.Close();
  }
  stickHead(k, color, fill, width, sloppiness);
  // the hair over the top of the head, swept to one side: along the
  // head from the left temple over the crown to the right, then back
  // across the forehead as a fringe
  path.Path() {
    shapes.Pen(color, width, "solid", sloppiness, round=true);
    path.Fill(hair, sloppiness=sloppiness);
    path.MoveTo(9.3*k, 15.5*k);
    path.ArcTo(30.9*k, 11.5*k, radius=[11*k, 11*k], negative=true);
    path.CurveTo(27*k, 7*k, 20*k, 7*k, 15*k, 9*k);
    path.CurveTo(12*k, 10.5*k, 10*k, 13*k, 9.3*k, 15.5*k);
    path.Close();
  }
  stickHat(k, hat, color, hatColor, width, sloppiness);
}
