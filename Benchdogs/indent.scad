include <BOSL2/std.scad>

module make() {
    A = 8; // Tjocklek på plattan
    B = 40; // Bredd på plattan
    C = 110; // Höjd på plattan
    D = 8.2; // Diameter på hålen
    E = 80; // Distans mellan hålen
    difference() {
        cuboid([B, C, A], chamfer=1, center=true);
        translate([0, E/2, 0]) {
            #cyl(h=A, d=D, center=true, chamfer=-1);
        }
        translate([0, -E/2, 0]) {
            #cyl(h=A, d=D, center=true, chamfer=-1);
        }
    }
}

make($fn=128);
