package pkg1
{
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	import mx.core.UIComponent;
	import mx.utils.StringUtil;

	public class setPolygon extends UIComponent
	{
		//public function setPolygon(eqidRectifier:String, acLocationData:ArrayCollection, acEleccurrData:ArrayCollection) // 정류기EQID, 지역, 전류전위
		public function setPolygon(acPolygonAll:ArrayCollection)
		{
			
			// ---------------- 원 테스트 ----------------------------------------------------------------------------------------------------------
			//var arrEquip:Array = ["358", "301", "246", "211",  "203", "257", "316", "364", "16", "359", "114", "350", "188" ];
//			var acPoligonAll:ArrayCollection = new ArrayCollection();
			var acPolygon:ArrayCollection = new ArrayCollection();
			var obj:Object;
			var idx:int, i:int;
			var theta:Number;
			var pt:Point;
			
			
			// 해당 eqid의 좌표점 추출
//			for each(var eqid:String in arrEqid){
//				idx = Utils.findIndex(acLocationData, "EQID", StringUtil.trim(eqid));
//				if(idx != -1){
//					var pt:Point = Utils.convertToFixel(Number(acLocationData[idx]["HMI_XGIS"]), Number(acLocationData[idx]["HMI_YGIS"]));
//					acPoligonAll.addItem({eqid:eqid, pt:pt});
//				}
//			}
			
			// acLocationData에서 eqidRectifier를 찾는다
//			for each(obj in acLocationData){
//				if((obj["RECTIFIERID"]==eqidRectifier || obj["RECTIFIERID2"]==eqidRectifier || obj["RECTIFIERID3"]==eqidRectifier || obj["RECTIFIERID4"]==eqidRectifier) 
//					&& obj["HMI_XGIS"] != null && obj["HMI_YGIS"] != null)
//				{
//					pt = Utils.convertToFixel(Number(obj["HMI_XGIS"]), Number(obj["HMI_YGIS"]));
//					acPoligonAll.addItem({eqid:obj["EQID"], pt:pt});
//				}
//			}
//			// acEleccurrData에서 eqidRectifier를 찾는다
//			for each(obj in acEleccurrData){
//				if((obj["RECTIFIERID"]==eqidRectifier || obj["RECTIFIERID2"]==eqidRectifier || obj["RECTIFIERID3"]==eqidRectifier || obj["RECTIFIERID4"]==eqidRectifier) 
//					&& obj["HMI_XGIS"] != null && obj["HMI_YGIS"] != null)
//				{
//					pt = Utils.convertToFixel(Number(obj["HMI_XGIS"]), Number(obj["HMI_YGIS"]));
//					acPoligonAll.addItem({eqid:obj["EQID"], pt:pt});
//				}
//			}
			
			// 좌표점 추출결과 3개이상인가,  체크 필요~~~
			if(acPolygonAll.length < 3) return;
			
			// 시작eqid(최하점) 
			var maxY:Number = 0;
			for(i=0; i<acPolygonAll.length; i++){
				if(maxY < acPolygonAll[i].pt.y){
					maxY = acPolygonAll[i].pt.y;
					idx = i;
				}
			}
			acPolygon.addItem(acPolygonAll[idx]); // start object
			
			while(true)
			{
				var maxTheta:Number = 0;
				
				for(i=0; i<acPolygonAll.length; i++)
				{
					if(acPolygon.length == 1) theta = Utils.getTheta(new Point(acPolygon[0].pt.x+10, acPolygon[0].pt.y), acPolygon[0].pt, acPolygonAll[i].pt);
					else theta = Utils.getTheta(acPolygon[acPolygon.length-2].pt, acPolygon[acPolygon.length-1].pt, acPolygonAll[i].pt);
					
					if(theta > maxTheta)
					{
						maxTheta = theta;
						idx = i;
					}
				}
				acPolygon.addItem(acPolygonAll[idx]); 
				
				if(acPolygon.length > 1 && (acPolygon[acPolygon.length-1].eqid == acPolygon[0].eqid)) break;
			}
			
			this.graphics.beginFill(0x0000ff, 0.2);
			this.graphics.lineStyle(2, 0x5b5b5b, 1);
			
			var bFirst:Boolean=true;
			
			for each(obj in acPolygon){
				
				if(bFirst) {
					this.graphics.moveTo(obj.pt.x, obj.pt.y); 
					bFirst = false;
				}
				else{ 
					this.graphics.lineTo(obj.pt.x, obj.pt.y); 
				}
			}
			
			this.graphics.endFill();
			
		}
	}
}