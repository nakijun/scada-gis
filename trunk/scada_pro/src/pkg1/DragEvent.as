package pkg1
{
	import flash.events.MouseEvent;
	
	import mx.containers.TitleWindow;

	public class DragEvent
	{
		private var isDrag:Boolean;
		
		public function DragEvent()
		{
			isDrag = false;
		}
		
		public function dragStart(target:TitleWindow) : Function {
			var fn:Function = FnDrag;
			
			function FnDrag(me:MouseEvent):void{
				if(!isDrag){
					target.startDrag();
					isDrag = true;
				}
				
			}
			
			return fn;
		}
		
		public function dragStop(target:TitleWindow):Function{
			var fn:Function = fnDrop;
			
			function fnDrop(me:MouseEvent):void{
				if(isDrag){
					target.stopDrag();
					isDrag = false;
				}
			}
			
			return fn;
		}
		
		
	}
}