package com.game{
	import flash.display.Stage;
	import flash.geom.Point;
	import com.game.ents.Player;
	import com.game.Enemy;
	
	import com.game.ents.Magenta;
	import com.game.ents.Cyan;
	import com.game.ents.Yellow;
	import com.game.ents.Black;
	
	import com.game.ents.Drill;
	import com.game.ents.PlayerBullet;
	import com.game.ents.EnemyBullet;
	import com.game.Physbox;
	import com.game.Projectile;
	import com.Base;
	
	public class Spawner{		
		public static var player:Player;
		public static var physboxes:Vector.<Physbox>; // Contains all physbox objects
		public static var projectiles:Vector.<Projectile>; // Contains all bullets
		public static var enemies:Vector.<Enemy>; // Contains all enemies

		public function Spawner(){			
			physboxes = new Vector.<Physbox>();
			projectiles = new Vector.<Projectile>();
			enemies = new Vector.<Enemy>();
		}
		
		public static function Reset(stage:Stage):void{
			// Reset function for restart state
			
			player.reset();
			
			for each (var physbox:Physbox in physboxes){
				physbox.destroy = true;
			}
			for each (var projectile:Projectile in projectiles){
				projectile.destroy = true;
			}
			for each (var enemy:Enemy in enemies){
				enemy.destroy = true;
			}
		}
		
		public static function spawnPlayer(stage:Stage, xPos:int, yPos:int):void{
			var xy:Point = new Point(xPos, yPos);
			player = new Player(xy);
			
			stage.addChild(player);
		}
		
		public static function spawnMagenta(stage:Stage, xPos:int, yPos:int):void{
			var xy:Point = new Point(xPos, yPos);
			var enemy:Magenta = new Magenta(xy);
			
			enemies.push(enemy);
			stage.addChild(enemy);
		}
		
		public static function spawnCyan(stage:Stage, xPos:int, yPos:int):void{
			var xy:Point = new Point(xPos, yPos);
			var enemy:Cyan = new Cyan(xy);
			
			enemies.push(enemy);
			stage.addChild(enemy);
		}
		
		public static function spawnYellow(stage:Stage, xPos:int, yPos:int):void{
			var xy:Point = new Point(xPos, yPos);
			var enemy:Yellow = new Yellow(xy);
			
			enemies.push(enemy);
			stage.addChild(enemy);
		}
		
		public static function spawnBlack(stage:Stage, xPos:int, yPos:int):void{
			var xy:Point = new Point(xPos, yPos);
			var enemy:Black = new Black(xy);
			
			enemies.push(enemy);
			stage.addChild(enemy);
		}
		
		public static function spawnDrill(stage:Stage, xPos:int, yPos:int):void{
			var xy:Point = new Point(xPos, yPos);
			var drill:Drill = new Drill(xy);
			
			physboxes.push(drill);
			stage.addChild(drill);
		}
		
		public static function spawnPlayerBullet(stage:Stage, xPos:int, yPos:int, dir:int):void{			
			var xy:Point = new Point(xPos, yPos);
			var playerBullet:PlayerBullet = new PlayerBullet(xy, dir);
			
			projectiles.push(playerBullet);
			stage.addChild(playerBullet);
		}
		
		public static function spawnEnemyBullet(stage:Stage, xPos:int, yPos:int, targetX:int, targetY:int, colour:String = "magenta"):void{			
			var xy:Point = new Point(xPos, yPos);
			var txy:Point = new Point(targetX, targetY);
			var enemyBullet:EnemyBullet = new EnemyBullet(xy, txy, colour);
			
			projectiles.push(enemyBullet);
			stage.addChild(enemyBullet);
		}
		
		public static function destroyEnt(stage:Stage, entity:Base){
			stage.removeChild(entity);
			entity = null;
		}
		
		public function update(stage:Stage):void{
			
			// Go through all entities, and splice and null any classes marked for destroy
			// If not, then update as usual.
			
			if (player.destroy){
				destroyEnt(stage, player);
			}else{
				player.update();
			}
			
			var i:int;
			
			for (i = physboxes.length - 1; i >= 0; i--){
				if (physboxes[i].destroy){
					destroyEnt(stage, physboxes[i]);
					physboxes.splice(i, 1);
				}else{
					physboxes[i].update();
				}
			}
			for (i = projectiles.length - 1; i >= 0; i--){
				if (projectiles[i].destroy){
					destroyEnt(stage, projectiles[i]);
					projectiles.splice(i, 1);
				}else{
					projectiles[i].update();
				}
			}
			for (i = enemies.length - 1; i >= 0; i--){
				if (enemies[i].destroy){
					destroyEnt(stage, enemies[i]);
					enemies.splice(i, 1);
				}else{
					enemies[i].update();
				}
			}
		}
	}
}