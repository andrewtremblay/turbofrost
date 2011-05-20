package particle 
{
	import flash.display.BitmapData;
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
		public var image:BitmapData;
		public var color:uint = 0xff000000;
		public var fade:Boolean = true;
		public function Particle() 
		{
			alive = false;
		}
		
		public function spawn(x:int, y:int, xv:int, yv:int, life:Number, image:BitmapData = null, color:uint = 0, fade:Boolean = true) : void
		{
			this.x = x;
			this.y = y;
			this.xv = xv;
			this.yv = yv;
			this.life = this.maxLife = life;
			
			if (color == 0)
			{
				this.color = image == null? 0xff000000 : 0xffffffff;
			}
			else
			{
				this.color = color;
			}
			this.image = image;
			this.fade = fade;
			
			alive = true;
		}
		
	}

}