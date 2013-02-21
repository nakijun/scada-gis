package pkg1
{
	import flash.geom.Point;
	
	import mx.containers.Box;
	import mx.containers.Canvas;
	import mx.containers.Panel;
	import mx.controls.Image;
	import mx.controls.Text;
	
	public class setToolTip extends Panel
	{
		public function setToolTip(pt:Point, gubun:String, valueType:String, direction:String, name:String, value:String, backColor:uint) 
		{
			super();
			
			var txtName:Text = new Text();
			txtName.htmlText = "aaa: <br />bbb:<br />ccc::";
			
			var txtValue:Text = new Text();
			txtValue.htmlText = "1111<br />2222<br />3333";
			
			
			this.title = name;
			this.setStyle("headerHeight",20);
			this.setStyle("cornerRadius",5);
			this.setStyle("backgroundColor", 0xefefef);
			this.setStyle("backgroundAlpha", 1);
			this.setStyle("dropShadowEnabled", false);
			//this.dropShadowEnabled = false;
			this.width = 150;
			this.height = 100;
			
			this.x = pt.x+24;
			this.y = pt.y+12-(this.height/2);
			
//			var box:Box = new Box();
//			box.width = 130;
//			box.height = 75;
//			box.setStyle("backgroundColor",0x00ff00);
//			this.addElement(box);
			
//			var box:Box = new Box();
//			box.width = 130;
//			box.height = 75;
//			box.setStyle("backgroundColor", 0x00ff00);
//			box.setStyle("backgroundImage", "panel_bg.png");
//			this.addElement(box);
			
			
			
//			var img:Image = new Image();
//			img.source = "images/panel_bg.png";
//			this.addElement(img);
			
			
		}
	}
}