package com.game.ents{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.game.Map;
	import com.game.Spawner;
	import com.game.Brush;
	import com.Utils;
	import com.game.Projectile;
	
	public class EnemyBullet extends Projectile{
		public static var MAGENTA:String = "mageneta";
		public static var CYAN:String = "cyan";
		public static var YELLOW:String = "yellow";
		public static var BLACK:String = "black";
		
		public function EnemyBullet(xy:Point, txy:Point, colour:String = "magenta"){
			var hitRect:Rectangle = new Rectangle(2, 2, 5, 5);
			
			super(xy, hitRect, 1, 1, Projectile.ENEMY);
			
			velocityX = Math.cos(Utils.coordAngle(x,y, txy.x, txy.y));
			velocityY = Math.sin(Utils.coordAngle(x, y, txy.x, txy.y));
			
			gotoAndStop(colour);
		}
		
		override protected function collision():void{
			super.collision();
		}
	}
}