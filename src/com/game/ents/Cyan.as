package com.game.ents{
	import flash.geom.Point;
	import com.game.Enemy;
	import com.game.Spawner;
	import com.game.ents.EnemyBullet;
	
	public class Cyan extends Enemy{
		public function Cyan(xy:Point){			
			super(xy);
			
			leapProb = 300;
			hitScore = 15;
			killScore = 75;
			fireRate = 100;
		}
		
		override public function update():void{
			super.update();
			
			var tempDirection = flipped();
			
			if (tempDirection != 0){
				scaleX = tempDirection;
			}
			
			mc_jump.visible = false;
			mc_idle.visible = false;
			
			if (immobile){
				mc_jump.visible = true;
			}else if (jumping){
				mc_jump.visible = true;
			}else if (idle){
				mc_idle.visible = true;
			}
		}
		
		override protected function shoot():void{			
			Spawner.spawnEnemyBullet(stage, x, y, Spawner.player.x, Spawner.player.y, EnemyBullet.CYAN);
		}
	}
}