package particle 
{
	import flash.display.Shape;
	import org.flixel.FlxBasic;
	import org.flixel.FlxParticle;
	import org.flixel.*;
	/**
	 * 
	 * @author morgan
	 */
	public class ParticleSystem extends FlxBasic
	{
		
		private var numParticles:int;
		private var particles:Array;
		
		public function ParticleSystem(maxParticles:int) 
		{
			super();
			particles = new Array();
			for (maxParticles; maxParticles > 0; maxParticles--)
			{
				particles.push(new Particle());
			}
		}
		
		public function addParticle(x:int, y:int) : void
		{
			for each (var p:Particle in particles)
			{
				if (!p.alive)
				{
					p.spawn(x, y, Math.random() * 100 - 50, Math.random() * 100 - 50, Math.random() + 0.25);
					break;
				}
				
			}
		}
		
		override public function draw():void 
		{
			for each (var p:Particle in particles)
			{
				if (p.alive)
				{
					var screenX:Number = p.x + FlxG.camera.scroll.x;
					var screenY:Number = p.y + FlxG.camera.scroll.y;
					FlxG.camera.buffer.setPixel32(screenX, screenY, FlxU.makeColor(0,0,0, p.life / p.maxLife));
				}
			}
			super.draw();
		}
		
		override public function update():void 
		{
			for each (var p:Particle in particles)
			{
				if (p.alive)
				{
					p.x += p.xv * FlxG.elapsed;
					p.y += p.yv * FlxG.elapsed;
					p.life -= FlxG.elapsed;
					if (p.life <= 0)
					{
						p.alive = false;
					}
				}
			}			
			super.update();
		}
		
	}

}