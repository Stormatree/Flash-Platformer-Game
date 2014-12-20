package com.game.ents{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.game.Spawner;
	import com.game.Projectile;
	import com.game.Actor;
	import com.Utils;
	import com.game.Input;
	import com.game.Hitbox;
	
	public class Player extends Actor{
		private var _direction:int = 1;
		private var _shot:Boolean = false;
		private var _jumped:Boolean = false;
		
		private var _idle:Boolean = false;
		private var _running:Boolean = false;
		private var _jumping:Boolean = false;
		private var _shooting:Boolean = false;
		
		private var _spawn:Point;
		private var _health:int;
		
		public function Player(xy:Point){
			var hitRect:Rectangle = new Rectangle(9, 12, 18, 24);
			
			super(xy, hitRect, .80);
			
			_spawn = xy;
			_health = 30;
		}
		
		public function reset():void{
			x = _spawn.x;
			y = _spawn.y;
			
			velocityX = 0;
			velocityY = 0;
			
			pushX = 0;
			pushY = 0;
			
			lastHurt = 0;
			
			health = _health;
		}
		
		override public function update():void{	
			super.update();
		
			_idle = false;
			_running = false;
			_jumping = false;
			_shooting = false;
			
			if (!Input.keyIsShoot){
				_shot = false;
			}
			
			if (Input.keyIsLeft && Input.keyIsRight){
				_idle = true;
			}else if (Input.keyIsLeft && !immobile){
				left();
				_running = true;
			}else if (Input.keyIsRight && !immobile){
				right();
				_running = true;
			}else{
				_idle = true;
			}
			
			if (Input.keyIsShoot){
				_shooting = true;
			}
			
			if (Input.keyIsShoot && !immobile && !_shot){
				shoot();
				_shot = true;
			}else if (!Input.keyIsShoot && _shot){
				_shot = false;
			}
			
			if (!Input.keyIsJump && grounded){
				_jumped = false;
			}
			
			if (Input.keyIsJump && !_jumped){
				
				if (velocityY > 0){
					_jumped = true;
				}else{
					jump();
				}
			}
			
			if (!grounded){
				_jumping = true;
			}
			
			var tempDirection = flipped();
			
			if (tempDirection != 0){
				_direction = tempDirection;
			}
			
			animation();
		}
		
		override protected function jump():void{
			if (grounded){
				velocityY = -7;
				grounded = false;
			}else if (!grounded){
				if (velocityY < 0){
					velocityY += (gravity * -.4);
				}
			}
		}
		
		override protected function shoot():void{
			Spawner.spawnPlayerBullet(stage, x - (dir * 5), y, dir * -1);
		}
		
		override protected function collision():void{			
			super.collision();
		
			for each (var bullet:Projectile in Spawner.projectiles){
				if (boxColliding(bullet) && bullet.faction == Projectile.ENEMY){					
					bullet.destroy = hurt(bullet, 3);
				}
			}
			
			if (outBoundsBottom() || health <= 0){					
				Main.currentState = Main.RESTART;
			}
		}
		
		private function animation():void{
			var tempDirection = flipped();
			
			if (tempDirection != 0){
				scaleX = tempDirection;
			}
			
			
			//mc_immobile.visible = false;
			mc_jump.visible = false;
			mc_jumpShoot.visible = false;
			mc_run.visible = false;
			mc_runShoot.visible = false;
			mc_idle.visible = false;
			mc_idleShoot.visible = false;
			
			
			if (_jumping && _shooting){
				mc_jumpShoot.visible = true;
			}else if (_jumping){
				mc_jump.visible = true;
			}else if (_idle && _shooting){
				mc_idleShoot.visible = true;
			}else if (_idle){
				mc_idle.visible = true;
			}else if (_running && _shooting){
				mc_runShoot.visible = true;
			}else if (_running){
				mc_run.visible = true;
			}
			
			/*
			if (immobile){
				mc_immobile.visible = true;
			}else if (_jumping && _shooting){
				mc_jumpShoot.visible = true;
			}else if (_jumping){
				mc_jump.visible = true;
			}else if (_idle && _shooting){
				mc_idleShoot.visible = true;
			}else if (_idle){
				mc_idle.visible = true;
			}else if (_running && _shooting){
				mc_runShoot.visible = true;
			}else if (_running){
				mc_run.visible = true;
			}
			*/
		}
	}
}