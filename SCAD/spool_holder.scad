include <inc/functions.scad>
include <inc/metric.scad>
use <inc/polyarc.scad>
clearance=10*10;

total_height=clearance+27;
difference() {
  translate([0,0,total_height/2])cube([27,15,total_height],center=true);
  rotate([90,0,0]) translate([0,5,-15/2])
  {
    cube([20,10,57],center=true);
    ext2020(l=15);
  }
    rotate([0,90,0])translate([-5,0,-40])polyhole(d=m5_diameter,h=80);
}
translate([10,0,total_height])rotate([0,45,0])cube([10,15,40],center=true);
translate([-10,0,total_height])rotate([0,-45,0])cube([10,15,40],center=true);

