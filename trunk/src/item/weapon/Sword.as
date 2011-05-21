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
			itemSlots = [Inventory.EQUIP_WEAPON];
		}
		
		override public function attackWeak():void 
		{
			ObjectFactory.stateFactory.makeProjectile(
					owner.x + owner.width / 2 + owner.facingNormalX * 16,
					owner.y + owner.height / 2 + owner.facingNormalY * 16,
					0, 0, 0.1, ResourceManager.getRM().imgTempSmall,
					Projectile.getProjectileDamageFunc(5, owner.facingNormalX * 60, owner.facingNormalY * 60));
			super.attackWeak();
		}
		
		override public function attackStrong():void 
		{
			ObjectFactory.stateFactory.makeProjectile(
					owner.x + owner.width / 2 + owner.facingNormalX * 16,
					owner.y + owner.height / 2 + owner.facingNormalY * 16,
					owner.facingNormalY * 20, owner.facingNormalX * 20, 0.3, ResourceManager.getRM().imgTempSmall,
					Projectile.getProjectileDamageFunc(5, owner.facingNormalX * 60, owner.facingNormalY * 60));
			super.attackWeak();
		}		
		
	}

}