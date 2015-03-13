use<inc/functions.scad>
module clip_shared() {
difference() 
{
  translate([0,0,(10/2)])cube([25,25,10],center=true);
  ext2020(l=10);
    translate([6,6,10/2])cube([25,25,10],center=true);
    translate([0,20,10/2])cube([25,25,10],center=true);
    translate([10.6,2.5,10/2])cube([6,25,10],center=true);
}
}

module clip1() {
  clip_shared();
  translate([-25/2 - 1, -25/2 -1, 0])
  {
    difference()
    {
      cylinder(r=5, h=10);
      cylinder(r=5-1.5, h=10);
      translate([0,6/2,5])cube([1,9,10],center=true);
    }
  }

}

module clip2() {
  clip_shared();
  translate([-25/2, -25/1.6 -1, 5])rotate([0,90,0])
  {
    difference()
    {
      cylinder(r=5, h=20);
      cylinder(r=5-1.5, h=20);
      rotate([0,0,90])translate([0,-6/2,25/2])cube([1,9,25],center=true);
    }
  }
}


clip1();
translate([40,40,0]) clip2();
