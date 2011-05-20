package ui 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author morgan
	 */
	public class StatBar extends FlxSprite
	{
		public var barColor:uint;
		public var maxValue:Number;
		public var currentValue:Number;
		
		public function StatBar(color:uint, maxValue:Number, currentValue:Number, width:int = 16) 
		{
			this.barColor = color;
			this.maxValue = maxValue;
			this.currentValue = currentValue;
			this.width = width;
			this.height = 4;
			setValue(maxValue);
		}
		
		public function setValue(value:Number) : void
		{
			this.currentValue = value;
			// Inside size (there's a 1-pixel border)
			var iWidth:int = width - 2;
			var iHeight:int = height - 2;
			
			// Create the image
			this.pixels = new BitmapData(width, height, false, 0xff000000);
			var bar:Number = (currentValue / maxValue) * iWidth;
			this.pixels.fillRect(new Rectangle(1, 1, bar, 2), barColor);
			calcFrame();
		}
		
	}

}