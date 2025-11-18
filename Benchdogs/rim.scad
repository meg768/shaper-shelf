include <BOSL2/std.scad>

$fn = 128;

module rim(depth = 10, height = 5, diameter = 7.8, size = 12, chamfer = 1, translate = [0, 0, 0]) {
    // Diameter på piggar
    A = diameter;
    // Djup på piggar
    B = depth;
    // Chamfer
    C = chamfer;
    // Höjd på rim
    E = height;
    // Tjocklek på rim
    F = size;
    // Pin spacing
    G = 30;

    module pin(translate = [0, 0, 0]) {
        translate(translate) {
            translate([0, 0, (B + E) / 2]) {
                cyl(d=A, l=B + E, chamfer1=C, chamfer2=C);
            }
        }
    }

    translate(translate) {
        translate([-G, 0, 0]) {
            pin(translate=[0, 0, 0]);
            pin(translate=[G, 0, 0]);
            pin(translate=[2 * G, 0, 0]);
            translate([G, 0, E / 2]) {
                cuboid([2 * G + 2 * A, F, E], chamfer=C);
            }
        }
    }
}

module make() {
    // 7.8 funkar
    // Provar 7.9
    // Funkar inte. 7.8 är bättre
    rim(diameter = 7.8, size = 15, height=6, depth=10, translate=[0, 0, 0]);
    rim(diameter = 7.8, size = 15, height=6, depth=10, translate=[0, 30, 0]);
    rim(diameter = 7.8, size = 15, height=6, depth=10, translate=[0, 60, 0]);
}  


make();
