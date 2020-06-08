module matricies

struct Matrix {
mut:
	width int
	height int
	data &f32
}

fn f32_alloc(amount int) &f32 {
	return voidptr(vcalloc(amount * int(sizeof(f32))))
}

pub fn create_matrix(width, height int) Matrix {
	data := f32_alloc(width * height)
	return Matrix{
		width: width
		height: height
		data: data
	}
}

pub fn (mut matrix Matrix) set(x, y int, data f32) {
	matrix.data[x * matrix.width + y] = data
}

pub fn (matrix Matrix) get(x, y int) f32 {
	return matrix.data[x * matrix.width + y]
}

pub fn (matrix Matrix) mult(mat Matrix) ?Matrix {
	matrix.print()
	println('')
	mat.print()
	if matrix.width == mat.height {
		mut tmp := create_matrix(mat.width, matrix.height)
		for i := 0; i < mat.width; i++ {
			for r := 0; r < matrix.height; r++ {
				mut prod := f32(0)
				for c := 0; c < matrix.width; c++ {
					prod += matrix.get(c, r) * mat.get(i, c)
				}
				tmp.set(i, r, prod)
				println('')
			}
		}
		return tmp
	} else {
		return error('The width len of matrix one has to be same as the height len of matrix two')
	}
}

pub fn (matrix Matrix) times(mult int) Matrix {
	mut tmp := create_matrix(matrix.width, matrix.height)
	for i := 0; i < (tmp.width * tmp.height); i++ {
		tmp.data[i] = matrix.data[i] * mult
	}
	return tmp
}

pub fn (matrix Matrix) add(mat Matrix) ?Matrix {
	if matrix.width == mat.width && matrix.height == mat.height {
		mut tmp := create_matrix(matrix.width, matrix.height)
		for i := 0; i < (tmp.width * tmp.height); i++ {
			tmp.data[i] = matrix.data[i] + mat.data[i]
		}
		return tmp
	} else {
		return error('Both matricies must have the same width and height')
	}
}

pub fn (matrix Matrix) sub(mat Matrix) ?Matrix {
	if matrix.width == mat.width && matrix.height == mat.height {
		mut tmp := create_matrix(matrix.width, matrix.height)
		for i := 0; i < (tmp.width * tmp.height); i++ {
			tmp.data[i] = matrix.data[i] - mat.data[i]
		}
		return tmp
	} else {
		return error('Both matricies must have the same width and height')
	}
}


pub fn (matrix Matrix) eq(mat Matrix) bool {
	if matrix.width != mat.width || matrix.height != mat.height {
		return false
	}
	for i := 0; i < (mat.width * mat.height); i++ {
		if matrix.data[i] != mat.data[i] {
			return false
		}
	}

	return true
}

pub fn (matrix Matrix) print() {
	for y := 0; y < matrix.height; y++ {
		print('| ')
		for x := 0; x < matrix.width; x++ {
			num := matrix.get(x, y)
			print('${num:.2f} ')
		}
		println('|')
	}
}