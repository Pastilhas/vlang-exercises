module core

pub struct Thing {
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

pub fn (t Thing) get_component[T]() !T {
	index := t.find_component[T]()!
	return t.components[index]
}

pub fn (t Thing) get_components[T]() []T {
	res := []T{}

	for c in t.components {
		if c is T {
			res << c
		}
	}

	return res
}

pub fn (t Thing) add_component(c Component) {
	t.components << c
}

pub fn (t Thing) rem_component[T]() ! {
	id := t.find_component[T]()!
	t.components.delete(id)
}
