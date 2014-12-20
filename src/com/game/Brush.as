package com.game{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.game.Hitbox;
	
	public class Brush extends Hitbox{
		public function Brush(xy:Point, hitRect:Rectangle){			
			super(xy, hitRect);
		}
	}
}