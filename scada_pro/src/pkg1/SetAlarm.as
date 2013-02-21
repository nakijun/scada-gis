package pkg1
{
	import mx.containers.Box;
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.Label;

	public class SetAlarm extends HBox
	{
		public function SetAlarm(gubun:String, item:Object)
		{
			this.setStyle("borderVisible","true"); 
			this.setStyle("borderStyle","solid");
			
			switch(gubun)
			{
				case "center":
				case "region":
					this.addChild(createAlarmBox("통신이상"));
					break;
					
			}
			
		}
		
		private function createAlarmBox(text:String):VBox
		{
			var vbox:VBox = new VBox();
			vbox.width = 100;
			vbox.height = 30;
			vbox.setStyle("borderColor", 0x67679A); // 남색
			vbox.setStyle("borderVisible", "true"); 
			//vbox.setStyle("backgroundColor", 0x67679A); 
			//vbox.setStyle("borderThickness", "1"); 
			vbox.setStyle("borderStyle", "solid"); 
			vbox.setStyle("horizontalAlign", "center");
			vbox.setStyle("verticalAlign", "middle");
			
			
			
			
			var lbl:Label = new Label();
			lbl.text = text;
			//lbl.setStyle("color",0xFFFFFF);
			vbox.addChild(lbl);
			
			var box:Box = new Box();
			box.width = vbox.width-2;
			box.height = 10;
			box.setStyle("backgroundColor", 0x67679A); // 남색
			vbox.addChild(box);
			
			
			return vbox;
		}
		
		//private function createImage(
	}
}