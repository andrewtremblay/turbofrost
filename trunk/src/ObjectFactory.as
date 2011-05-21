package  
{
	import org.flixel.*;
	import particle.Emitter;
	import particle.ParticleSystem;
	import monster.*;
	import ui.StatBar;
	/**
	 * ...
	 * @author morgan
	 */
	public class ObjectFactory 
	{
		// Hmmmmm
		public static var stateFactory:ObjectFactory = null;
		
		private var actors:FlxGroup;
		private var projectiles:FlxGroup;
		private var particleSystem:ParticleSystem;
		private var gui:FlxGroup;
		private var extra:FlxGroup;
		public function ObjectFactory(actors:FlxGroup, projectiles:FlxGroup, particleSystem:ParticleSystem, gui:FlxGroup, extra:FlxGroup) 
		{
			this.actors = actors;
			this.projectiles = projectiles;
			this.particleSystem = particleSystem;
			this.gui = gui;
			this.extra = extra;
		}
		
		public function makeProjectile(x:int, y:int, xv:Number, yv:Number, timeout:Number, image:Class, onHit:Function, emitter:Emitter = null):void
		{
			var p:Projectile = new Projectile(x, y, xv, yv, timeout, image, onHit, emitter);
			if (emitter) { emitter.setParticleSystem(particleSystem); }
			p.x -= p.width / 2;
			p.y -= p.height / 2;
			projectiles.add(p);
		}
		
		public function makeActor(actorClass:Class, x:int, y:int, healthbar:Boolean = true) : void
		{
			var a:Actor = new actorClass(x, y);
			if (healthbar)
			{
				addHealthbar(a);
			}
			actors.add(a);
		}
		
		public function makeMonster(x:int, y:int, md:MonsterDefinition) : void
		{
			var components:Array = new Array();
			for each (var cData:Array in md.components)
			{
				var cClass:Class = (Class)(cData[0]);
				var ctorArgs:Array = cData[1];
				FlxG.log(ctorArgs);
				var comp:MonsterComponent = new cClass(ctorArgs);
				components.push(comp);
			}
			var m:Monster = new Monster(x, y, components);
			actors.add(m);
			for each (var c:MonsterComponent in components)
			{
				extra.add(c);
			}
			addHealthbar(m);
		}
		
		private function addHealthbar(a:Actor) : void
		{
			a.healthbar = new StatBar(0xffff0000, a.maxHealth, a.health);
			gui.add(a.healthbar);
		}
		
	}

}