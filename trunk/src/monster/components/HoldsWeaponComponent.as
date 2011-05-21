package monster.components 
{
	import item.weapon.Weapon;
	import monster.MonsterComponent;
	/**
	 * ...
	 * @author morgan
	 */
	public class HoldsWeaponComponent extends MonsterComponent
	{
		private var weapon:Weapon;
		public function HoldsWeaponComponent(args:Array) 
		{
			super(args);
			weapon = new args[0]();
			weapon.setOwner(owner);
			loadGraphic(ResourceManager.getRM().imgTempSmall);
		}
		
	}

}