import("tmount.stl");
translate([6,37,6])
mirror([0,1,0]) {
import("ybelt.stl");
translate([0,0,-6])linear_extrude(height=6)projection(cut=true)import("ybelt.stl");
}
