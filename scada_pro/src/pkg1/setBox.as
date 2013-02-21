package pkg1
{
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Box;
	import mx.containers.Canvas;
	import mx.containers.Form;
	import mx.containers.FormHeading;
	import mx.containers.FormItem;
	import mx.containers.Panel;
	import mx.containers.VBox;
	import mx.controls.Alert;
	import mx.controls.HRule;
	import mx.controls.Image;
	import mx.controls.Label;
	import mx.controls.Text;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.utils.ArrayUtil;
	
	import spark.components.CheckBox;
	
	public class setBox extends Box
	{
		private var HMI_LABEL:String;
		private var PT:Point;
		private var lblHeader:Label;
		
		public function setBox(GUBUN:String, PT:Point, item:Object, 
							   chk_pres1:Boolean, chk_pres2:Boolean, chk_filt:Boolean, chk_elec:Boolean, chk_curr:Boolean, chk_volt:Boolean, chk_mov:Boolean, chk_endpres:Boolean,
								alarmValue:Object, acConfig:ArrayCollection)
		{
			this.PT = PT;
			this.HMI_LABEL =  item["HMI_LABEL"]; 
			
			// 박스 만들기
			this.setStyle("cornerRadius",4);
			this.setStyle("backgroundColor", 0xefefef);
			this.setStyle("borderVisible", true);
			this.setStyle("borderStyle", "solid");
			this.setStyle("borderColor", 0x888888);
			this.setStyle("horizontalAlign", "center");
			this.setStyle("verticalGap", 0);
			
			// 헤더 라벨
			lblHeader = new Label();
			lblHeader.text = item["EQNAME"];
			//lblHeader.opaqueBackground = 0x00ff00;
			lblHeader.height = 18;
			lblHeader.setStyle("fontWeight","bold");
			this.addElement(lblHeader);
		
			
			// 폼 만들기
			var frm:Form = new Form();
			frm.x = 0;
			frm.y = 0;
			frm.setStyle("verticalGap", 0);
			frm.setStyle("indicatorGap", 0);
			frm.setStyle("paddingTop", 0);
			frm.setStyle("paddingLeft", 0);
			frm.setStyle("paddingRight", 0);
			frm.setStyle("paddingBottom", 0);
			//frm.toolTip = item["EQID"];
			
			
			// ------------ 아날로그값 표시 -----------------------------------------------------------------------------------------------
			
			var pres1:String=""; // 1차압력값
			var pres2:String=""; // 2차압력값
			var filt:String=""; // 필터값
			var elec:String=""; // 전류전위용 전위값
			var elec1:String="",elec2:String="",elec3:String="",elec4:String="",elec5:String="",elec6:String="",elec7:String="",elec8:String="",elec9:String="",elec10:String=""; //전위용 전위값
			var curr:String=""; //전류값
			var volt:String=""; // 전압값
			var mov:String=""; //mov (밸브개도율)
			var endpres:String = ""; // 관말압력 <- 관말기 전용
			
			var alarm_pres1:Boolean;
			
			switch(GUBUN)
			{
				case "center":
				case "region":
					if (chk_pres1) pres1 = numberToFixed(item["PRES11"]); 
					if (chk_pres2) pres2 =  numberToFixed(item["PRES21"]); 
					if (chk_filt) filt = numberToFixed(item["FILT1"]); 
					if (chk_elec) elec = numberToFixed(item["ELEC1"]); 
					if (chk_curr) curr = numberToFixed(item["CURR1"]);  
					if (chk_mov) mov = numberToFixed(item["MOV1"]); 
					break;
				case "location":
					if (chk_pres1) pres1 = numberToFixed(item["PRES1"]);
					if (chk_pres2) pres2 =  numberToFixed(item["PRES2"]);
					if (chk_filt) filt = numberToFixed(item["FILT1"]); 
					if (chk_elec) elec = numberToFixed(item["ELEC1"]); 
					if (chk_curr) curr = numberToFixed(item["CURR1"]); 
					if (chk_mov) mov = numberToFixed(item["MOV"]);
					break;
				case "endline":
					if (chk_endpres) endpres = numberToFixed(item["PRES1"]);
					if (chk_volt) volt = numberToFixed(item["VOLT1"]);
					break;
				case "rectifier":
				case "drainage":
					if (chk_elec) elec = numberToFixed(item["ELEC1"]); 
					if (chk_curr) curr = numberToFixed(item["CURR1"]); 
					if (chk_volt) volt = numberToFixed(item["VOLT1"]);
					break;
				case "eleccurr":
					if(item["RTUTYPE"] == "전류전위") {
						if (chk_curr) curr =numberToFixed(item["POINT1"]); // 전류
						if (chk_elec) elec =numberToFixed(item["POINT2"]);  // 전위
					}else if(item["RTUTYPE"] == "전위") {
						if (chk_elec){ // 전위
							if(item["POINT1_USE"]=="Y" && item.POINT1 != "-999999" ) elec1 =numberToFixed(item["POINT1"]); 
							if(item["POINT2_USE"]=="Y" && item.POINT2 != "-999999" ) elec2 =numberToFixed(item["POINT2"]); 
							if(item["POINT3_USE"]=="Y" && item.POINT3 != "-999999" ) elec3 =numberToFixed(item["POINT3"]); 
							if(item["POINT4_USE"]=="Y" && item.POINT4 != "-999999" ) elec4 =numberToFixed(item["POINT4"]); 
							if(item["POINT5_USE"]=="Y" && item.POINT5 != "-999999" ) elec5 =numberToFixed(item["POINT5"]); 
							if(item["POINT6_USE"]=="Y" && item.POINT6 != "-999999" ) elec6 =numberToFixed(item["POINT6"]); 
							if(item["POINT7_USE"]=="Y" && item.POINT7 != "-999999" ) elec7 =numberToFixed(item["POINT7"]); 
							if(item["POINT8_USE"]=="Y" && item.POINT8 != "-999999" ) elec8 =numberToFixed(item["POINT8"]); 
							if(item["POINT9_USE"]=="Y" && item.POINT9 != "-999999" ) elec9 =numberToFixed(item["POINT9"]); 
							if(item["POINT10_USE"]=="Y" && item.POINT10 != "-999999" ) elec10 =numberToFixed(item["POINT10"]); 
						}
					}
					break;
				case "mov":
					if (chk_pres1) pres1 = numberToFixed(item["PRES1"]);
					if (chk_pres2) pres2 =  numberToFixed(item["PRES21"]);
					if (chk_filt) filt = numberToFixed(item["FILT1"]); 
					if (chk_elec) elec =numberToFixed( item["ELEC1"]); 
					if (chk_curr) curr = numberToFixed(item["CURR1"]); 
					if (chk_mov) mov = numberToFixed(item["MOV1"]);
					break;
				case "rpc":
					break;
			}
			
			if(endpres != "") frm.addElement(createItem("관말압력:", endpres)); // 관말기 전용
			if(pres1 != "") frm.addElement(createItem("1차:", pres1)); 
			if(pres2 != "") frm.addElement(createItem("2차:", pres2)); 
			if(filt != "") frm.addElement(createItem("필터:",  filt)); 
			if(elec != "") frm.addElement(createItem("전위:", elec)); 
			if(elec1 != "") frm.addElement(createItem("전위1:", Number(elec1).toFixed(0))); 
			if(elec2 != "") frm.addElement(createItem("전위2:", Number(elec2).toFixed(0))); 
			if(elec3 != "") frm.addElement(createItem("전위3:", Number(elec3).toFixed(0))); 
			if(elec4 != "") frm.addElement(createItem("전위4:", Number(elec4).toFixed(0))); 
			if(elec5 != "") frm.addElement(createItem("전위5:", Number(elec5).toFixed(0))); 
			if(elec6 != "") frm.addElement(createItem("전위6:", Number(elec6).toFixed(0))); 
			if(elec7 != "") frm.addElement(createItem("전위7:", Number(elec7).toFixed(0))); 
			if(elec8 != "") frm.addElement(createItem("전위8:", Number(elec8).toFixed(0))); 
			if(elec9 != "") frm.addElement(createItem("전위9:", Number(elec9).toFixed(0))); 
			if(elec10 != "") frm.addElement(createItem("전위10:", Number(elec10).toFixed(0))); 
			if(curr != "") frm.addElement(createItem("전류:", curr)); 
			if(volt != "") frm.addElement(createItem("전압:", volt)); 
			if(mov != "") frm.addElement(createItem("MOV:", mov)); 
			this.addEventListener(FlexEvent.UPDATE_COMPLETE, updateFormCompleteHandler);
			this.addElement(frm);
			
			
			// ------------ 알람 표시 -----------------------------------------------------------------------------------------------
			
			var alarmHL:Object = Utils.getAlarmHL(GUBUN, item);
			
			if (alarmValue=="general" ){
				if(alarmHL["PRES1_H"]) this.addElement(new setLabel("1차압력HI", "#FF0000"));
				if(alarmHL["PRES1_L"]) this.addElement(new setLabel("1차압력LOW", "#0000FF"));
				if(alarmHL["PRES2_H"]) this.addElement(new setLabel("2차압력HI", "#FF0000"));
				if(alarmHL["PRES2_L"]) this.addElement(new setLabel("2차압력LOW", "#0000FF"));
				if(item["FILT1_H"]) this.addElement(new setLabel("필터차압HL", "#FF0000"));
				if(item["FILT1_L"]) this.addElement(new setLabel("필터차압LOW", "#0000FF"));
				if(alarmHL["ELEC1_H"]) this.addElement(new setLabel("전위HI", "#FF0000"));
				if(alarmHL["ELEC1_L"]) this.addElement(new setLabel("전위LOW", "#0000FF"));
				if(alarmHL["CURR1_H"]) this.addElement(new setLabel("전류HI", "#FF0000"));
				if(alarmHL["CURR1_L"]) this.addElement(new setLabel("전류LOW", "#0000FF"));
				if (alarmHL["VOLT1_H"]) this.addElement(new setLabel("전압HI", "#FF0000"));
				if (alarmHL["VOLT1_L"]) this.addElement(new setLabel("전압LOW", "#0000FF"));
			}else{
				if( alarmValue=="pres1"){
					if(alarmHL["PRES1_H"]) this.addElement(new setLabel("1차압력HI", "#FF0000"));
					if(alarmHL["PRES1_L"]) this.addElement(new setLabel("1차압력LOW", "#0000FF"));
				}
				if (alarmValue=="pres2"){
					if(alarmHL["PRES2_H"]) this.addElement(new setLabel("2차압력HI", "#FF0000"));
					if(alarmHL["PRES2_L"]) this.addElement(new setLabel("2차압력LOW", "#0000FF"));
				}
				if (alarmValue=="filt"){
					if(alarmHL["FILT1_H"]) this.addElement(new setLabel("필터차압HL", "#FF0000"));
					if(alarmHL["FILT1_L"]) this.addElement(new setLabel("필터차압LOW", "#0000FF"));
				}
				if (alarmValue=="elec"){
					if(alarmHL["ELEC1_H"]) this.addElement(new setLabel("전위HI", "#FF0000"));
					if(alarmHL["ELEC1_L"]) this.addElement(new setLabel("전위LOW", "#0000FF"));
				}
				if (alarmValue=="curr"){
					if(alarmHL["CURR1_H"]) this.addElement(new setLabel("전류HI", "#FF0000"));
					if(alarmHL["CURR1_L"]) this.addElement(new setLabel("전류LOW", "#0000FF"));
				}
				if (alarmValue=="volt"){
					if (alarmHL["VOLT1_H"]) this.addElement(new setLabel("전압HI", "#FF0000"));
					if (alarmHL["VOLT1_L"]) this.addElement(new setLabel("전압LOW", "#0000FF"));
				}
			}
			
			
//			this.width = 59;
//			this.height = 36;
//			
//			var label:String = (this.HMI_LABEL == null ) ? "" :  this.HMI_LABEL.toString().toUpperCase();
//			
//			switch(label){
//				case "RIGHT": 
//				default:
//					this.x = this.PT.x + 12;
//					this.y = this.PT.y - (this.height/2);
//					break;
//				case "UP":
//					this.x = this.PT.x - (this.width/2);
//					this.y = this.PT.y - 12 - (this.height);
//					break;
//				case "LEFT":
//					this.x = this.PT.x - 12 - (this.width);
//					this.y = this.PT.y - (this.height/2);
//					break;
//				case "DOWN":
//					this.x = this.PT.x - (this.width/2);
//					this.y = this.PT.y + 12;
//					break;
//			}
			
			
			
		}
		
		
		private function createItem(label:String, value:String):FormItem
		{
			var item:FormItem = new FormItem();
			item.height = 16;
			item.label = label;
			
			var text:Text = new Text();
			//text.opaqueBackground = 0x00ff00;
			text.htmlText = value;
			item.addElement(text);
			//item.addEventListener(FlexEvent.UPDATE_COMPLETE, updateCompleteHandler);
			
			return item;
		}
		
		private function updateFormCompleteHandler(event:FlexEvent):void
		{
			var label:String = (this.HMI_LABEL == null ) ? "" :  this.HMI_LABEL.toString().toUpperCase();
			
			switch(label){
				case "RIGHT": 
				default:
					this.x = this.PT.x + 12;
					this.y = this.PT.y - (this.height/2);
					break;
				case "UP":
					this.x = this.PT.x - (this.width/2);
					this.y = this.PT.y - 12 - (this.height);
					break;
				case "LEFT":
					this.x = this.PT.x - 12 - (this.width);
					this.y = this.PT.y - (this.height/2);
					break;
				case "DOWN":
					this.x = this.PT.x - (this.width/2);
					this.y = this.PT.y + 12;
					break;
			}
			
			
		}
		
		private function numberToFixed(obj:Object):String
		{
			var rv:String = "";
			
			try{
				if(obj=="-999999") rv = "";
				else rv = (obj=="0") ? "0" : Number(obj).toFixed(2);
			}catch(e:Error){
				
			}finally{
				return rv 
			}
		}
		
	}
}