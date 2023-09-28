module core

pub struct Thing {
mut:
	components []Component
}

pub fn Thing.new() Thing {
	return Thing{[]Component{}}
}

pub fn (t Thing) find_component[T]() !int {
	for i, c in t.components {
		if c is T {
			return i
		}
	}

	return error('No component ${T}')
}

pub fn (t Thing) find_components[T]() ![]int {
	mut ids := []int{}

	for i, c in t.components {
		if c is T {
			ids << i
		}
	}

	if ids.len > 0 {
		return ids
	} else {
		return error('No component ${T}')
	}
}

pub fn (t Thing) get_component[T]() !T {
	index := t.find_component[T]()!
	return t.components[index]
}

pub fn (t Thing) get_components[T]() ![]T {
	res := t.find_components[T]()!
	return res.map(fn (i int) Component {
		return t.components[i] as T
	})
}

pub fn (mut t Thing) add_component(c Component) {
	t.components << c
}

pub fn (mut t Thing) rem_component[T]() ! {
	id := t.find_component[T]()!
	t.components.delete(id)
}
