use<inc/functions.scad>

thick=(5/16) * 25.4;

difference() {
  cube([40,35,6]);
  translate([10,10,0])ext2020(10);
  cube([15,15,10]);
  translate([10,25,0])color("blue")cube([90, thick,10]);
  translate([25,0,0])color("red") cube([50,20,10]);
  translate([32,0,5])rotate([-90,0,0])cylinder(r=1.5, h=60,$fn=50);
}

