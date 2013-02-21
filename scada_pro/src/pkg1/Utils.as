package pkg1
{
	
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	
	public class Utils
	{
		// 기준좌표
		public static var baseGeoPt:Point;
		
		public static var offSetX:Number;
		public static var offSetY:Number;
		
		public function Utils()
		{
		}
		
		//----------------- 변환 함수 ------------------------------------------------------------------
		public static function convertToGeo(x:Number, y:Number):Point
		{ 
			//return new Point(this.geoX1 +(x * this.offSetX), this.geoY1 - (y * this.offSetY));
			return new Point(baseGeoPt.x +(x * offSetX), baseGeoPt.y - (y * offSetY));
		}
		public static function convertToFixel(geoX:Number, geoY:Number):Point
		{
			//return new Point((geoX - this.geoX1) / this.offSetX, (this.geoY1 - geoY) / this.offSetY);
			return new Point((geoX - baseGeoPt.x) / offSetX, (baseGeoPt.y - geoY) / offSetY);
		}
		
		// 알람 H/L Boolean값을 가져온다
		public static function getAlarmHL(gubun:String, item:Object):Object
		{
			var alarmHL:Object = new Object();
			
			
			switch(gubun){
				case "center":
				case "region":
					alarmHL["PRES1_H"] = item.PRES11_H;
					alarmHL["PRES1_L"] = item.PRES11_L;
					alarmHL["PRES2_H"] = item.PRES21_H;
					alarmHL["PRES2_L"] = item.PRES21_L;
					alarmHL["FILT1_H"] = item.FILT1_H;
					alarmHL["FILT1_L"] = item.FILT1_L;
					alarmHL["ELEC1_H"] = item.ELEC1_H;
					alarmHL["ELEC1_L"] = item.ELEC1_L;
					alarmHL["CURR1_H"] = item.CURR1_H;
					alarmHL["CURR1_L"] = item.CURR1_L;
					alarmHL["VOLT1_H"] = false;
					alarmHL["VOLT1_L"] = false;
					break;
				case "location":
					alarmHL["PRES1_H"] = item.PRES1_H;
					alarmHL["PRES1_L"] = item.PRES1_L;
					alarmHL["PRES2_H"] = item.PRES2_H;
					alarmHL["PRES2_L"] = item.PRES2_L;
					alarmHL["FILT1_H"] = item.FILT1_H;
					alarmHL["FILT1_L"] = item.FILT1_L;
					alarmHL["ELEC1_H"] = item.ELEC1_H;
					alarmHL["ELEC1_L"] = item.ELEC1_L;
					alarmHL["CURR1_H"] = item.CURR1_H;
					alarmHL["CURR1_L"] = item.CURR1_L;
					alarmHL["VOLT1_H"] = false;
					alarmHL["VOLT1_L"] = false;
					break;
				case "endine":
					alarmHL["PRES1_H"] = item.PRES11_H;
					alarmHL["PRES1_L"] = item.PRES11_L;
					alarmHL["PRES2_H"] = false;
					alarmHL["PRES2_L"] = false;
					alarmHL["FILT1_H"] = false;
					alarmHL["FILT1_L"] = false;
					alarmHL["ELEC1_H"] = false;
					alarmHL["ELEC1_L"] = false;
					alarmHL["CURR1_H"] = false;
					alarmHL["CURR1_L"] = false;
					alarmHL["VOLT1_H"] = item.VOLT1_H;
					alarmHL["VOLT1_L"] = item.VOLT1_L;
					break;
				case "rectifire":
					alarmHL["PRES1_H"] = false;
					alarmHL["PRES1_L"] = false;
					alarmHL["PRES2_H"] = false;
					alarmHL["PRES2_L"] = false;
					alarmHL["FILT1_H"] = false;
					alarmHL["FILT1_L"] = false;
					alarmHL["ELEC1_H"] = item.ELEC1_H;
					alarmHL["ELEC1_L"] = item.ELEC1_L;
					alarmHL["CURR1_H"] = item.CURR1_H;
					alarmHL["CURR1_L"] = item.CURR1_L;
					alarmHL["VOLT1_H"] = item.VOLT1_HI; // VOLT1_HI
					alarmHL["VOLT1_L"] = item.VOLT1_L;
					break;
				case "mov":
					alarmHL["PRES1_H"] = item.PRES1_H;
					alarmHL["PRES1_L"] = item.PRES1_L;
					alarmHL["PRES2_H"] = item.PRES2_H;
					alarmHL["PRES2_L"] = item.PRES2_L;
					alarmHL["FILT1_H"] = item.FILT1_H;
					alarmHL["FILT1_L"] = item.FILT1_L;
					alarmHL["ELEC1_H"] = item.ELEC1_H;
					alarmHL["ELEC1_L"] = item.ELEC1_L;
					alarmHL["CURR1_H"] =false;
					alarmHL["CURR1_L"] = false;
					alarmHL["VOLT1_H"] = false;
					alarmHL["VOLT1_L"] = false;
					break;
			}
			
			return alarmHL;
		}
		//--------------- 세점의 사이각을 구한다. ----------------------------------------------------------------
		public static function getTheta(pt1:Point, pt2:Point, pt3:Point):Number
		{
			var d12:Number = getPointDistance(pt1, pt2);
			var d23:Number = getPointDistance(pt2, pt3);
			var d13:Number = getPointDistance(pt1, pt3);
			
			var arg:Number = (Math.pow(d12, 2) + Math.pow(d23, 2) - Math.pow(d13, 2) ) / (2 * d12 *  d23);
			var radian:Number = Math.acos(arg);
			var theta:Number = Math.round(radian*180/Math.PI);
			
			return theta;
			
		}
		private static function getPointDistance(pt1:Point, pt2:Point):Number
		{
			var dx:Number = pt1.x - pt2.x;
			var dy:Number = pt1.y - pt2.y;
			
			return Math.sqrt(dx*dx+dy*dy);
		}
		
		//------------------ AC 관련 -----------------------------------------------------------
		public static function findIndex(ac:ArrayCollection, attr:String, value:Object):int
		{
			for(var i:int=0; i<ac.length; i++){
				if(ac[i][attr] == value) return i;
			}
			return -1;
		}
		
		public static function setVisible(ac:ArrayCollection, attr:String, value:Boolean):void
		{
			for(var i:int=0; i<ac.length; i++) ac[i][attr].visible = value;
		}
		
		//--------------------- 기타 ------------------------------------------------------------------------
		public static function leadingZero(value:uint, places:Number) : String
		{
			var result:String = value.toString();
			while(result.length < places) 
				result = '0' + result;
			return result;
		}
		public static function generateRandomString(len:uint = 1, userAlphabet:String = "1234567890abcdefghijklmnopqrstuvwxyz"):String{
			var alphabet:Array = userAlphabet.split("");
			var alphabetLength:int = alphabet.length;
			var randomLetters:String = "";
			for (var i:uint = 0; i < len; i++){
				randomLetters += alphabet[int(Math.floor(Math.random() * alphabetLength))];
			}
			return randomLetters;
		}
		
		
		
	}
}