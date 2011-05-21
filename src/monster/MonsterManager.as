package monster 
{
	import flash.utils.Dictionary;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author morgan
	 */
	public class MonsterManager 
	{
		// Change a component, add a component, remove a component.
		// These should add up to 1.0
		private const CHANGE_CHANCE:Number = 0.5;
		private const ADD_CHANCE:Number = 0.3;
		private const REMOVE_CHANGE:Number = 0.2;
		
		private var allComponenets:Array = [
			[canHoldWeaponComponent, [Sword]],
			[canHoldWeaponComponent, [Spear]],
			[canCastSpellComponent, [SimpleMissile]],
			[runsBoostComponent, [1.2]],
			[runsBoostComponent, [1.5]],
			[runsBoostComponent, [2.0]],
		];
		
		private var monsters:Array;
		public function MonsterManager() 
		{
			monsters = new Array();
		}
		
		public function recordMonsterSuccess(md:MonsterDefinition, success:Number)
		{
			md.recordCreatureSuccess(success);
		}
		
		public function makeNewMonster(md:MonsterDefinition) : MonsterDefinition
		{
			var whichOperation:Number = Math.random();
			var newComponenets:Array = md.components.slice();
			// Change a component
			if ( whichOperation < CHANGE_CHANCE )
			{
				if ( newComponenets.length > 0 )
				{
					newComponenets.splice(int(Math.random() * md.components.length), 1);
				}
				var cData:Array = allComponents[int(Math.random() * allComponenets.length)];
				newComponenets.push(cData);
			}
			
			// Add a component
			else if (whichOperation < CHANGE_CHANCE + ADD_CHANCE)
			{
				var cData:Array = allComponents[int(Math.random() * allComponenets.length)];
				newComponenets.push(cData);
			}
			
			// Remove a component
			else
			{
				if ( newComponenets.length > 0 )
				{
					newComponenets.splice(int(Math.random() * md.components.length), 1);
				}
			}
			var def:MonsterDefinition = new MonsterDefinition(newComponenets);
			monsters.push(def);
			return def;
		}
	}

}