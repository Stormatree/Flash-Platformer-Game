package com{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Base extends MovieClip{
		
		// Base class for anything being put on the stage
		
		// Used so that everything can be updated.
		
		public var destroy:Boolean;
		
		public function Base(xy:Point){
			x = xy.x;
			y = xy.y;
			
			addEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}

		protected function added(e:Event):void{
		}

		protected function removed(e:Event):void{
		}
		
		public function update():void{
		}
	}
}