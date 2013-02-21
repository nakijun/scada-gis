package pkg1
{
	import mx.core.UIComponent;

	public class drawIcon extends UIComponent
	{
		private var backColor:uint;
		
		public function drawIcon(id:String, type:String,  x:Number, y:Number)
		{
			this.id = id;
			this.toolTip = type;
			//this.name = type;
			
			if(type=="location"){
				this.graphics.beginFill(0x0000ff);
				this.graphics.drawCircle(x, y, 7); 
				this.graphics.endFill();
			}
			else if(type=="region"){
				this.graphics.beginFill(0x00ff00);
				this.graphics.drawRect(x, y, 13, 13); 
				this.graphics.endFill();
			}
			
		}
	}
}