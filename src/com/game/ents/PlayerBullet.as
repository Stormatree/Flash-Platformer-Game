package com.game.ents{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.game.Projectile;
	import com.game.Brush;
	import com.game.Map;
	
	public class PlayerBullet extends Projectile{	
		public function PlayerBullet(xy:Point, dir:int){
			var hitRect:Rectangle = new Rectangle(4, 3, 8, 6);
		
			super(xy, hitRect, dir, 10, Projectile.PLAYER);
			
			velocityX = dir;
		}
		
		override protected function collision():void{
			super.collision();
			
			for each (var brush:Brush in Map.brushes){
				if (boxColliding(brush)){					
					destroy = true;;
				}
			}
		}
	}
}