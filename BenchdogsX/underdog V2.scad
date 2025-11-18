include <BOSL2/std.scad>

$fn = 128;

module plupp(translate = [0, 0, 0]) {

    // Diameter på plupp
    A = 30;

    // Höjd på plupp
    B = 15;

    // Diameter på hål
    C = 9;

    // Skårans djup
    D = 4;

    // Skårans bredd
    E = 13;

    translate(translate) {
        difference() {
            cyl(d=A, l=B, chamfer1=1, chamfer2=1);
            translate([0, 0, -D / 2]) {
                cyl(d=C, l=B - D, chamfer1=-1, chamfer2=-1);
            }
            translate([0, 0, 0]) {
                #cuboid([A*2, E, D], chamfer1=1);
            }
        }
    }
}

module make() {

    plupp(translate=[0, 0, 0]);
    plupp(translate=[0, 40, 0]);

}
make();