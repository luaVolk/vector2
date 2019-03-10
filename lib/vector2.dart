import 'dart:math' as Math;

class Vector2 {

  double x;
  double y;
  
  Vector2(double this.x, double this.y);

  Math.Random _rng = new Math.Random();

  Vector2 zero() {
    this.x = 0;
    this.y = 0;
    return this;
	}

  Vector2 clone() {
			return new Vector2(this.x, this.y);
	}

	 add(vec) {
			this.x += vec.x;
			this.y += vec.y;
			return this;
		}
	 addX(vec) {
			this.x += vec.x;
			return this;
		}
	 addY(vec) {
			this.y += vec.y;
			return this;
		}
	 addScalar(scalar) {
			this.x += scalar;
			this.y += scalar;
			return this;
		}
	 addScalarX(scalar) {
			this.x += scalar;
			return this;
		}
	 addScalarY(scalar) {
			this.y += scalar;
			return this;
		}
	 sub(vec) {
			this.x -= vec.x;
			this.y -= vec.y;
			return this;
		}
	 subX(vec) {
			this.x -= vec.x;
			return this;
		}
	 subY(vec) {
			this.y -= vec.y;
			return this;
		}
	 subScalar(scalar) {
			this.x -= scalar;
			this.y -= scalar;
			return this;
		}
	 multiply(vec) {
			this.x *= vec.x;
			this.y *= vec.y;
			return this;
		}
	 multiplyX(vec) {
			this.x *= vec.x;
			return this;
		}
	 multiplyY(vec) {
			this.y *= vec.y;
			return this;
		}
	 multiplyScalar(scalar) {
			this.x *= scalar;
			this.y *= scalar;
			return this;
		}
	 multiplyScalarX(scalar) {
			this.x *= scalar;
			return this;
		}
	 multiplyScalarY(scalar) {
			this.y *= scalar;
			return this;
		}
	 divide(vec) {
			if (vec.x == 0 || vec.y == 0) {
				return null;
			} else {
				this.x /= vec.x;
				this.y /= vec.y;
				return this;
			}
		}
	 divideX(vec) {
			if (vec.x == 0) {
				return null;
			} else {
				this.x /= vec.x;
				return this;
			}
		}
	 divideY(vec) {
			if (vec.y == 0) {
				return null;
			} else {
				this.y /= vec.y;
				return this;
			}
		}
	 divideScalar(scalar) {
			if (scalar == 0) {
				return null;
			} else {
				this.x /= scalar;
				this.y /= scalar;
				return this;
			}
		}
	 divideScalarX(scalar) {
			if (scalar == 0) {
				return null;
			} else {
				this.x /= scalar;
				return this;
			}
		}
	 divideScalarY(scalar) {
			if (scalar == 0) {
				return null;
			} else {
				this.y /= scalar;
				return this;
			}
		}
	 getMagnitude() {
			return Math.sqrt(Math.pow(this.x, 2) + Math.pow(this.y, 2));
		}
	 normalize() {
			this.divideScalar(this.getMagnitude());
		}
	 randomize(bounds) {
			bounds = bounds ?? new Vector2(1, 1);
			this.x = _rng.nextInt(2) * bounds.x;
			this.y = _rng.nextInt(2) * bounds.y;
			return this;
		}
	 addRandom(limit) {
			limit = limit;
			this.x += limit - _rng.nextInt(2) * (limit * 2);
			this.y += limit - _rng.nextInt(2) * (limit * 2);
		}
	 addRandomX(limit) {
			limit = limit;
			this.x += limit - _rng.nextInt(2) * (limit * 2);
		}
	 addRandomY(limit) {
			limit = limit;
			this.y += limit - _rng.nextInt(2) * (limit * 2);
		}
	 lerp(vec, amount) {
			vec = vec;
			this.x = (1 - amount) * this.x + amount * vec.x;
			this.y = (1 - amount) * this.y + amount * vec.y;
			return this;
		}
	 midpoint(vec) {
			var mp = new Vector2(this.x + vec.x, this.y + vec.y);
			mp.divideScalar(2);
			return mp;
		}
	 slope(vec) {
			return (vec.y - this.y) / (vec.x - this.x) * -1;
		}
	 intercept(slope) {
			return -slope * this.x + this.y;
		}
	 distanceTo(vec) {
			vec = vec;
			return Math.sqrt(Math.pow(vec.x - this.x, 2) + Math.pow(vec.y - this.y, 2));
		}
	 angleTo(vec, [format = 'rad']) {
			vec = vec;
			var angle = format == 'rad' ? Math.atan2(vec.y - this.y, vec.x - this.x) : format == 'deg' ? Math.atan2(vec.y - this.y, vec.x - this.x) * 180 / Math.pi : null;
			return angle;
		}

}