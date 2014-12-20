package com.game.ents{
	import flash.geom.Point;
	import com.game.Enemy;
	import com.game.Spawner;
	import com.game.ents.EnemyBullet;
	
	public class Yellow extends Enemy{
		public function Yellow(xy:Point){	
			super(xy);
			
			leapProb = 750;
			hitScore = 10;
			killScore = 50;
			fireRate = 120;
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
			Spawner.spawnEnemyBullet(stage, x, y, Spawner.player.x, Spawner.player.y, EnemyBullet.YELLOW);
		}
	}
}