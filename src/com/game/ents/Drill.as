package com.game.ents{
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import com.game.Physbox;
	import com.game.Brush;
	import com.game.Map;
	import com.game.Spawner;
	
	public class Drill extends Physbox{
		public function Drill(xy:Point){
			var hitRect:Rectangle = new Rectangle(2, 5, 5, 5);
			
			super(xy, hitRect, 1);
			
			gravity = .1;
		}
		
		override protected function collision():void{
			for each (var brush:Brush in Map.brushes){
				if (collidingBottom(brush) || collidingTop(brush)){
					velocityY *= .2;
				}
			}
			
			if (Spawner.player.pointColliding(x, y + hitBottom)){
				Spawner.player.hurt(this, 2);
			} 
			
			if (outBoundsBottom() || outBoundsX()){
				destroy = true;
			}
		}
	}
}