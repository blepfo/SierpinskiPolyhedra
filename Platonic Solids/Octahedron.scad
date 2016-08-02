/********************************************
Octahedron.scad
By Adam Anderson

Provides a module for creating an octahedron
********************************************/

module octahedron(size = 4) {
    polyhedron(
        points = [ 
            [0,0, size], //0
            [0, size, 0], //1
            [size, 0, 0], //2
            [0, 0, -size], //3
            [0, -size, 0], //4
            [-size, 0, 0] //5
        ],
        faces = [
            [0, 1, 2],
            [0, 2, 4],
            [0, 4, 5],
            [0, 5, 1],
            [3, 1, 2],
            [3, 4, 2],
            [3, 5, 4],
            [3, 1, 5]
        ]
    );
}