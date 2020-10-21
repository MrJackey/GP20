using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {
	[SerializeField] private float speed = 5;
	[SerializeField] private float jumpPower = 10;

	private Rigidbody2D rb2D;
	private SpriteRenderer spriteRenderer;
	private Vector2 movement;
	private bool grounded;
	private bool jump;

	// Start is called before the first frame update
	private void Start() {
		rb2D = GetComponent<Rigidbody2D>();
		spriteRenderer = GetComponent<SpriteRenderer>();
	}

	// Update is called once per frame
	private void Update() {
		//Movement
		float x = Input.GetAxis("Horizontal");

		movement = new Vector2(x * speed, rb2D.velocity.y);

		if (grounded && Input.GetButtonDown("Jump")) {
			jump = true;
		}
	}

	//FixedUpdate is called every physics interval (0.02s) before physics
	private void FixedUpdate() {
		rb2D.velocity = movement;

		if (jump) {
			// Jump with velocity
			rb2D.velocity = new Vector2(movement.x, jumpPower);

			spriteRenderer.flipX = !spriteRenderer.flipX;
			jump = false;
		}
	}

	private void OnCollisionEnter2D(Collision2D other) {
		grounded = true;
	}

	private void OnCollisionExit2D(Collision2D other) {
		grounded = false;
	}
}
