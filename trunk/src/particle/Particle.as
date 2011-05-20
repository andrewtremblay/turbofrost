package particle 
{
	/**
	 * ...
	 * @author morgan
	 */
	public class Particle 
	{
		public var x:Number=0;
		public var y:Number=0;
		public var xv:Number=0;
		public var yv:Number=0;
		public var alive:Boolean = false;
		public var life:Number = 0;
		public var maxLife:Number = 0;
		public function Particle() 
		{
			alive = false;
		}
		
		public function spawn(x:int, y:int, xv:int, yv:int, life:Number) : void
		{
			this.x = x;
			this.y = y;
			this.xv = xv;
			this.yv = yv;
			this.life = this.maxLife = life;
			alive = true;
		}
		
	}

}