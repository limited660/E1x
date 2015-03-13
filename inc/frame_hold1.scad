use<functions.scad>
include<arduino.scad>

module base_plate() {
  translate([11.1,-1.4,-11.5])rotate([-90,0,0])
  {
    difference() 
    {
      union() {
        translate([15.60,-12,(104.2/2)])cube([56.2,2,104.2],center=true);
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
}
module corner_brace(nosupport=false) {
      difference() 
      {
        union() {
          translate([0,0,(100/2)])cube([25,25,100],center=true);
        }
        ext2020(l=100);
        if (nosupport)
        {
          translate([0,0,100/2])

            translate([-10+1.5,0,0])cube([3,6,100], center=true);
            translate([10-1.5,0,0])cube([3,6,100], center=true);
        }

        for (i = [30, 80]) 
          translate([0,0,i])rotate([0,-90,90])cylinder(r=2.5,h=30);
        for (i = [30, 80]) 
          translate([0,0,i])rotate([0,-90,0])cylinder(r=2.5,h=30);

        translate([6,6,120/2])cube([25,25,120],center=true);
        translate([0,20,120/2])cube([25,25,120],center=true);
        translate([10.6,2.5,120/2])cube([6,25,120],center=true);
      }
}
module frame_mount(corner_brace=false,enclosure=true,nosupport=false) 
{
  if(enclosure)
  {
    difference(){
      translate([0,0,-0.5])enclosure(boardType=MEGA2560, mountingHoles=false);
      translate([-50,-50,20])cube(500,500,500);
      translate([0,0,25])enclosure(boardType=MEGA2560, mountingHoles=false);
      translate([11.1,-1.4,-11.5])rotate([-90,0,0])
        translate([15.60,-12,(104.2/2)])cube([56.2,4,104.2],center=true);

      translate([-11,-1.4,12])rotate([-90,180,0])
      {
        for (i = [30, 80]) 
          translate([0,0,i])rotate([0,-90,90])cylinder(r=2.5,h=30);
        for (i = [30, 80]) 
          translate([0,0,i])rotate([0,-90,0])cylinder(r=2.5,h=30);

      }
        

    }

  }else{
    bumper(boardType=MEGA2560, mountingHoles=false);
  }
  base_plate();


  if (corner_brace) { 
    if (enclosure) {
      translate([-16,-1.4,12])rotate([-90,180,0])
        corner_brace(nosupport);
    } else {
      translate([-13,-1.4,12])rotate([-90,180,0])
        corner_brace(nosupport);
    }
  }
}

