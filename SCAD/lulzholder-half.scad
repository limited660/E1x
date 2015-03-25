// Belt holder alternative for Lulzbot's 300x300 y carriage. 

height=6; // 

difference() {
  cube([19.95,60,height]);
  translate([19.95/2,6,0]) {
  $fs=0.2;
  cylinder(r=3.2/2, h=10+height);
  translate([0,49,0])cylinder(r=3.2/2, h=10);
  }
}
translate([0.2,49,height])
mirror([0,0,0]) {
import("ybelt.stl");
translate([0,0,-height])linear_extrude(height=height)projection(cut=true)import("ybelt.stl");
}
