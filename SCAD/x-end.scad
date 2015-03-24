include <configuration.scad>
include <inc/metric.scad>
use <bushing.scad>
use <inc/bearing-guide.scad>

// these two modules are from the Prusa i3 repo
module idlermount(len=45, narrow_len=0, narrow_width=0, rod=threaded_rod_diameter_horizontal / 2, idler_height=16){
    difference(){
        union(){
            //wide part holding bearing
            translate([- (10 + idler_width) / 2, -25 + narrow_len, 0] ) cube_fillet([10 + idler_width, len + idler_bearing[2] * 1.1 - narrow_len, idler_height]);
            //For X there is narrow part inside the x-idler
            if (narrow_len > 0){
                translate([-narrow_width / 2, -25, 0] ) cube_fillet([narrow_width, len + idler_bearing[2], idler_height], vertical=[0, 0, 2, 2]);
                mirror([1, 0, 0]) translate([-narrow_width / 2, narrow_len -25, idler_height / 2 ]) fillet(1.5, idler_height - 0.04, $fn=8);
                translate([-narrow_width / 2, narrow_len -25, idler_height / 2]) fillet(1.5, idler_height - 0.04, $fn=8);
            }
        }
        translate([-12, -8, idler_height / 2]) rotate([90, 0, 90]) oval(r=rod + 0.01, l=12, h=25);
        translate([0, -13 - single_wall_width*2, idler_height / 2]) {
            // nut for tensioning screw
            translate([0,0,0]) rotate([90, 0, 0]) cylinder(r=m4_nut_diameter_horizontal / 2, h=3.8, $fn=6);
            // nut insert
            translate([-2, -3.8, -m4_diameter * 1.5 / 2]) cube([20, 3.8, m4_diameter * 1.5+0.3]);
        }

        // tensioning screw goes here
        translate([0, -19, idler_height / 2]) rotate([90, 90, 0]) cylinder(r=m4_diameter / 2, h=15, $fn=small_hole_segments, center=true);
        // bearing goes there
        translate([0, len + idler_bearing[2] - 35, idler_height / 2]) {
            rotate([0, 90, 0]) idler_assy(idler_bearing);
            translate([0, 10, 0]) cube([idler_width + 1, 20, idler_height + 2], center=true);
        }

    }
}
module x_tensioner(len=68, idler_height=max(idler_bearing[0], 16)) {
    idlermount(len=len, rod=m4_diameter / 2 + 0.5, idler_height=idler_height, narrow_len=47, narrow_width=idler_width + 2 - single_wall_width);
}
bushing_xy = [10, 8, 3, 0, "623 bearing"];


difference()
{
  translate([0,0,30])import("STL Files/X_Axis_Idler_Block_-_1x.stl");
  translate([0,-50,21])cube([18,50,18]);
  translate([37,-5,30]) rotate([90,0,0])cylinder(r=m4_diameter/2,h=20);
  color("blue")translate([-5,-20.5,21])cube([50,11,18]);
}
