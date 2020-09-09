class ParaCurve {

	ParaCurve(Axis axis1, Axis axis2, int numberOfLines) {
		float deltaX1 = axis1.x2 - axis1.x1;
		float deltaX2 = axis2.x2 - axis2.x1;

		for (int i = 0; i < numberOfLines; i++) {
			stroke(#888888);
			if (i % 3 == 0) stroke(0);
			float lineX1 = axis1.x1+(deltaX1/numberOfLines)*i;
			float lineX2 = axis2.x1+(deltaX2/numberOfLines)*i;
			line(lineX1, axis1.calcY(lineX1), lineX2, axis2.calcY(lineX2));
		}
	}
}
