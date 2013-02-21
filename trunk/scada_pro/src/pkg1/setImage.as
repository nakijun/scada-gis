package pkg1
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Image;
	import mx.utils.ArrayUtil;
	
	public class setImage extends Image
	{
		
		// 심볼이미지 
		//센타
		[Embed(source="/assets/G센_검.png")]
		private var GCenter_Black:Class;
		[Embed(source="/assets/G센_빨.png")]
		private var GCenter_Red:Class;
		[Embed(source="/assets/G센_파.png")]
		private var GCenter_Blue:Class;
		//지구
		[Embed(source="/assets/G검_네모.png")]
		private var GRegion_Black:Class;
		[Embed(source="/assets/G빨_네모.png")]
		private var GRegion_Red:Class;
		[Embed(source="/assets/G파_네모.png")]
		private var GRegion_Blue:Class;
		//지역
		[Embed(source="/assets/G검_원.png")]
		private var GLocation_Black:Class;
		[Embed(source="/assets/G빨_원.png")]
		private var GLocation_Red:Class;
		[Embed(source="/assets/G파_원.png")]
		private var GLocation_Blue:Class;
		
		[Embed(source="/assets/ㅔ_검.png")]
		private var GEndline_Black:Class;
		[Embed(source="/assets/ㅔ_빨.png")]
		private var GEndline_Red:Class;
		[Embed(source="/assets/ㅔ_파.png")]
		private var GEndline_Blue:Class;
		// 정류기 
		[Embed(source="/assets/R_검.png")]
		private var GRectifier_Black:Class;
		[Embed(source="/assets/R_빨.png")] 
		private var GRectifier_Red:Class;
		[Embed(source="/assets/R_파.png")] 
		private var GRectifier_Blue:Class;
		// 배류기
		[Embed(source="/assets/R(배류기)_검.png")]  
		private var GDrainage_Black:Class;
		[Embed(source="/assets/R(배류기)_빨.png")] 
		private var GDrainage_Red:Class;
		[Embed(source="/assets/R(배류기)_파.png")] 
		private var GDrainage_Blue:Class;
		// 전류전위
		[Embed(source="/assets/WJ_검.png")]  
		private var GEleccurr_Black:Class;
		[Embed(source="/assets/WJ_빨.png")]  
		private var GEleccurr_Red:Class;
		[Embed(source="/assets/WJ_파.png")]  
		private var GEleccurr_Blue:Class;
		// 전위
		[Embed(source="/assets/WT_검.png")]  
		private var GPotential_Black:Class;
		[Embed(source="/assets/WT_빨.png")]  
		private var GPotential_Red:Class;
		[Embed(source="/assets/WT_파.png")]  
		private var GPotential_Blue:Class;
		// MOV
		[Embed(source="/assets/M_검.png")]  
		private var GMov_Black:Class;
		[Embed(source="/assets/M_빨.png")] 
		private var GMov_Red:Class;
		[Embed(source="/assets/M_파.png")]  
		private var GMov_Blue:Class;
		// RPC
		[Embed(source="/assets/R검.png")]  
		private var GRpc_Black:Class;
		[Embed(source="/assets/R빨.png")] 
		private var GRpc_Red:Class;
		[Embed(source="/assets/R파.png")] 
		private var GRpc_Blue:Class;
		
		public function setImage(id:String, gubun:String, alarmValue:Object, item:Object, imgPt:Point)
		{
			
			var bitmap:Bitmap;
			var alarmType:String;
			
			var alarmHL:Object = Utils.getAlarmHL(gubun, item);
			
			if(alarmValue=="general"){
				if(alarmHL["PRES1_H"] || alarmHL["PRES2_H"] || alarmHL["FILT1_H"] || alarmHL["ELEC1_H"] || alarmHL["CURR1_H"] || alarmHL["VOLT1_H"]) alarmType = "red";
				else if(alarmHL["PRES1_L"] || alarmHL["PRES2_L"] || alarmHL["FILT1_L"] || alarmHL["ELEC1_L"] || alarmHL["CURR1_L"] || alarmHL["VOLT1_L"]) alarmType = "blue"; 
				else alarmType = "black";
			}else{
				if((alarmValue=="pres1" && alarmHL["PRES1_H"]) || (alarmValue=="pres2" && alarmHL["PRES2_H"]) || (alarmValue=="filt" && alarmHL["FILT1_H"]) || 
					(alarmValue=="elec" && alarmHL["ELEC1_H"]) || (alarmValue=="eleccurr" && alarmHL["CURR1_H"]) || (alarmValue=="volt" && alarmHL["VOLT1_H"])) alarmType = "red";
				else if((alarmValue=="pres1" && alarmHL["PRES1_L"]) || (alarmValue=="pres2" && alarmHL["PRES2_L"]) || (alarmValue=="filt" && alarmHL["FILT1_L"]) || 
					(alarmValue=="elec" && alarmHL["ELEC1_L"]) || (alarmValue=="eleccurr" && alarmHL["CURR1_L"]) || (alarmValue=="volt" && alarmHL["VOLT1_L"])) alarmType = "blue"; 
				else alarmType = "black";
			}
			
			
			switch(gubun){
				case "center": 
					if(alarmType=="red")  bitmap = new GCenter_Red();
					else if(alarmType=="blue")  bitmap = new GCenter_Blue();
					else bitmap = new GCenter_Black();
					break;
				case "region": 
					if(alarmType=="red")  bitmap = new GRegion_Red();
					else if(alarmType=="blue")  bitmap = new GRegion_Blue();
					else bitmap = new GRegion_Black();
					break;
				case "location": 
					if(alarmType=="red")  bitmap = new GLocation_Red();
					else if(alarmType=="blue")  bitmap = new GLocation_Blue();
					else bitmap = new GLocation_Black();
					break;
				case "endline": 
					if(alarmType=="red")  bitmap = new GEndline_Red();
					else if(alarmType=="blue")  bitmap = new GEndline_Blue();
					else bitmap = new GEndline_Black();
					break;
				case "rectifier": 
					if(alarmType=="red")  bitmap = new GRectifier_Red();
					else if(alarmType=="blue")  bitmap = new GRectifier_Blue();
					else bitmap = new GRectifier_Black();
					break;
				case "drainage": 
					if(alarmType=="red")  bitmap = new GDrainage_Red();
					else if(alarmType=="blue")  bitmap = new GDrainage_Blue();
					else bitmap = new GDrainage_Black();
					break;
				case "eleccurr": 
					if(alarmType=="red")  bitmap = new GEleccurr_Red();
					else if(alarmType=="blue")  bitmap = new GEleccurr_Blue();
					else bitmap = new GEleccurr_Black();
					break;
				case "mov": 
					if(alarmType=="red")  bitmap = new GMov_Red();
					else if(alarmType=="blue")  bitmap = new GMov_Blue();
					else bitmap = new GMov_Black();
					break;
				case "rpc": 
					if(alarmType=="red")  bitmap = new GRpc_Red();
					else if(alarmType=="blue")  bitmap = new GRpc_Blue();
					else bitmap = new GRpc_Black();
					break;
			}
			
			
			this.source = bitmap;
			this.id = id;
			this.x = imgPt.x - 12; //bitmap.width/2;
			this.y = imgPt.y - 12; //bitmap.height/2;
			//this.toolTip = "EQID:" + item["EQID"];
			this.toolTip = item["EQNAME"];
			this.name = gubun;
			//this.buttonMode = true;
			
			
			
		}
		
	}
}