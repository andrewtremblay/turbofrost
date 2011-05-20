package item.spell 
{
	/**
	 * ...
	 * @author morgan
	 */
	public class SimpleMissile extends Spell
	{
		
		public function SimpleMissile() 
		{
			
		}
		
		override protected function cast(charge:Number):void 
		{
			ObjectFactory.stateFactory.makeProjectile(
				owner.x + owner.width / 2, owner.y + owner.height / 2,
				owner.facingNormalX * 140, owner.facingNormalY * 140, charge + 0.25, 
				ResourceManager.getRM().imgTempSmall, 
				Projectile.getProjectileDamageFunc(0, owner.facingNormalX * 260, owner.facingNormalY * 260));
		}
		
	}

}