package 
{
	import flash.automation.KeyboardAutomationAction;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField; 
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Anna Rosén
	 */
	public class Main extends Sprite 
	{
		
		private var scoreText:TextField = new TextField(); 
		private var score:int = 0;

		public var map:Vector.<Vector.<Sprite>> = new Vector.<Vector.<Sprite>>(); 
		
		private var Boat:Bitmap; 
		
		public function Main():void 
		
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			scoreText.x = 490;
			scoreText.y = 100;
			 scoreText.text = "Score: 0";
			 addChild(scoreText);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, resetStage);
			
			for (var i: int = 0; i < 10; i++) 
			{
				var enRad:Vector.<Sprite> = new Vector.<Sprite> (); 
					for (var j:int = 0; j < 10; j++)
					{
						var rnd:Number = Math.random (); 
						var terrainType:int = 0; 
						if (rnd > 0, 3)
						
							terrainType = TileClass.WATER;
								else 	
							terrainType = TileClass.BOAT; 
						
						
						var t:TileClass = new TileClass(terrainType);
						
						t.x = 100 + j * (TileClass.TILE_SIDE + 1); 
						t.y = 100 + i * (TileClass.TILE_SIDE + 1);
						addChild(t);
						enRad.push(t); 
						t.addEventListener(MouseEvent.CLICK, clickTile); 
					}
			}
		} 
		
	
		
		function addBoats():void 
		{
			var boatX:int;
			var boatY:int;
			var horizontal:Boolean;
			
			
			
			horizontal = Math.round(Math.random());
			
			if (horizontal == true) 
			{
				boatX = Math.random() * 6;
				boatY = Math.random() * 9;
				
				TileClass(Boat[boatX][boatY]).addBoats();
				TileClass(Boat[boatX + 1][boatY]).addBoats();
				TileClass(Boat[boatX + 2][boatY]).addBoats();
				
			}
			else if (horizontal == false) 
			{
				boatX = Math.random() * 9;
				boatY = Math.random() * 6;
				
				TileClass(Boat[boatX][boatY]).addBoats();
				TileClass(Boat[boatX][boatY + 1]).addBoats();
				TileClass(Boat[boatX][boatY + 2]).addBoats();
				
			}
			var position:int = Math.round (Math.random()); 
			trace (y + "," + x); 
			trace (position); 
			
			
		}
		
		private function clickTile(e:MouseEvent):void
		
		{
			var test:String = TileClass(e.target).clicked(); 
			if (test == "Hit")
			{
				score += 1; 
			}
		
		}
		
		
		private function resetStage(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32)
			score = 0;
			scoreText.text = "Score: 0";
			for (var i: int = 0; i < 10; i++) 
			{
				var enRad:Vector.<Sprite> = new Vector.<Sprite> (); 
					for (var j:int = 0; j < 10; j++)
					{
						var rnd:Number = Math.random (); 
						var terrainType:int = 0; 
						if (rnd > 0, 3)
						
							terrainType = TileClass.WATER;
								else 	
							terrainType = TileClass.MISS; 
						
						
						var t:TileClass = new TileClass(terrainType);
						
						t.x = 100 + j * (TileClass.TILE_SIDE + 1); 
						t.y = 100 + i * (TileClass.TILE_SIDE + 1);
						addChild(t);
						
						t.addEventListener(MouseEvent.CLICK, clickTile); 
				
						
					}
		
					
			}
			addBoats(); 
		}
		
	}
}