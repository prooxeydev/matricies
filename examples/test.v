module main

import matricies

fn main() {
	mut mat1 := matricies.create_matrix(2, 3)
	mut mat2 := matricies.create_matrix(4, 2)

	mat1.set(0, 0, 1)
	mat1.set(0, 1, 0)
	mat1.set(1, 0, 3)
	mat1.set(1, 1, 2)
	mat1.set(2, 0, 0)
	mat1.set(2, 1, 4)

	mat2.set(0, 0, 3)
	mat2.set(0, 1, 2)
	mat2.set(0, 2, 4)
	mat2.set(0, 3, 0)
	mat2.set(1, 0, 1)
	mat2.set(1, 1, -2)
	mat2.set(1, 2, 2)
	mat2.set(1, 3, -1)

	prod := mat1.mult(mat2) or { panic(err) }

	prod.print()
}
