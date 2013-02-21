package pkg1
{
	import mx.containers.TitleWindow;
	import mx.controls.Label;
	
	import spark.components.TextArea;
	
	

	public class setTitleWindow extends TitleWindow
	{
		private var textarea:TextArea = new TextArea();
		
		public function setTitleWindow(width:Number, height:Number, title:String, msg:String)
		{
			//this.setStyle("headerHeight", 20);
			this.width = width;
			this.height = height;
			this.title = title;
			
			var label:Label = new Label();
			label.text = msg;
			this.addChild(label);
			
			
//			textarea.width = this.width - 6;
//			textarea.height = this.height - 10;
//			
//			this.addChild(textarea);
		}
		
		public function write(text:String):void
		{
			textarea.text = text;
		}
	}
}