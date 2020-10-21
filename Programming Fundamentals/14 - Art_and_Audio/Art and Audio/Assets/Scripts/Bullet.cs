using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour {
	public AudioClip explosionSound;

	private void Start() {
		GetComponent<AudioSource>().pitch = Random.Range(0.5f, 1.5f);
	}

	private void OnCollisionEnter2D(Collision2D other) {
		AudioSource.PlayClipAtPoint(explosionSound, transform.position);
		Destroy(gameObject);
	}
}
