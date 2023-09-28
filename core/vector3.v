module core

import math

pub struct Vector3 {
	x f32
	y f32
	z f32
}

pub fn Vector3.new(x f32, y f32, z f32) Vector3 {
	return Vector3{x, y, z}
}

pub fn Vector3.zero() Vector3 {
	return Vector3{0, 0, 0}
}

pub fn Vector3.one() Vector3 {
	return Vector3{1, 1, 1}
}

pub fn Vector3.x() Vector3 {
	return Vector3{1, 0, 0}
}

pub fn Vector3.y() Vector3 {
	return Vector3{0, 1, 0}
}

pub fn Vector3.z() Vector3 {
	return Vector3{0, 0, 1}
}

pub fn (v Vector3) normalized() Vector3 {
	mag := v.magnitude()

	return Vector3{v.x / mag, v.y / mag, v.z / mag}
}

pub fn (v Vector3) magnitude_sqr() f32 {
	return v.x * v.x + v.y * v.y + v.z * v.z
}

pub fn (v Vector3) magnitude() f32 {
	return math.sqrtf(v.magnitude_sqr())
}

pub fn (v1 Vector3) dot(v2 Vector3) f32 {
	return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
}

pub fn (v1 Vector3) cross(v2 Vector3) Vector3 {
	return Vector3{v1.y * v2.z - v1.z * v2.y, v1.z * v2.x - v1.x * v2.z, v1.x * v2.y - v1.y * v2.x}
}

pub fn (v1 Vector3) angle(v2 Vector3) f32 {
	return f32(math.acos(v1.dot(v2) / (v1.magnitude() * v2.magnitude())))
}

pub fn (v1 Vector3) lerp(v2 Vector3, n f32) Vector3 {
	return v1 + (v2 - v1).scale(n)
}

pub fn (v1 Vector3) distance(v2 Vector3) f32 {
	return (v2 - v1).magnitude()
}

pub fn (v1 Vector3) + (v2 Vector3) Vector3 {
	return Vector3{v1.x + v2.x, v1.y + v2.y, v1.z + v2.z}
}

pub fn (v1 Vector3) - (v2 Vector3) Vector3 {
	return Vector3{v1.x - v2.x, v1.y - v2.y, v1.z - v2.z}
}

pub fn (v Vector3) scale(s f32) Vector3 {
	return Vector3{v.x * s, v.y * s, v.z * s}
}

pub fn (v Vector3) rotate(q Quaternion) Vector3 {
	u := Vector3{q.x, q.y, q.z}
	s := q.w

	return u.scale(u.dot(v) * 2) + v.scale(s * s - u.dot(u)) + u.cross(v).scale(2 * s)
}
