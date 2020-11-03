using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationController : MonoBehaviour {
	private Animator anim;
	private static readonly int OnHoverHash = Animator.StringToHash("onHover");
	private static readonly int ExitHoverHash = Animator.StringToHash("exitHover");

	private void Start() {
		anim = GetComponent<Animator>();
	}

	public void Spin() {
		anim.SetTrigger(OnHoverHash);
	}

	public void StopSpin() {
		anim.SetTrigger(ExitHoverHash);
	}
}
