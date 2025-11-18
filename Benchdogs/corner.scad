include <BOSL2/std.scad>

$fn = 128;


module corner(depth = 10, height = 5, diameter = 7.9, chamfer = 0.5) {
    // Diameter på hål
    A = diameter;
    // Djup på piggar
    B = depth;
    // Chamfer
    C = chamfer;
    // Höjd på kant
    E = height;
    // Tjocklek på hörn
    F = 12;
    // Pigg-spacing
    G = 30;
    // Längd på hörn
    D = G + A*2;

    module pigg(translate = [0, 0, 0]) {
        translate(translate) {
            translate([0, 0, (B+E) / 2]) {
                cyl(d=A, l=B+E, chamfer1=C, chamfer2=C);
            }
        }
    }

    module kant(translate = [0, 0, 0]) {
        translate(translate) {
            translate([0, 0, E / 2]) {
                cuboid([D, F, E], chamfer=C);
            }
        }
    }
    pigg(translate=[0, 0, 0]);
    pigg(translate=[G, 0, 0]);
    pigg(translate=[0, G, 0]);
    translate([D / 2 - F / 2, 0, E / 2])
        cuboid([D, F, E], chamfer=C);
    translate([0, D / 2 - F / 2, E / 2])
        cuboid([F, D, E], chamfer=C);
}

module make() {
    corner();
}

make();
