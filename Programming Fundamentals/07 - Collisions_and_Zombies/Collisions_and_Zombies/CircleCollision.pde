boolean circleCollision(Character c1, Character c2) {
	  float maxDistance = c1.radius + c2.radius;

	  //first a quick check to see if we are too far away in x or y direction
	  //if we are far away we dont collide so just return false and be done.
	  if (abs(c1.pos.x - c2.pos.x) > maxDistance || abs(c1.pos.y - c2.pos.y) > maxDistance) {
	    return false;
	  }
	  //we then run the slower distance calculation
	  //dist uses Pythagoras to get exact distance, if we still are to far away we are not colliding.
	  else if (dist(c1.pos.x, c1.pos.y, c2.pos.x, c2.pos.y) > maxDistance) {
	    return false;
	  }
	  //We now know the points are closer then the distance so we are colliding!
	  else {
	   	return true;
	  }
	}