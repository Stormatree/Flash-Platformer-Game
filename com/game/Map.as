package com.game{
	import flash.display.Stage;
	import com.game.Brush;
	import com.game.ents.Platform;
	import com.game.ents.LightBlock;
	import com.game.ents.DarkBlock;
	import com.game.ents.Cloud_0;
	import com.game.ents.Cloud_1;
	import com.game.ents.Cloud_2;
	import com.game.ents.Cloud_3;
	import com.game.ents.GammaFix;
	import com.game.Parallax;

	public class Map {
		public static var scrollers:Vector.<Parallax > ; //Contains all the scrolling cloud layers
		public static var brushes:Vector.<Brush> ; //Contains all the enviorement brush entities

		public function Map() {
			brushes = new Vector.<Brush>();
			scrollers = new Vector.<Parallax>();
		}
		
		//Create the base platform, with surrounding blocks
		private static function createBase(stage:Stage, x:int, y:int, count:int):void {
			for (var i:int = 0; i < count; i ++) {
				var platform:Platform = new Platform(x + i * Platform.WIDTH, y);
				brushes.push(platform);

				stage.addChild(platform);
			}

			var block:LightBlock = new LightBlock(x - LightBlock.WIDTH, y);
			brushes.push(block);
			stage.addChild(block);

			block = new LightBlock(x + Platform.WIDTH * count - LightBlock.WIDTH, y);
			brushes.push(block);
			stage.addChild(block);
		}
		
		//Create single platform
		private static function createPlatform(stage:Stage, x:int, y:int, count:int):void {
			for (var i:int = 0; i < count; i ++) {
				var darkBlock:DarkBlock = new DarkBlock(x + i * DarkBlock.WIDTH, y);
				brushes.push(darkBlock);

				stage.addChild(darkBlock);
			}

			var lightBlock:LightBlock = new LightBlock(x - LightBlock.WIDTH, y);
			brushes.push(lightBlock);
			stage.addChild(lightBlock);

			lightBlock = new LightBlock(x + DarkBlock.WIDTH * count - LightBlock.WIDTH, y);
			brushes.push(lightBlock);
			stage.addChild(lightBlock);
		}
		
		//Create the parralax scrolling clouds
		private static function createClouds(stage:Stage, x:int, y:int):void {
			var i:int;
			
			// Back-most layer of clouds
			for (i = 0; i < 4; i++) {
				var cloud_3:Cloud_3 = new Cloud_3(x + Cloud_3.WIDTH * i, y - 65, -2, .25);
				scrollers.push(cloud_3);
				stage.addChild(cloud_3);
			}

			for (i = 0; i < 3; i++) {
				var cloud_2:Cloud_2 = new Cloud_2(x + Cloud_2.WIDTH * i, y - 50, -2, .5);
				scrollers.push(cloud_2);
				stage.addChild(cloud_2);
			}

			for (i = 0; i < 3; i++) {
				var cloud_1:Cloud_1 = new Cloud_1(x + Cloud_1.WIDTH * i, y - 25, -2, .75);
				scrollers.push(cloud_1);
				stage.addChild(cloud_1);
			}
			
			// Front-most layer
			for (i = 0; i < 2; i++) {
				var cloud_0:Cloud_0 = new Cloud_0(x + Cloud_0.WIDTH * i, y, -2, 1);
				scrollers.push(cloud_0);
				stage.addChild(cloud_0);
			}
		}
		
		// Build the platforms at hard-coded locations
		public static function build(stage:Stage):void {

			createClouds(stage, 0, 180);

			createBase(stage, 72, stage.stageHeight - 50, 6);

			createPlatform(stage, 72, 155, 4);

			createPlatform(stage, 248, 155, 4);

			createPlatform(stage, 160, 105, 4);
			
			 // Gamma fix just applies a transparent white background to make the player / enemies stand out
			var gamma:GammaFix = new GammaFix(0,0);
			stage.addChild(gamma);
		}

		public function update(stage:Stage):void {
			// Update each brush (even though none really need updating)
			for each (var brush:Brush in brushes) {
				brush.update();
			}
			
			// Update each parralax layer, and pop it back to the end when it's offscreen
			for (var i:int = 0; i < scrollers.length; i++) {
				scrollers[i].update();

				if (scrollers[i].outBounds()) {
					scrollers[i].x = stage.stageWidth;
				}
			}
		}
	}
}