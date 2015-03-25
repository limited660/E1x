difference() {
  cube([19.95,60,6]);
  translate([19.95/2,6,0]) {
  $fs=0.2;
  cylinder(r=3.2/2, h=10);
  translate([0,49,0])cylinder(r=3.2/2, h=10);
  }
}
translate([0.2,49,6])
mirror([0,1,0]) {
import("ybelt.stl");
translate([0,0,-6])linear_extrude(height=6)projection(cut=true)import("ybelt.stl");
}
