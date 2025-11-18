include <BOSL2/std.scad>

$fn = 128;

module plupp(translate = [0, 0, 0], diameter = 8, height = 5, depth = 15, size = 12, chamfer = 0.5) {
    // Dog hole diameter
    A = diameter;

    // Dog hole djup
    B = depth;

    // Höjd på toppen
    C = height;

    // Diameter på toppen
    D = size;

    // Rundning på toppen
    E = chamfer;

    translate(translate) {
        translate([0, 0, -C / 2 + C]) {
            cyl(d=D, l=C, chamfer1=E, chamfer2=E);
        }
        translate([0, 0, B / 2 + C]) {
            cyl(d=A, l=B, chamfer2=E);
        }
    }
}

module make() {
    A = 0;

    plupp(translate=[A, A, 0]);
    //plupp(translate=[-A, -A, 0]);
    //plupp(translate=[-A, A, 0]);
    //plupp(translate=[A, -A, 0]);
}

make();