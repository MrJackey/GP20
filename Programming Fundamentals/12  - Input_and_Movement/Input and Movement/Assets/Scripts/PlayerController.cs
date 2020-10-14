using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum MoveMethod {
  Translate,
  Force,
  Velocity,
}

public class PlayerController : MonoBehaviour {
  public float speed;
  public MoveMethod moveMethod;

  private Rigidbody2D rb2D;
  private Vector2 movement;

  // Start is called before the first frame update
  private void Start() {
	  rb2D = GetComponent<Rigidbody2D>();
  }

	// Update is called once per frame
	private void Update() {
		float x = Input.GetAxis("Horizontal");
		float y = Input.GetAxis("Vertical");

		movement = new Vector2(x, y);

		if (movement.sqrMagnitude > 1)
			movement = movement.normalized;

		// Translate using transform
		if (moveMethod == MoveMethod.Translate)
			transform.Translate(movement * (speed * Time.deltaTime));
	}

	private void FixedUpdate() {
		switch (moveMethod) {
			case MoveMethod.Force:
				rb2D.AddForce(movement * speed);
				break;
			case MoveMethod.Velocity:
				rb2D.velocity = movement * speed;
				break;
			// Translate using rigidBody
			// case MoveMethod.Translate:
			// 	rb2D.MovePosition(rb2D.position + movement * (speed * Time.deltaTime));
			// 	break;
		}
	}
}
