use<inc/functions.scad>

thick=(5/16) * 25.4; // Thickness of stock to be held, default is 5/16 (foamcore poster board).

difference() {
  cube([40,35,6]); // basic shape
  translate([10,10,0])ext2020(10); // 2020 extrusion cutout
  cube([15,15,10]); // further cutout for the 2020, remove tabs.
  translate([10,25,0])color("blue")cube([90, thick,10]);
  translate([25,0,0])color("red") cube([50,20,10]); // top thickness, reduce the translate to make it thinner. 
  translate([32,0,5])rotate([-90,0,0])cylinder(r=1.5, h=60,$fn=50); // hole to bolt stock on.
}

