package pkg1
{
	import flash.text.Font;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Form;
	import mx.containers.FormHeading;
	import mx.containers.FormItem;
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.HRule;
	import mx.controls.Label;
	import mx.controls.Spacer;
	import mx.controls.Text;
	import mx.utils.ArrayUtil;
	
	public class SetForm extends VBox
	{
		
		public function SetForm(width:Number, height:Number, gubun:String, item:Object, acConfig:ArrayCollection)
		{
			
			this.setStyle("fontSize", 12);
			
			//----------------  parsing data  -------------------------- -------------------------------------------------
			var i:int;
			
			var acAnalog:ArrayCollection = new ArrayCollection();
			var acFMS:ArrayCollection = new ArrayCollection();
			var acDigital:ArrayCollection = new ArrayCollection();
			var acAlarm:ArrayCollection = new ArrayCollection();
			var acGeneral:ArrayCollection = new ArrayCollection();
		
			switch(gubun)
			{
				case "center" :
					// 디지탈알람 (True/False)
					acDigital.addItem({label:"통신이상:", value:item.NETERR});
					acDigital.addItem({label:"가스누출:", value:item.GAS});
					acDigital.addItem({label:"SSV1:", value:item.SSV1});
					acDigital.addItem({label:"SSV2:", value:item.SSV2});
					acDigital.addItem({label:"정전:", value:item.POWER});
					acDigital.addItem({label:"DOOR:", value:item.DOOR});
					acDigital.addItem({label:"MOV FAULT:", value:item.MOV1_FAULT});
					
					// 알림 H/L
					if(item.PRES11_H) acAlarm.addItem({label:"1차압력 HI", color:"red"});
					if(item.PRES11_L) acAlarm.addItem({label:"1차압력 LOW", color:"blue"});
					if(item.PRES21_H) acAlarm.addItem({label:"2차압력 HI", color:"red"});
					if(item.PRES21_L) acAlarm.addItem({label:"2차압력 LOW", color:"blue"});
					if(item.FILT1_H) acAlarm.addItem({label:"필터차압 HI", color:"red"});
					if(item.FILT1_L) acAlarm.addItem({label:"필터차압 LOW", color:"blue"});
					if(item.ELEC1_H) acAlarm.addItem({label:"방식전위 HI", color:"red"});
					if(item.ELEC1_L) acAlarm.addItem({label:"방식전위 LOW", color:"blue"});
					if(item.CURR1_H) acAlarm.addItem({label:"방식전류 HI", color:"red"});
					if(item.CURR1_L) acAlarm.addItem({label:"방식전류 LOW", color:"blue"});
					
					// 아날로그
					if(item.PRES11 != "-999999") acAnalog.addItem({label:"1차압력1:", value:item.PRES11});  
					if(item.PRES21 != "-999999") acAnalog.addItem({label:"2차압력1:", value:item.PRES21}); 
					if(item.PRES22 != "-999999") acAnalog.addItem({label:"2차압력2:", value:item.PRES22}); 
					if(item.PRES23 != "-999999") acAnalog.addItem({label:"2차압력3:", value:item.PRES23}); 
					if(item.FILT1 != "-999999") acAnalog.addItem({label:"필터차압1:", value:item.FILT1}); 
					if(item.ELEC1 != "-999999") acAnalog.addItem({label:"방식전위1:", value:Number(item.ELEC1).toFixed(0)}); 
					if(item.CURR1 != "-999999") acAnalog.addItem({label:"방식전류1:", value:item.CURR1}); 
					if(item.MOV1 != "-999999") acAnalog.addItem({label:"MOV1:", value:item.MOV1}); 
					if(item.TEMP1 != "-999999") acAnalog.addItem({label:"가스온도1:", value:item.TEMP1}); 
					if(item.TEMP2 != "-999999") acAnalog.addItem({label:"가스온도2:", value:item.TEMP2}); 
					
					// FMS
					for(i=1; i<13; i++){
						if(item["F"+i+"TOTAL"] != "0"){
							if(item["F"+i+"PRES"] != "-999999") acFMS.addItem({label:"FMS"+i+" 압력:", value:item["F"+i+"PRES"]}); 
							if(item["F"+i+"TEMP"] != "-999999") acFMS.addItem({label:"FMS"+i+" 온도:", value:item["F"+i+"TEMP"]});  
							if(item["F"+i+"RATE"] != "-999999") acFMS.addItem({label:"FMS"+i+" 유량:", value:item["F"+i+"RATE"]});  
							if(item["F"+i+"TOTAL"] != "-999999") acFMS.addItem({label:"FMS"+i+" 보정유량적산:", value:item["F"+i+"TOTAL"]}); 
							if(item["F"+i+"TOTALRAW"] != "-999999") acFMS.addItem({label:"FMS"+i+" 비보정유량적산:", value:item["F"+i+"TOTALRAW"]}); 
						}
					}
					break;
				case "region":
					// 디지탈알람 (True/False)
					acDigital.addItem({label:"통신이상:", value:item.NETERR});
					acDigital.addItem({label:"가스누출:", value:item.GAS});
					acDigital.addItem({label:"SSV1:", value:item.SSV1});
					acDigital.addItem({label:"SSV2:", value:item.SSV2});
					acDigital.addItem({label:"정전:", value:item.POWER});
					acDigital.addItem({label:"DOOR:", value:item.DOOR});
					acDigital.addItem({label:"MOV FAULT:", value:item.MOV1_FAULT});
					
					// 알림 H/L
					if(item.PRES11_H) acAlarm.addItem({label:"1차압력 HI", color:"red"});
					if(item.PRES11_L) acAlarm.addItem({label:"1차압력 LOW", color:"blue"});
					if(item.PRES21_H) acAlarm.addItem({label:"2차압력 HI", color:"red"});
					if(item.PRES21_L) acAlarm.addItem({label:"2차압력 LOW", color:"blue"});
					if(item.FILT1_H) acAlarm.addItem({label:"필터차압 HI", color:"red"});
					if(item.FILT1_L) acAlarm.addItem({label:"필터차압 LOW", color:"blue"});
					if(item.ELEC1_H) acAlarm.addItem({label:"방식전위 HI", color:"red"});
					if(item.ELEC1_L) acAlarm.addItem({label:"방식전위 LOW", color:"blue"});
					if(item.CURR1_H) acAlarm.addItem({label:"방식전류 HI", color:"red"});
					if(item.CURR1_L) acAlarm.addItem({label:"방식전류 LOW", color:"blue"});
					
					// 아날로그
					if(item.PRES11 != "-999999") acAnalog.addItem({label:"1차압력1:", value:item.PRES11});  
					if(item.PRES21 != "-999999") acAnalog.addItem({label:"2차압력1:", value:item.PRES21}); 
					if(item.PRES22 != "-999999") acAnalog.addItem({label:"2차압력2:", value:item.PRES22}); 
					if(item.PRES23 != "-999999") acAnalog.addItem({label:"2차압력3:", value:item.PRES23}); 
					if(item.FILT1 != "-999999") acAnalog.addItem({label:"필터차압1:", value:item.FILT1}); 
					if(item.ELEC1 != "-999999") acAnalog.addItem({label:"방식전위1:", value:Number(item.ELEC1).toFixed(0)}); 
					if(item.CURR1 != "-999999") acAnalog.addItem({label:"방식전류1:", value:item.CURR1}); 
					if(item.MOV1 != "-999999") acAnalog.addItem({label:"MOV1:", value:item.MOV1}); 
					if(item.TEMP1 != "-999999") acAnalog.addItem({label:"가스온도1:", value:item.TEMP1}); 
					if(item.TEMP2 != "-999999") acAnalog.addItem({label:"가스온도2:", value:item.TEMP2}); 
					
					// FMS
					for(i=1; i<13; i++){
						if(item["F"+i+"TOTAL"] != "0"){
							if(item["F"+i+"PRES"] != "-999999") acFMS.addItem({label:"FMS"+i+" 압력:", value:item["F"+i+"PRES"]}); 
							if(item["F"+i+"TEMP"] != "-999999") acFMS.addItem({label:"FMS"+i+" 온도:", value:item["F"+i+"TEMP"]});  
							if(item["F"+i+"RATE"] != "-999999") acFMS.addItem({label:"FMS"+i+" 유량:", value:item["F"+i+"RATE"]});  
							if(item["F"+i+"TOTAL"] != "-999999") acFMS.addItem({label:"FMS"+i+" 보정유량적산:", value:item["F"+i+"TOTAL"]}); 
							if(item["F"+i+"TOTALRAW"] != "-999999") acFMS.addItem({label:"FMS"+i+" 비보정유량적산:", value:item["F"+i+"TOTALRAW"]}); 
						}
					}
					break;
				case "location":
					// 디지탈알람 (True/False)
					acDigital.addItem({label:"통신이상:", value:item.NETERR});
					acDigital.addItem({label:"가스누출:", value:item.GAS});
					acDigital.addItem({label:"SSV1:", value:item.SSV1});
					acDigital.addItem({label:"SSV2:", value:item.SSV2});
					acDigital.addItem({label:"정전:", value:item.POWER});
					acDigital.addItem({label:"DOOR:", value:item.DOOR});
					acDigital.addItem({label:"MOV FAULT:", value:item.MOV_FAULT});
					// 알림 H/L
					if(item.PRES1_H) acAlarm.addItem({label:"1차압력 HI", color:"red"});
					if(item.PRES1_L) acAlarm.addItem({label:"1차압력 LOW", color:"blue"});
					if(item.PRES2_H) acAlarm.addItem({label:"2차압력 HI", color:"red"});
					if(item.PRES2_L) acAlarm.addItem({label:"2차압력 LOW", color:"blue"});
					if(item.FILT1_H) acAlarm.addItem({label:"필터차압 HI", color:"red"});
					if(item.FILT1_L) acAlarm.addItem({label:"필터차압 LOW", color:"blue"});
					if(item.ELEC1_H) acAlarm.addItem({label:"방식전위 HI", color:"red"});
					if(item.ELEC1_L) acAlarm.addItem({label:"방식전위 LOW", color:"blue"});
					if(item.CURR1_H) acAlarm.addItem({label:"방식전류 HI", color:"red"});
					if(item.CURR1_L) acAlarm.addItem({label:"방식전류 LOW", color:"blue"});
					
					// 아날로그
					if(item.PRES1 != "-999999") acAnalog.addItem({label:"1차압력1:", value:item.PRES1});  
					if(item.PRES2 != "-999999") acAnalog.addItem({label:"2차압력1:", value:item.PRES2}); 
					if(item.FILT1 != "-999999") acAnalog.addItem({label:"필터차압1:", value:item.FILT1}); 
					if(item.ELEC1 != "-999999") acAnalog.addItem({label:"방식전위1:", value:Number(item.ELEC1).toFixed(0)}); 
					if(item.CURR1 != "-999999") acAnalog.addItem({label:"방식전류1:", value:item.CURR1});
					if(item.TEMP1 != "-999999") acAnalog.addItem({label:"가스온도1:", value:item.TEMP1});
					if(item.MOV != "-999999") acAnalog.addItem({label:"MOV:", value:item.MOV});
					
					// FMS
					if(item["FTOTAL"] != "0"){
						if(item["FPRES"] != "-999999") acFMS.addItem({label:"FMS 압력:", value:item["FPRES"]}); 
						if(item["FTEMP"] != "-999999") acFMS.addItem({label:"FMS 온도:", value:item["FTEMP"]});  
						if(item["FRATE"] != "-999999") acFMS.addItem({label:"FMS 유량:", value:item["F"+i+"RATE"]});  
						if(item["FTOTAL"] != "-999999") acFMS.addItem({label:"FMS 보정유량적산:", value:item["FTOTAL"]}); 
						if(item["FTOTALRAW"] != "-999999") acFMS.addItem({label:"FMS 비보정유량적산:", value:item["FTOTALRAW"]}); 
					}
					break;
				case "endline" :
					// 아날로그
					if(item.PRES1 != "-999999") acAnalog.addItem({label:"관말압력:", value:item.PRES1}); 
					if(item.VOLT1 != "-999999") acAnalog.addItem({label:"전압:", value:item.VOLT1}); 
					if(item.TEMP1 != "-999999") acAnalog.addItem({label:"온도:", value:item.TEMP1}); 
					if(item.T_PRES1_MAX != "-999999") acAnalog.addItem({label:"금일압력최대:", value:item.T_PRES1_MAX}); 
					if(item.T_PRES1_MIN != "-999999") acAnalog.addItem({label:"금일압력최소:", value:item.T_PRES1_MIN}); 
					if(item.Y_PRES1_MAX != "-999999") acAnalog.addItem({label:"전일압력최대:", value:item.Y_PRES1_MAX}); 
					if(item.Y_PRES1_MIN != "-999999") acAnalog.addItem({label:"전일압력최소:", value:item.Y_PRES1_MIN}); 
					if(item.LOCATIONJOIN != "" && item.PRES2_LOC != "-999999")  acAnalog.addItem({label:item.LOCATIONJOIN +" 2차압력:", value:item.PRES2_LOC}); 
					// 알림 H/L
					if(item.PRES11_H) acAlarm.addItem({label:"1차압력 HI", color:"red"});
					if(item.PRES11_L) acAlarm.addItem({label:"1차압력 LOW", color:"blue"});
					
					break;
				case "rectifier":
					// 디지탈알람 (True/False)
					acDigital.addItem({label:"통신이상:", value:item.NETERR});
					// 알림 H/L
					if(item.ELEC1_H) acAlarm.addItem({label:"방식전위 HI", color:"red"});
					if(item.ELEC1_L) acAlarm.addItem({label:"방식전위 LOW", color:"blue"});
					if(item.CURR1_H) acAlarm.addItem({label:"방식전류 HI", color:"red"});
					if(item.CURR1_L) acAlarm.addItem({label:"방식전류 LOW", color:"blue"});
					// 아날로그
					if(item.VOLT1 != "-999999") acAnalog.addItem({label:"전압1:", value:item.VOLT1}); 
					if(item.ELEC1 != "-999999") acAnalog.addItem({label:"방식전위1:", value:Number(item.ELEC1).toFixed(0)}); 
					if(item.CURR1 != "-999999") acAnalog.addItem({label:"방식전류1:", value:item.CURR1});
					break;
				case "eleccurr":
					// 디지탈알람 (True/False)
					acDigital.addItem({label:"통신이상:", value:item.NETERR});
					// 아날로그
					if(item.RTUTYPE == "전류전위") {
						if(item.POINT1 != "-999999") acAnalog.addItem({label:"전류1:", value:item.POINT1}); 
						if(item.POINT2 != "-999999") acAnalog.addItem({label:"전위1:", value:item.POINT2}); 
					}else if(item.RTUTYPE == "전위") {
						if(item.POINT1_USE == "Y" && item.POINT1 != "-999999") acAnalog.addItem({label:"전위1:", value:item.POINT1}); 
						if(item.POINT2_USE == "Y" && item.POINT2 != "-999999") acAnalog.addItem({label:"전위2:", value:item.POINT2}); 
						if(item.POINT3_USE == "Y" && item.POINT3 != "-999999") acAnalog.addItem({label:"전위3:", value:item.POINT3}); 
						if(item.POINT4_USE == "Y" && item.POINT4 != "-999999") acAnalog.addItem({label:"전위4:", value:item.POINT4}); 
						if(item.POINT5_USE == "Y" && item.POINT5 != "-999999") acAnalog.addItem({label:"전위5:", value:item.POINT5}); 
						if(item.POINT6_USE == "Y" && item.POINT6 != "-999999") acAnalog.addItem({label:"전위6:", value:item.POINT6}); 
						if(item.POINT7_USE == "Y" && item.POINT7 != "-999999") acAnalog.addItem({label:"전위7:", value:item.POINT7}); 
						if(item.POINT8_USE == "Y" && item.POINT8 != "-999999") acAnalog.addItem({label:"전위8:", value:item.POINT8}); 
						if(item.POINT9_USE == "Y" && item.POINT9 != "-999999") acAnalog.addItem({label:"전위9:", value:item.POINT9}); 
						if(item.POINT10_USE == "Y" && item.POINT10 != "-999999") acAnalog.addItem({label:"전위10:", value:item.POINT10}); 
					}
					break;
				case "mov":
					// 디지탈알람 (True/False)
					acDigital.addItem({label:"통신이상:", value:item.NETERR});
					acDigital.addItem({label:"가스누출:", value:item.GAS});
					acDigital.addItem({label:"SSV1:", value:item.SSV1});
					acDigital.addItem({label:"SSV2:", value:item.SSV2});
					acDigital.addItem({label:"정전:", value:item.POWER});
					acDigital.addItem({label:"DOOR:", value:item.DOOR});
					acDigital.addItem({label:"MOV FAULT:", value:item.MOV1_FAULT});
					// 알림 H/L
					if(item.PRES1_H) acAlarm.addItem({label:"1차압력 HI", color:"red"});
					if(item.PRES1_L) acAlarm.addItem({label:"1차압력 LOW", color:"blue"});
					if(item.PRES2_H) acAlarm.addItem({label:"2차압력 HI", color:"red"});
					if(item.PRES2_L) acAlarm.addItem({label:"2차압력 LOW", color:"blue"});
					if(item.FILT1_H) acAlarm.addItem({label:"필터차압 HI", color:"red"});
					if(item.FILT1_L) acAlarm.addItem({label:"필터차압 LOW", color:"blue"});
					if(item.ELEC1_H) acAlarm.addItem({label:"방식전위 HI", color:"red"});
					if(item.ELEC1_L) acAlarm.addItem({label:"방식전위 LOW", color:"blue"});
					
					// 아날로그
					if(item.PRES1 != "-999999") acAnalog.addItem({label:"1차압력1:", value:item.PRES1}); 
					if(item.PRES21 != "-999999") acAnalog.addItem({label:"2차압력1:", value:item.PRES21}); 
					if(item.FILT1 != "-999999") acAnalog.addItem({label:"필터차압1:", value:item.FILT1}); 
					if(item.ELEC1 != "-999999") acAnalog.addItem({label:"방식전위1:", value:Number(item.ELEC1).toFixed(0)}); 
					if(item.CURR1 != "-999999") acAnalog.addItem({label:"방식전류1:", value:item.CURR1});
					if(item.TEMP1 != "-999999") acAnalog.addItem({label:"가스온도1:", value:item.TEMP1});
					if(item.MOV1 != "-999999") acAnalog.addItem({label:"MOV1:", value:item.MOV1});
					break;
					
					
			}
			
			//----------------  create HBox1 ----------------------------------------------------------------------------
			
			var hbox1:HBox = createHBox(width-20, 20);
			
			hbox1.addChild(createLabel("ID: ", "bold"));
			hbox1.addChild(createLabel(item.EQID, "bold", 0x67679A));
			hbox1.addChild(createSpacer(15));
			hbox1.addChild(createLabel("이름: ", "bold"));
			hbox1.addChild(createLabel(item.EQNAME, "bold", 0x67679A)); //남색
			if(item.EQREGION != null && item.EQLOCATION != null){
				hbox1.addChild(createSpacer(15));
				hbox1.addChild(createLabel("권역: ", "bold"));
				hbox1.addChild(createLabel(item.EQREGION, "bold", 0x67679A));
				hbox1.addChild(createSpacer(15));
				hbox1.addChild(createLabel("지역: ", "bold"));
				hbox1.addChild(createLabel(item.EQLOCATION, "bold", 0x67679A));
			}else{
				hbox1.addChild(createSpacer(15));
				hbox1.addChild(createLabel("이 정압기는 데이타가 없습니다.", "bold", 0xff0000));
			}
			this.addChild(hbox1);
			
			//----------------  create HBox2 ----------------------------------------------------------------------------
			if(item.CDMANUM != null) // Dummy정류기/배류기 때문
			{
				var hbox2:HBox = createHBox(width-20, 320);
				
				// 아날로그
				hbox2.addChild(createBorderBox_Analog("아날로그", acAnalog, 160, 300));
				
				// FMS
				hbox2.addChild(createBorderBox_Analog("FMS", acFMS, 270, 300));
				
				// 오른쪽 VBox
				var vbox1:VBox = createVBox(300, hbox2.height);
				hbox2.addChild(vbox1);
				// 오른쪽위 HBox
				var hbox3:HBox = createHBox(300, 180);
				vbox1.addChild(hbox3);
				
				// 디지탈
				hbox3.addChild(createBorderBox_Digital(acDigital, 140, 160)); 
				// 알람 H/L
				hbox3.addChild(createBorderBox_Alarm(acAlarm, 140, 160)); 
				
				// 일반정보
				acGeneral.addItem({type:'general', label:'CDMA번호:' , value: item.CDMANUM});
				acGeneral.addItem({type:'general', label:'데이터 수신 시간:' , value: item.CDMARCV});
				acGeneral.addItem({type:'general', label:'점검글자:' , value: item.EQSTATESTR});
				acGeneral.addItem({type:'general', label:'E-GIS 시설물 ID:' , value: item.EQEGISID});
				vbox1.addChild(createBorderBox_General(acGeneral, 290, 110));
				
				this.addChild(hbox2);
			}
			
		}
		
		private function createHBox(width:Number, height:Number, backgroundColor:String=''):HBox
		{
			var box:HBox = new HBox();
			box.width = width;
			box.height = height;
			
			if(backgroundColor != ''){
				box.setStyle("backgroundColor", backgroundColor); 
			}
			return box;
		}
		private function createVBox(width:Number, height:Number, backgroundColor:String=''):VBox
		{
			var box:VBox = new VBox();
			box.width = width;
			box.height = height;
			
			if(backgroundColor != ''){
				box.setStyle("backgroundColor", backgroundColor); 
			}
			return box;
		}
		
		private function moveAc(acSource:ArrayCollection, acDesc:ArrayCollection):void
		{
			var i:int, last:int;
			
			for(i=acSource.length-1; i>=0; i--){
				if(acSource[i].value != null && acSource[i].value != "0" && acSource[i].value != "-999999" ){
					last=i;
					break;
				}
			}
			
			for(i=0; i<=last; i++){
				acDesc.addItem(acSource[i]);
			}
		}
		// 일반정보 BorderBox
		private function createBorderBox_General(ac:ArrayCollection, width:Number, height:Number):TitledBorderBox
		{
			var tbb:TitledBorderBox = new TitledBorderBox();
			tbb.title = "일반정보";
			tbb.layout = "vertical";
			
			var frm1:Form = createForm(width, height);
			
			for each(var obj:Object in ac)
			{
				frm1.addElement(createFormItem_String(obj));
			}
			tbb.addChild(frm1);
			
			return tbb;
		}
		// 아날로그 BorderBox
		private function createBorderBox_Analog(title:String, ac:ArrayCollection, width:Number, height:Number):TitledBorderBox
		{
			var tbb:TitledBorderBox = new TitledBorderBox();
			tbb.title = title;
			tbb.layout = "vertical";
			
			var frm1:Form = createForm(width, height);
			
			for each(var obj:Object in ac)
			{
				frm1.addElement(createFormItem_Number(obj));
			}
			tbb.addChild(frm1);
			
			return tbb;
		}
		// 디지탈 BorderBox
		private function createBorderBox_Digital(ac:ArrayCollection, width:Number, height:Number):TitledBorderBox
		{
			var tbb:TitledBorderBox = new TitledBorderBox();
			tbb.title = "디지탈";
			tbb.layout = "vertical";
			
			var frm1:Form = createForm(width, height);
			
			for each(var obj:Object in ac)
			{
//				var lbl:Label;
//				
//				if(obj.value) lbl = createLabel(obj.label, "bold", 0xff0000);
//				else lbl = createLabel(obj.label);
//				
//				frm1.addElement(lbl);
				frm1.addElement(createFormItem_TF(obj));
			}
			tbb.addChild(frm1);
			
			return tbb;
		}
		// 알람 BorderBox
		private function createBorderBox_Alarm(ac:ArrayCollection, width:Number, height:Number):TitledBorderBox
		{
			var tbb:TitledBorderBox = new TitledBorderBox();
			tbb.title = "알람 H/L";
			tbb.layout = "vertical";
			
			var frm1:Form = createForm(width, height);
			
			for each(var obj:Object in ac)
			{
				var lbl:Label = createLabel(obj.label, "bold", 0xff0000);
				frm1.addElement(lbl);
			}
			tbb.addChild(frm1);
			
			return tbb;
		}
		
		private function createFormItem_Number(item:Object):FormItem
		{
			var frmItem:FormItem = new FormItem();
			frmItem.height = 16;
			frmItem.label = item.label;
			
			var text:Text = new Text();
			
			text.text = (item.value - Math.round(item.value) == 0) ? item.value : Number(item.value).toFixed(2);
					
			frmItem.addElement(text);
		
			return frmItem;
		}
		private function createFormItem_String(item:Object):FormItem
		{
			var frmItem:FormItem = new FormItem();
			frmItem.height = 16;
			frmItem.label = item.label;
			
			var text:Text = new Text();
			text.text = item.value;
			
			frmItem.addElement(text);
			
			return frmItem;
		}
		private function createFormItem_TF(item:Object):FormItem
		{
			var frmItem:FormItem = new FormItem();
			frmItem.height = 16;
			frmItem.label = item.label;
			
			var text:Text = new Text();
			
			if(item.value==false){
				text.text = "정상";
			}
			else{
				text.text = "이상";
				frmItem.setStyle("color", "red");
				frmItem.setStyle("fontWeight", "bold"); 
			}
			
			frmItem.addElement(text);
			
			return frmItem;
		}
		
		private function createLabel(text:String, fontWeight:String='normal', color:uint=0x000000):Label
		{
			var lbl:Label = new Label();
			lbl.text = text;
			lbl.height = 16;
			lbl.setStyle("fontWeight", fontWeight); 
			lbl.setStyle("fontSize", 11);
			lbl.setStyle("color", color);
			
			return lbl;
		}
		private function createSpacer(width:Number):Spacer
		{
			var spacer:Spacer = new Spacer();
			spacer.width = width;
			return spacer;
		}
		
		private function createForm(width:Number, height:Number):Form
		{
			var frm:Form = new Form();
			frm.width = width;
			frm.height = height;
			frm.setStyle("fontWeight","normal");
			frm.setStyle("indicatorGap", 2);
			frm.setStyle("verticalGap", 2);
			
			return frm;
		}
		
		
		//----------------- find Collection ------------------------------------------------------------
		
		private function findInCollection(c:ArrayCollection, findFunction:Function):Array 
		{ 
			var matches : Array = c.source.filter( findFunction ); 
			return matches; 
		} 
		
		private function findFunction(propertyName:String,propertyValue:*):Function 
		{ 
			return function( element : *, index : int, array : Array ) : Boolean 
			{ 
				return element[propertyName] == propertyValue; 
			} 
		} 
	}
}