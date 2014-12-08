package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author idirs
	 */
	public class Chest extends Sprite
	{
		private var chestArt:MovieClip;
		public var lives:int = 10;
		public function Chest() 
		{
			chestArt = new ChestArt();
			addChild(chestArt);
		}
		
	}

}
