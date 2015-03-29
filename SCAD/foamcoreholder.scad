use<inc/functions.scad>


module panel_bracket(stock=8, holder=3, bolt=true) 
{
  difference() {
    cube([40,20+stock+holder*2,6]); // basic shape
    translate([10,10,0])ext2020(10); // 2020 extrusion cutout
    cube([15,15,10]); // further cutout for the 2020, remove tabs.
    translate([10,20+holder,0])color("blue")cube([90, stock,10]);
    translate([22,0,0])color("red") cube([50,20,10]); // top stockness, reduce the translate to make it thinner. 
    if (bolt)
      translate([32,0,5])rotate([-90,0,0])cylinder(r=1.5, h=20+holder*2+stock,$fn=50); // hole to bolt stock on.
  }
}

panel_bracket(stock=(5/16)*25.4);
