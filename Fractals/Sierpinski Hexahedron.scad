/***************************************************
Sierpinski Generator
By Adam Anderson 

Iteratively creates the Sierpinski Octahedron using any 
starting 3D shape.
***************************************************/

//What would you like the starting shape to be?
shape = "Cube"; //["Sphere":Sphere, "Cube":Cube]

side_length = 8;

//Controls the size of seed shapes
overlap = 1; //[0.5:0.5:10]

iterations = 3; //[1:8]

/* Useful_length scales the input length depending on the number
* of iterations so that the final geometry will occupy roughly the same
* volume regardless of the number of iterations.
*/
useful_length = side_length / pow(2, iterations - 1);

if(shape == "Cube") {
    Sierpinski(side_length, iterations) {
        cube(useful_length, center = true);
    }
}
else if(shape == "Sphere") {
    Sierpinski(side_length, iterations) {
        sphere(useful_length);
    }
}

module iterate(inputSize = 10) {
    size = inputSize / 2;
    /* TOP VERTICES */
    translate([0, 0, size]) {
        translate([size, size, 0]) children(0);
        translate([size, -size, 0]) children(0);
        translate([-size, size, 0]) children(0);
        translate([-size, -size, 0]) children(0);
        translate([0, size, 0]) children(0);
        translate([0, -size, 0]) children(0);
        translate([-size, 0, 0]) children(0);
        translate([size, 0, 0]) children(0);
    }
    /* EQUATORIAL VERTICES */
    translate([size, size, 0]) children(0);
    translate([-size, size, 0]) children(0);
    translate([size, -size, 0]) children(0);
    translate([-size, -size, 0]) children(0);
    
    /* BOTTOM VERTICES */
    translate([0, 0, -size]) {
        translate([size, size, 0]) children(0);
        translate([size, -size, 0]) children(0);
        translate([-size, size, 0]) children(0);
        translate([-size, -size, 0]) children(0);
        translate([0, size, 0]) children(0);
        translate([0, -size, 0]) children(0);
        translate([-size, 0, 0]) children(0);
        translate([size, 0, 0]) children(0);
    }
}

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

/*
* Uses input shape to create Sierpinski Tetrix by scaling
* and translating duplicates of the original shape.
* See the iterate module for specific translation amounts.
*/
module Sierpinski(side = 10, iterations = 5) {
    if(iterations > 0) {
        iterate(side) {
            Sierpinski(side / 2, iterations - 1) {
                children(0);
            }
        }
        scale(overlap) children(0);
    }
}