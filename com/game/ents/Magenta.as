package com.game.ents{
	import flash.geom.Point;
	import com.game.Enemy;
	
	public class Magenta extends Enemy{
		public function Magenta(xy:Point){			
			super(xy);
			
			leapProb = 80;
			hitScore = 25;
			killScore = 100;
			fireRate = 50;
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
	}
}