module core

pub struct Thing {
	components []Component
}

pub fn Thing.new() Thing {
	return Thing {
		[]Component{}
	}
}

pub fn (t Thing) get_component[T]() !T {
	for c in t.components {
		if c is T {
			return c
		}
	}

	return error('Component ${T} not found')
}

pub fn (t Thing) get_components[T]() []T {
	res := []T {}

	for c in t.components {
		if c is T {
			res << c
		}
	}

	return res
}

pub fn (t Thing) add_component[T](c Component) T {
	t.components << c

	return c
}
