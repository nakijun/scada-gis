package pkg1
{
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	
	import mx.controls.Image;
	
	
	
	public class setIcon extends Image
	{
		public function setIcon(id:String, img:Bitmap, x:Number, y:Number)
		{
			super();
			
			this.source = img;
			this.id = id;
			this.x = x;
			this.y = y;
			this.width = 20;
			this.height = 20;
			//this.buttonMode = true;
			
			//this.addEventListener(MouseEvent.CLICK, listenerMouseClick);
			
		}
		//		private function listenerMouseClick(event:MouseEvent):void{
		//			mx.controls.Alert.show(event.currentTarget.id);
		//		}
		
	}
	
	
}