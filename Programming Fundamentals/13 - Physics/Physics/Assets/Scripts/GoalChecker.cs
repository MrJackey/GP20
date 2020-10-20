using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GoalChecker: MonoBehaviour {
	private Rigidbody2D rb2D;
	private void Start() {
		rb2D = GetComponent<Rigidbody2D>();
	}

	private void OnTriggerEnter2D(Collider2D other) {
		if (!other.gameObject.CompareTag("Hoop")) return;

		Debug.Log("You scored");
		transform.position = Vector3.zero;
		rb2D.velocity = Vector2.zero;
	}
}
