/********************************************
Tetrahedron.scad
By Adam Anderson

A simple module for creating a tetrahedron.
********************************************/

tetrahedron(5);

module tetrahedron(size) {
    polyhedron( 
        points = [ 
            [0, size * (sqrt(3) - (1 / sqrt(3))), 0], 
            [size, size * (-1 / sqrt(3)), 0], 
            [-size, size * (-1 / sqrt(3)), 0],
            [0, 0, size * 2 * sqrt(2 / 3)]
        ], 
        faces = [
            [0, 1, 3],
            [2, 3, 1], 
            [2, 0, 3],
            [2, 1, 0]
        ]
    );
}