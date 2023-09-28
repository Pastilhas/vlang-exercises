module core

pub struct Quaternion {
	x f32
	y f32
	z f32
	w f32
}

pub fn Quaternion.new(x f32, y f32, z f32, w f32) Quaternion {
	return Quaternion{x, y, z, w}
}

pub fn Quaternion.identity() Quaternion {
	return Quaternion{0, 0, 0, 1}
}

pub fn Quaternion.from_euler(v Vector3) Quaternion {
	return Quaternion{0, 0, 0, 1}
}

pub fn (q1 Quaternion) * (q2 Quaternion) Quaternion {
	return Quaternion{q1.w * q2.x + q1.x * q2.w + q1.y * q2.z - q1.z * q2.y, q1.w * q2.y +
		q1.y * q2.w + q1.z * q2.x - q1.x * q2.z, q1.w * q2.z + q1.z * q2.w + q1.x * q2.y - q1.y * q2.x, q1.w * q2.w - q1.x * q2.x - q1.y * q2.y - q1.z * q2.z}
}


