package mapgen 
{
	import org.flixel.FlxTilemap;
	/**
	 * This class is constructed by the game and is used to create the "dungeons" in the game. 
	 * @author morgan
	 */
	public class MapGenerator 
	{
		
		public function MapGenerator() 
		{
			
		}
		
		// I'm sure this will have parameters later.
		public function getNextMap() : FlxTilemap
		{
			// Good luck, pal.
			return new FlxTilemap();
		}
		
	}

}