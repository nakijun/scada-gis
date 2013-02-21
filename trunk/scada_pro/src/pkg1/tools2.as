package pkg1
{
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	import mx.effects.Fade;
	import mx.effects.Glow;
	import mx.effects.Move;
	import mx.effects.Parallel;
	import mx.effects.Resize;
	import mx.effects.Rotate;
	import mx.effects.Sequence;
	import mx.effects.easing.Exponential;
	
	public class tools2
	{
				private const geoX1:Number = 128.8021996; //경도 longitude
				private const geoY1:Number = 35.4725745; // 위도 latitude
				private const geoX2:Number = 129.2445934;
				private const geoY2:Number = 34.9857983;
		
//				private const _panzoomWidth:Number = 17296; //5440;
//				private const _panzoomHeight:Number = 18957; //6640;
		
		
		private var _panzoomWidth:Number;
		private var _panzoomHeight:Number;
		
		private var offSetX:Number;
		private var offSetY:Number;
		
		public function tools2(width:Number, height:Number)
		{
			this._panzoomWidth = width;
			this._panzoomHeight = height;
			
			offSetX = (geoX2 - geoX1) / this.panzoomWidth;
			offSetY = (geoY1 - geoY2) / this.panzoomHeight;
		}
		
		
		
		public function get panzoomWidth():Number
		{
			return this._panzoomWidth;
		}
		public function get panzoomHeight():Number
		{
			return this._panzoomHeight;
		}
		
		//----------------- 변환 함수 ------------------------------------------------------------------
		public function convertToGeo(x:Number, y:Number):Point
		{ 
			return new Point(this.geoX1 +(x * this.offSetX), this.geoY1 - (y * this.offSetY));
		}
		public function convertToFixel(geoX:Number, geoY:Number):Point
		{
			var geoWidth:Number = geoX - this.geoX1;
			var geoHeight:Number = this.geoY1 - geoY;
			
			var x:Number = geoWidth / this.offSetX;
			var y:Number = geoHeight / this.offSetY;
			
			
			return new Point((geoX - this.geoX1) / this.offSetX, (this.geoY1 - geoY) / this.offSetY);
		}
		
		
		public function findIndex(ac:ArrayCollection, attr:String, value:Object):int
		{
			for(var i:int=0; i<ac.length; i++){
				if(ac[i][attr] == value) return i;
			}
			return -1;
		}
		
		// 점점 사라지게 보이게 효과
		public function f_fade(obj:Object, from_val:Number, to_val:Number):Fade{
			var fade:Fade  = new Fade(obj);
			fade.alphaFrom = from_val;
			fade.alphaTo   = to_val;
			return fade;
		}
		// 번짐효과(경보)
		public function f_glow(obj:Object, afrom_val:Number, ato_val:Number, xfrom_val:Number, xto_val:Number, yfrom_val:Number, yto_val:Number, time1:Number, cnt:Number, color:String):Glow{
			var glow:Glow  = new Glow(obj);
			glow.alphaFrom = afrom_val;
			glow.alphaTo   = ato_val;
			glow.blurXFrom = xfrom_val;
			glow.blurXTo   = xto_val;
			glow.blurYFrom = yfrom_val;
			glow.blurYTo   = yto_val;
			glow.color     = new uint("0x" + color); 
			glow.repeatCount=cnt; 
			glow.duration  = time1;
			return glow;
		}
		// 리사이징
		public function f_resize(obj:Object, width_:int, height_:int ):Resize{
			var resize:Resize = new Resize(obj);
			resize.widthTo  = width_;
			resize.heightTo = height_;
			resize.easingFunction = Exponential.easeOut;
			return resize;
		}
		// 이동
		public function f_move(obj:Object, x_:int, y_:int):Move{
			var move:Move = new Move(obj);
			move.xTo = x_;
			move.yTo = y_;
			move.easingFunction = Exponential.easeOut;
			return move 
		}	
		// 회전
		public function f_rotate(obj:Object):void{
			var rotate:Rotate = new Rotate(obj);
			rotate.angleFrom = 0; 
			rotate.angleTo = 1440; 
			rotate.duration = 5000; 
			
			rotate.originX = obj.width / 2; 
			rotate.originY = obj.height / 2; 
			
			rotate.end(); 
			rotate.target = obj; 
			rotate.play(); 
			
		}
	}
}