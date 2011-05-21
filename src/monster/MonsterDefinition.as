package monster 
{
	/**
	 * ...
	 * @author morgan
	 */
	public class MonsterDefinition 
	{
		public var totalSuccess:Number = 0;
		public var numCreatures:int = 0;
		public var components:Array;
		public function MonsterDefinition(components:Array) 
		{
			this.components = components;
		}
		
		public function recordCreatureSuccess(success:Number) : void
		{
			totalSuccess += success;
			numCreatures++;
		}
		
	}

}