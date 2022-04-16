using Godot;
using System;

public class Player : KinematicBody2D
{
	// Movement Variables
	private int moveSpeed = 150;

	private Vector2 dirVector = new Vector2(0, 0);
	private Vector2 moveVector = new Vector2(0, 0);

	public override void _Ready()
	{
		
	}
	
	public override void _Process(float delta){
		//this.LookAt(GetGlobalMousePosition());
	}
	
	public override void _PhysicsProcess(float delta){
		MoveAndCollide(new Vector2(0, 1));
	}
}
