use<inc/functions.scad>
include<inc/arduino.scad>

bumper(boardType=MEGA2560, mountingHoles=false);
translate([11.1,-1.4,-11.5])rotate([-90,0,0])
{
  difference() 
  {
    union() {
      translate([15.60,-12,(104.2/2)])cube([56.2,2,104.2],center=true);
      translate([0,0,(100/2)])cube([25,25,100],center=true);
    }
    ext2020(l=100);
    for (i = [30, 80]) 
      translate([0,0,i])rotate([0,-90,90])cylinder(r=2.5,h=30);
    for (i = [30, 80]) 
      translate([0,0,i])rotate([0,-90,0])cylinder(r=2.5,h=30);

    translate([6,6,120/2])cube([25,25,120],center=true);
    translate([0,20,120/2])cube([25,25,120],center=true);
    translate([10.6,2.5,120/2])cube([6,25,120],center=true);
  }
}

*translate([10,-5,-10])rotate([-90,0,0])
    translate([10.6,3,120/2])cube([6,25,120],center=true);

