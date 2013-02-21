package pkg1
{
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import mx.containers.Box;
	import mx.containers.HBox;
	import mx.controls.Label;
	import mx.core.UIComponent;
	
	import spark.components.BorderContainer;
	import spark.components.HGroup;
	import spark.layouts.HorizontalLayout;
	
	
	
	public class scadaToolTip extends UIComponent
	{
		[Embed(source='/font/HYWULM.TTF', embedAsCFF="true",  fontName="myfont")]
		public var myfont:Class;
		
		
		public function scadaToolTip(pt:Point, gubun:String, valueType:String, direction:String, name:String, value:String, backColor:uint) 
		{
			
			// 아이콘 중앙위치점
//			var startX:Number = (gubun=="location") ?  pt.x : pt.x+7;
//			var startY:Number = (gubun=="location") ?  pt.y : pt.y+7;
			var startX:Number = pt.x+10;
			var startY:Number = pt.y+10;
			
			
			// 벡터
			var vectorLength:Number = 8; // 벡터길이
			var vectorOffset:Number = 8; // 벡터옵셋
			var vectorX1:Number;
			var vectorY1:Number;
			var vectorX2:Number;
			var vectorY2:Number;
			var vectorXX1:Number;
			var vectorYY1:Number;
			var vectorXX2:Number;
			var vectorYY2:Number;
			
			// 박스
			var boxHeight:Number = 30;
			
			// 박스 layout
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.paddingTop = 3;
			layout.paddingLeft = 6;
			layout.horizontalAlign = "left";
			layout.verticalAlign = "top";
			
			// 박스 만들기	
			var box:BorderContainer = new BorderContainer();
			box.height = 30;
			box.setStyle("cornerRadius", 5);
			box.setStyle("borderWeight", 2);
			box.setStyle("borderColor", 0x000000);
			box.setStyle("backgroundColor", backColor);
			box.layout = layout;
			this.addChild(box);
			
			
			
			
			// Text UI
			var comp:UIComponent = new UIComponent();
			
			// Name format
			var fmtName:TextFormat = new TextFormat();
			fmtName.font = "gulim"; 
			fmtName.size = 12;
			fmtName.bold = true;
			fmtName.color = 0xffffff;
			// Name
			var txtName:TextField = new TextField();
			txtName.htmlText = name;
			txtName.autoSize = TextFieldAutoSize.LEFT;
			txtName.setTextFormat(fmtName);
			comp.addChild(txtName);
			
			// Value format
			var fmtValue:TextFormat = new TextFormat(); 
			fmtValue.size = 12;
			fmtValue.bold = true;
			fmtValue.color = 0x000000;
			//  Value
			var txtValue:TextField = new TextField();
			txtValue.htmlText = value;
			txtValue.autoSize = TextFieldAutoSize.LEFT;
			txtValue.setTextFormat(fmtValue);
			txtValue.opaqueBackground = 0xffffff;
			txtValue.x = txtName.textWidth + 8;
			
			comp.addChild(txtValue);
			
			// Add text to box
			box.addElement(comp);
			
			// Define box width
			box.width = txtValue.x + txtValue.textWidth + 20; 
			
			
			switch(direction){
				case "upperLeft": 
					vectorX1 = startX-vectorLength-1;
					vectorY1 = startY-vectorLength-vectorOffset;
					vectorX2 = startX-vectorLength-vectorOffset;
					vectorY2 = startY-vectorLength-1;
					
					vectorXX1 = vectorX1-1;
					vectorYY1 = vectorY1+1;
					vectorXX2 = vectorX2+1;
					vectorYY2 = vectorY2-1;
					
					box.x = startX-vectorLength-box.width;
					box.y = startY-vectorLength-box.height;
					break;
				case "upperRight": 
					vectorX1 = startX+vectorLength+1;
					vectorY1 = startY-vectorLength-vectorOffset;
					vectorX2 = startX+vectorLength+vectorOffset;
					vectorY2 = startY-vectorLength-1;
					
					vectorXX1 = vectorX1+1;
					vectorYY1 = vectorY1+1;
					vectorXX2 = vectorX2-1;
					vectorYY2 = vectorY2-1;
					
					box.x = startX+vectorLength;
					box.y = startY-vectorLength-box.height;
					break;
				case "upperCenter": 
					vectorX1 = startX-vectorOffset/2;
					vectorY1 = startY-vectorLength;
					vectorX2 = startX+vectorOffset/2;
					vectorY2 = startY-vectorLength;
					
					vectorXX1 = vectorX1+1;
					vectorYY1 = vectorY1-1;
					vectorXX2 = vectorX2-1;
					vectorYY2 = vectorY2-1;
					
					box.x = startX-box.width/2;
					box.y = startY-vectorLength-box.height;
					break;
				case "lowerLeft":
					vectorX1 = startX-vectorLength-1;
					vectorY1 = startY+vectorLength+vectorOffset;
					vectorX2 = startX-vectorLength-vectorOffset;
					vectorY2 = startY+vectorLength+1;
					
					vectorXX1 = vectorX1-1;
					vectorYY1 = vectorY1-1;
					vectorXX2 = vectorX2+1;
					vectorYY2 = vectorY2+1;
					
					box.x = startX-vectorLength-box.width;
					box.y = startY+vectorLength;
					break;
				case "lowerRight": 
					vectorX1 = startX+vectorLength+1;
					vectorY1 = startY+vectorLength+vectorOffset;
					vectorX2 = startX+vectorLength+vectorOffset;
					vectorY2 = startY+vectorLength+1;
					
					vectorXX1 = vectorX1+1;
					vectorYY1 = vectorY1-1;
					vectorXX2 = vectorX2-1;
					vectorYY2 = vectorY2+1;
					
					box.x = startX+vectorLength;
					box.y = startY+vectorLength;
					break;
				case "lowerCenter": 
					vectorX1 = startX-vectorOffset/2;
					vectorY1 = startY+vectorLength;
					vectorX2 = startX+vectorOffset/2;
					vectorY2 = startY+vectorLength;
					
					vectorXX1 = vectorX1+1;
					vectorYY1 = vectorY1+1;
					vectorXX2 = vectorX2-1;
					vectorYY2 = vectorY2+1;
					
					box.x = startX-box.width/2;
					box.y = startY+vectorLength;
					break;
				case "middleLeft":
					vectorX1 = startX-vectorLength-1;
					vectorY1 = startY-vectorOffset/2;
					vectorX2 = startX-vectorLength-1;
					vectorY2 = startY+vectorOffset/2;
					
					vectorXX1 = vectorX1;
					vectorYY1 = vectorY1;
					vectorXX2 = vectorX2;
					vectorYY2 = vectorY2;
					
					box.x = startX-vectorLength-box.width;
					box.y = startY-box.height/2;
					break;
				case "middleRight":
					vectorX1 = startX+vectorLength+1;
					vectorY1 = startY-vectorOffset/2;
					vectorX2 = startX+vectorLength+1;
					vectorY2 = startY+vectorOffset/2;
					
					vectorXX1 = vectorX1;
					vectorYY1 = vectorY1;
					vectorXX2 = vectorX2;
					vectorYY2 = vectorY2;
					
					box.x = startX+vectorLength;
					box.y = startY-box.height/2;
					break;
			}
			
			// 벡터
			var compVector:UIComponent = new UIComponent();
			compVector.graphics.beginFill(backColor);
			compVector.graphics.lineStyle(2, 0x000000);
			compVector.graphics.moveTo(startX, startY);
			compVector.graphics.lineTo(vectorX1, vectorY1);
			compVector.graphics.lineTo(vectorX2, vectorY2);
			compVector.graphics.lineTo(startX, startY);
			compVector.graphics.endFill();
			
			// 벡터마무리
			compVector.graphics.lineStyle(2, backColor);
			compVector.graphics.moveTo(vectorXX1, vectorYY1);
			compVector.graphics.lineTo(vectorXX2, vectorYY2);
			this.addChild(compVector);
			
			
			
		}
	}
}