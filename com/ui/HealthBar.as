package com.ui{
	import flash.geom.Point;
	import com.game.Spawner;
	import com.Base;
	import flash.events.Event;
	
	public class HealthBar extends Base{
		public var health:int = 0;
		
		public function HealthBar(xPos:Number, yPos:Number){
			var xy:Point = new Point(xPos, yPos);
			
			super(xy);
		}
		
		override protected function added(e:Event):void{
			health = 0;
		}
		
		override public function update():void{
			if (Spawner.player.health > health){
				health++;
			}else if (Spawner.player.health < health){
				health--;
			}
			
			gotoAndStop(health + 1);
		}
	}
}