use <BOSL2/std.scad>;

module bolt(depth = 6, slack = 0.2, translate = [0, 0, 0]) {
    AF = 13 + slack; // across flats för M8
    CR = AF / sqrt(3); // omvandling till BOSL2:s parameter
    down(depth / 2)
        translate(translate)
            linear_extrude(height=depth, center=false)
                hexagon(CR);
}

module hole(diameter = 9, depth = 15, chamfer = 1, translate = [0, 0, 0]) {
    down(0)
        translate(translate)
            cyl(d=diameter, l=depth, chamfer1=-chamfer, chamfer2=-chamfer);
}
module benchdog(height = 10, width = 30, diameter = 20, depth = 20) {

    up(height / 2) {
        cyl(d=width, h=height, chamfer=1);
    }
    translate([0, 0, -depth / 2])
        cyl(d=diameter, h=depth, chamfer1=1);
}

module make($fn = 256) {
    A = 4; // höjd på benchdog från bordet
    B = 29.7; // bredd på benchdog över bordet
    C = 19.9; // innerdiameter på benchdog
    D = 18; // djup på benchdog
    E = 6; // djup på bult
    Z = 0;

    rotate([180, 0, 0]) {
        difference() {
            benchdog(height=A, width=B, diameter=C, depth=D);

            bolt(depth=E, translate=[0, 0, -E / 2 + A]);
            #hole(depth=D + A - E, translate=[0, 0, -(D + A - E) / 2 + A - E]);
        }
    }
}

make();
