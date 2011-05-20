package particle 
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
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
		
		public function addSimplePixelParticle(x:int, y:int, color:uint) : void
		{
			addParticle(x, y, Math.random() * 100 - 50, Math.random() * 100 - 50, Math.random() + 0.25, null, color, true);
		}
		
		public function addSimpleImageParticle(x:int, y:int, image:BitmapData) : void
		{
			addParticle(x, y, Math.random() * 100 - 50, Math.random() * 100 - 50, Math.random() + 0.25, image, 0xffffffff, true);
		}		
		
		public function addParticle(x:int, y:int, xv:Number, yv:Number, life:Number, image:BitmapData, color:uint, fade:Boolean) : void
		{
			for each (var p:Particle in particles)
			{
				if (!p.alive)
				{
					p.spawn(x, y, xv, yv, life, image, color, fade);
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
					var fade:Number = p.fade ? p.life / p.maxLife : 1;
					var rgba:Array = FlxU.getRGBA(p.color);					
					if ( p.image )
					{
						var mtx:Matrix = new Matrix(1, 0, 0, 1, screenX, screenY);
						var ct:ColorTransform = new ColorTransform(rgba[0], rgba[1], rgba[2], fade * rgba[3]);
						FlxG.camera.buffer.draw(p.image, mtx, ct);
					}
					else
					{
						// This doesn't work because setPixel32 doesn't do alpha the expected way
						FlxG.camera.buffer.setPixel32(screenX, screenY, FlxU.makeColor(rgba[0], rgba[1], rgba[2], fade * rgba[3]));
					}
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