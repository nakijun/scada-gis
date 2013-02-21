package
{
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	import mx.managers.CursorManager;
	
	import org.rockholla.controls.panzoom.PanZoomComponent;
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	public class CustomPanZoomContent extends PanZoomContent
	{
		/**
		 * You can make your own special extension of PanZoomContent to fit your particular needs
		 * 
		 */
		public function CustomPanZoomContent()
		{
			super();
			this.width = 1; //12140;
			this.height = 1; //14940;
			this.backgroundColor = 0xF2EFDC;
			this.backgroundAlpha = 1;
			this.borderColor = 0x000000;
			this.borderThickness = 0; // 10;
			this.borderAlpha = 0.4;
			
		}
		
		override protected function _onCreationComplete(event:FlexEvent):void
		{
			super._onCreationComplete(event);
			//this.addEventListener(MouseEvent.MOUSE_DOWN, this._onMouseDown); 
			this.addEventListener(MouseEvent.MOUSE_OVER, this._onMouseOver); 
		}
		
		override protected function _drawContent(isRedraw:Boolean = true):void
		{
			super._drawContent(isRedraw);
			//this._drawPanZoomContentGrid();
		}
		
		protected function _onMouseDown(event:MouseEvent):void
		{
			trace("Mouse down on content");
		}
		
		protected function _onMouseOver(event:MouseEvent):void
		{
			this.useHandCursor = false;
			//this.cursorManager.removeCursor(CursorManager.getInstance().currentCursorID);
		}
		
//		protected function _drawPanZoomContentGrid():void 
//		{
//			
//			var xAt:int = 0;
//			var yAt:int = 0;
//			
//			this.graphics.lineStyle(0.5, 0x000000, 0.2);
//			
//			// draw the vertical lines
//			while (xAt <= this.widthAsSet) 
//			{
//				this.graphics.moveTo(xAt, 0);
//				this.graphics.lineTo(xAt, this.heightAsSet);
//				xAt = xAt + 20;
//			}
//			
//			// draw the horizontal lines
//			while (yAt <= this.heightAsSet) 
//			{
//				this.graphics.moveTo(0, yAt);
//				this.graphics.lineTo(this.widthAsSet, yAt);
//				yAt = yAt + 20;
//			}
//			
//		}
		
	}
}