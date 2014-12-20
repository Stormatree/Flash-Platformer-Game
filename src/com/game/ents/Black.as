package com.game.ents{
	import flash.geom.Point;
	import com.game.Enemy;
	import com.game.Spawner;
	import com.game.ents.EnemyBullet;
	
	public class Black extends Enemy{
		public function Black(xy:Point){			
			super(xy);
			
			leapProb = 50;
			hitScore = 100;
			killScore = 200;
			fireRate = 20;
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
			Spawner.spawnEnemyBullet(stage, x, y, Spawner.player.x, Spawner.player.y, EnemyBullet.BLACK);
		}
	}
}