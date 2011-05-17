package game 
{
	/**
	 * State for the main gameplay
	 * @author morgan
	 */
	public class PlayState extends BaseState
	{
		private var player:Player;
		
		public function PlayState() 
		{
			super();
		}
		
		override public function create():void 
		{
			super.create();
			player = new Player(180, 180);
			
			add(player);
		}
		
	}

}