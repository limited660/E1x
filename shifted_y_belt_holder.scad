include<inc/metric.scad>
padding = 5; // distance from plate need to pad out, this is depedent on your bed height
difference() {
  union() {
    translate([0,0,padding+3])import("STL Files/Y_Axis_Belt_Gripper_-_1x.stl");
    linear_extrude(height=padding)projection(cut=true)import("STL Files/Y_Axis_Belt_Gripper_-_1x.stl");
  }
  for (i = [-1, 1])
  {
    translate([0,i*20.5,0])
    {
      cylinder(r=m3_diameter/2,h=padding+3,$fs=0.2);
      translate([0,0,3])cylinder(r=m3_nut_diameter/2,h=padding+3,$fs=0.2);
    }
  }
}
