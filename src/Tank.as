package  
{
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	
	
	/**
	 * ...
	 * @author idris
	 */
	
	public class Tank extends TankBase
	
	{
		//private var tankBody:TankBodyArt;//verplaatsen naar tankbase
		//private var tankTurret:TankTurretArt;
		
		private var controlDir:Point;		
		private var speed:Number = 0;
		
		//public var turretAngle:Number = 0;//verplaatsen naar tankbase
		
		public function Tank() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			/*
			tankBody = new TankBodyArt();//verplaatsen naar tankbase
			this.addChild(tankBody);
			tankTurret = new TankTurretArt();
			this.addChild(tankTurret);	
			*/
			controlDir = new Point(0,0);
			
		}	
		
		private function init(e:Event):void 
		
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			//this.addEventListener(Event.ENTER_FRAME, loop);//verplaatsen naar tankbase
			stage.addEventListener(MouseEvent.CLICK, onClick);
			
		}		
		
		private function onClick(e:MouseEvent):void 
		
		{
			var se:ShootEvent = new ShootEvent("onShoot");
			se.shooter = this;
			dispatchEvent(se);
		}		
		
		override public function loop(e:Event):void 
		
		{		
			speed = controlDir.y * -5;			
			this.rotation += controlDir.x * 3; 
			
			
			//berekenen van beweging over x en y as nav rotatie
			var radian:Number = this.rotation * Math.PI / 180;//van graden naar radians
			var xMove:Number = Math.cos(radian);				
			var yMove:Number = Math.sin(radian);	
			this.x += xMove * speed;
			this.y += yMove * speed;
			
			targetPosition.x = mouseX;
			targetPosition.y = mouseY;
			super.loop(e);
			
			//verplaatst naar tankbase
			/*
			var dx:Number = mouseX;
			var dy:Number = mouseY;
			
			radian = Math.atan2(dy, dx);
			var angle:Number = radian * 180 / Math.PI;//omzetten van radian naar angle
			
			tankTurret.rotation = angle;
			turretAngle = tankTurret.rotation;//hiermee kun je in de main ook de turretangle lezen 
			*/			
		}
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				//speler drukt op W	//geld ook voor de anderen			
				controlDir.y = 0;
			}
			if (e.keyCode == Keyboard.A)
			{
								
				controlDir.x = 0;
			}
			if (e.keyCode == Keyboard.S)
			{
								
				controlDir.y = 0;
			}
			if (e.keyCode == Keyboard.D)
			{
				 					
				controlDir.x = 0;
			}
		}		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				//speler heeft de W losgelaten //geld ook voor anderen
				
				controlDir.y = -1;
			}
			if (e.keyCode == Keyboard.A)
			{
				
				
				controlDir.x = -1;
			}
			if (e.keyCode == Keyboard.S)
			{
				
				
				controlDir.y = 1;
			}
			if (e.keyCode == Keyboard.D)
			{
				
				
				controlDir.x = 1;
			}
			
		}
		override public function destroy():void
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.removeEventListener(MouseEvent.CLICK, onClick);
			super.destroy();
		}
		
	}

}