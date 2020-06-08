import matricies

fn get_example_matricies() (matricies.Matrix, matricies.Matrix) {
	mut matrix := matricies.create_matrix(4, 4)
	mut mat := matricies.create_matrix(4, 4)

	matrix.set(1, 1, 6)
	matrix.set(2, 3, 2)
	matrix.set(0, 2, 3)
	matrix.set(2, 1, 1)

	mat.set(1, 1, -2)
	mat.set(2, 3, 1)
	mat.set(0, 2, 6)
	mat.set(2, 1, -3)

	return matrix, mat
}

fn test_add() {
	matrix, mat := get_example_matricies()

	sum := matrix.add(mat) or { panic(err) }
	mut expected := matricies.create_matrix(4, 4)

	expected.set(1, 1, 4)
	expected.set(2, 3, 3)
	expected.set(0, 2, 9)
	expected.set(2, 1, -2)

	assert sum.eq(expected)
}

fn test_sub() {
	matrix, mat := get_example_matricies()

	sum := matrix.sub(mat) or { panic(err) }
	mut expected := matricies.create_matrix(4, 4)

	expected.set(1, 1, 8)
	expected.set(2, 3, 1)
	expected.set(0, 2, -3)
	expected.set(2, 1, 4)

	assert sum.eq(expected)
}

fn test_times() {
	matrix, _ := get_example_matricies()

	prod := matrix.times(2)
	mut expected := matricies.create_matrix(4, 4)

	expected.set(1, 1, 12)
	expected.set(2, 3, 4)
	expected.set(0, 2, 6)
	expected.set(2, 1, 2)

	assert prod.eq(expected)
}

fn test_mult() {
	matrix, mat := get_example_matricies()

	mult := matrix.mult(mat) or { panic(err) }
	mut expected := matricies.create_matrix(4, 4)

	expected.set(0, 0, 0  	/* 0*0+0*0+0*6+0*0 */)
	expected.set(0, 1, 6  	/* 0*0+0*6+1*6+0*0 */)
	expected.set(0, 2, 0  	/* 3*0+0*0+0*6+0*0 */)
	expected.set(0, 3, 12 	/* 0*0+0*0+2*6+0*0 */)

	expected.set(1, 0, 0	/* 0*0+0*-2+0*0+0*0 */)
	expected.set(1, 1, -12	/* 0*0­+6*-2+1*0­+0*0 */)
	expected.set(1, 2, 0	/* 3*0­+0*-2­+0*0­+0*0 */)
	expected.set(1, 3, 0	/* 0*0­+0*-2­+2*0­+0*0 */)

	expected.set(2, 0, 0	/* 0*0­+0*-3­+0*0­+0*1 */)
	expected.set(2, 1, -18	/* 0*0­+6*-3­+1*0­+0*1 */)
	expected.set(2, 2, 0	/* 3*0­+0*-3+0*0­+0*1 */)
	expected.set(2, 3, 0	/* 0*0­+0*-3­+2*0­+0*1 */)

	expected.set(3, 0, 0	/* 0*0­+0*0­+0*0­+0*0 */)
	expected.set(3, 1, 0	/* 0*0­+6*0­+1*0­+0*0 */)
	expected.set(3, 2, 0	/* 3*0­+0*0­+0*0­+0*0 */)
	expected.set(3, 3, 0	/* 0*0­+0*0­+2*0­+0*0 */)

	assert mult.eq(expected)
}