module core

pub struct Transform {
	component_id string
}

pub fn Transform.new() Transform {
	return Transform{'transform'}
}
