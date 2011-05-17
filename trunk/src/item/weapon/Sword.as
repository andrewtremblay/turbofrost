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
					owner.x + owner.width / 2 + owner.facingNormalX * 16,
					owner.y + owner.height / 2 + owner.facingNormalY * 16,
					0, 0, 0.2, ResourceManager.getRM().imgTempSmall,
					Projectile.getProjectileDamageFunc(1, 15));
			super.attackShort();
		}
		
	}

}