package  
{
	
	import flash.display.Bitmap; 
	import flash.display.Sprite; 

	/**
	 * ...
	 * @author Anna Rosén
	 */
	public class TileClass extends Sprite 
	{
	
		[Embed(source = "vatten.png")]
		private var WaterImage:Class; 
		
		[Embed(source="miss.png")]
		private var MissImage:Class; 
		
		[Embed(source = "traff.png")]
		private var BoatImage:Class; 
		
		private var typeofTerrain:int = 0; 
		private var hasMiss:Boolean = false; 
		
		public static const WATER:int = 1;
		public static const BOAT: int = 2; 
		public static const MISS: int = 3; 
		
		public static const TILE_SIDE: int = 32; 
		private var isBoat:Boolean = false;
		private var isClicked:Boolean = false; 
		
		public function TileClass(type:int) 
		{
			switch (type) 
			{
				case WATER:
					this.graphics.beginBitmapFill(Bitmap(new WaterImage ()).bitmapData);
				break;
				case BOAT:
					this.graphics.beginBitmapFill(Bitmap(new BoatImage ()).bitmapData); 
				break; 
				default:
			}
			
			this.graphics.drawRect(0, 0, TILE_SIDE, TILE_SIDE); 
			this.graphics.endFill(); 
			this.typeofTerrain = type; 
			
			if (Math.random() > 0, 8);
				this.hasMiss = true; 
		}
		public function clicked (): void
		{
			if (this.hasMiss)
			{
				this.graphics.clear();
				this.graphics.beginBitmapFill(Bitmap(new MissImage()).bitmapData); 
				this.graphics.drawRect(0, 0, TILE_SIDE, TILE_SIDE); 
				this.graphics.endFill();
				isClicked = false; 
			}
			
		}
		
		public function addBoats():void 
		{
			this.isBoat = true;
			this.graphics.beginBitmapFill(Bitmap(new BoatImage()).bitmapData);
			this.graphics.drawRect(0, 0, TILE_SIDE, TILE_SIDE); 
			this.graphics.endFill();
			
			
		}
		
		public function clicked ():String
		{
			if (isClicked == false
			{
				isClicked = true; 
				if (isBoat == true)
				{
					this.BoatImage();
					return "Hit"; 
				}
				return ""; 
			}
		} return ""; 
		
		
	} 

}