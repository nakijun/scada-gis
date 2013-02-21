package pkg1
{
	import mx.controls.Label;
	
	public class setLabel extends Label
	{
		public function setLabel(text:String, color:String)
		{
			this.text = text;
			
			this.setStyle("color", color);
			this.height = 17;
			//this.opaqueBackground = 0x00ff00;
		}
	}
}