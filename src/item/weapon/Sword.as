package item.weapon 
{
	import org.flixel.FlxG;
	import item.Inventory
	/**
	 * ...
	 * @author morgan
	 */
	public class Sword extends Weapon
	{
		
		public function Sword() 
		{
			itemSlot = Inventory.EQUIP_WEAPON;
		}
		
		override public function attackShort():void 
		{
			ObjectFactory.stateFactory.makeProjectile(
					owner.x, owner.y, 0, 0, ResourceManager.getRM().imgTempSmall,
					Projectile.getProjectileDamageFunc(1, 0));
			super.attackShort();
		}
		
	}

}