package particle 
{
	import flash.display.BitmapData;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author morgan
	 */
	public class Emitter 
	{
		private var system:ParticleSystem;
		private var particlePeriod:Number;
		private var particleTimer:Number = 0;
		public var x:Number = 0;
		public var y:Number = 0;
		
		private var emitterImg:BitmapData;
		
		public function Emitter(x:int, y:int, particlesPerSecond:Number) 
		{
			this.x = x;
			this.y = y;
			this.particlePeriod = 1.0 / particlesPerSecond;
			emitterImg = FlxG.addBitmap(ResourceManager.getRM().imgTempSmall);
		}
		
		public function setParticleSystem(system:ParticleSystem) : void
		{
			this.system = system;
		}
		
		public function update() : void
		{
			if (!system) { return; }
			particleTimer += FlxG.elapsed;
			while (particleTimer >= particlePeriod)
			{
				particleTimer -= particlePeriod;
				emit();
			}
		}
		
		protected function emit() : void
		{
			system.addSimpleImageParticle(x - 4, y - 4, emitterImg);
		}
		
	}

}