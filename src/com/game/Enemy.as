package com.game{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.game.Actor;
	import com.game.Projectile;
	import com.Utils;
	import com.game.Spawner;
	import com.Base;
	
	public class Enemy extends Actor{	
		protected var idle:Boolean = false;
		protected var jumping:Boolean = false;
		
		protected var leapProb:int = 25; // The number used to modulo against when leaping
		protected var hitScore:int = 25; // The score the player gets from hitting the enemy
		protected var killScore:int = 25; // The score the player gets from killing the enemy
		protected var fireRate:int = 25; // The speed at which the bullets get shot
		
		protected var instantLeap:Number;
		
		public function Enemy(xy:Point){
			var hitRect:Rectangle = new Rectangle(7, 12, 14, 24);
			
			super(xy, hitRect, .85, .2);
			
			// Spawn in the direction of the player
			if (Spawner.player.x > x)dir = -1;
			if (Spawner.player.x < x)dir = 1;
			
			hurtCooldown = 40;
			
			instantLeap = Math.random() * 10;
		}
		
		override public function update():void{
			super.update();
			
			// Calculate if the enemy will leap instantly when landing
			if (instantLeap != 0 && grounded){
				if (instantLeap > 7){
					impulseY(-5);
					if (Spawner.player.x > x)impulseX(3);
					if (Spawner.player.x < x)impulseX(-3);
					falling = true;
				}
				instantLeap = 0;
			}
			
			// Shoot bullet at direction of the player
			if (Main.counter % fireRate == 0 && grounded){
				if (Spawner.player.x > x){
					dir = -1;
				}else if (Spawner.player.x < x){
					dir = 1;
				}
				shoot();
			}
			
			// Calculates chance the enemy will leap
			var leap:Number = Math.round(Math.random() * leapProb);

			if (leap == 0 && grounded){
				if (Spawner.player.x > x)impulseX(3);
				if (Spawner.player.x < x)impulseX(-3);				
				impulseY(-5);
				falling = true;
			}
			
			// Switching animation variables
			idle = false;
			jumping = false;
			
			if (grounded){
				idle = true;
			}else{
				jumping = true;
			}
		}
		
		override protected function collision():void{
			super.collision();
			
			// Get hurt by every player bullet
			for each (var bullet:Projectile in Spawner.projectiles){
				if (boxColliding(bullet) && bullet.faction == Projectile.PLAYER){
					hurt(bullet, 0);
					
					bullet.destroy = true;
				}
			}
			
			// Hurt player if touching
			if (boxColliding(Spawner.player)){
				Spawner.player.hurt(this, 5);
			}
			
			// Destroy enemy on outbounds
			if (outBoundsBottom() || outBoundsX()){
				destroy = true;
				Main.score += killScore;
			}
			
			// Push enemies away when colliding
			for each (var enemy:Enemy in Spawner.enemies){
				if (enemy != this){
					if (enemy.x == x){
						pushX = Math.random() * 2 - 1;
					}
					
					if (collidingLeft(enemy)){
						pushX = -Math.abs(x - enemy.x) / 3;
						enemy.pushX = Math.abs(x - enemy.x) / 3;
					}else if (collidingRight(enemy)){
						pushX = Math.abs(x - enemy.x) / 3;
						enemy.pushX = -Math.abs(x - enemy.x) / 3;
					}
				}
			}
		}
		
		//Overidden hurt, because enemy doesn't have health
		override public function hurt(entity:Base, amount:int = 1):Boolean{
			var hit:Boolean = super.hurt(entity, amount);
			
			if (hit){
				Main.score += hitScore;
			}
			
			return hit;
		}
	}
}