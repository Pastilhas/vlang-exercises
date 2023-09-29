module core

pub struct Transform {
	component_id string
pub mut:
	position Vector3
	rotation Quaternion
}

pub fn Transform.new() Transform {
	return Transform{'transform'}
}
