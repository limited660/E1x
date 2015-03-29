include <configuration.scad>

module rod_holder(h=5,wall_thick=5, rod_type=2020)
{
  if (rod_type==2020)
  {
    rod_width=20;
  } else {
    rod_width=8;
  }
  l=rod_width+wall_thick;
  w=rod_width+wall_thick;

  cube_fillet([l,w,h], center=true);
}
difference() {
  hull(){
    translate([0,0,5/2])
      cube_fillet([55,55,5],center=true);
    translate([43.2, 14,0]) 
      rod_holder(h=5);
  }
  translate([43.2,7.7,-5/2]) 
    rod_holder(h=5, shadow=true); // necessary to carve out holes that the hull filled in the base
  nema17(holes=true);
  nema17(holes=false);
  translate([0,0,-10/2])cylinder(r=11,h=10);
}

translate([50,50,0]) rod_holder(h=50); // just overlap it

