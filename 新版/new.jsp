<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% String path = request.getContextPath(); %>
<html>
<head>
<title>新闻</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css"  href="<%=path%>/Assets/mobile/css/frozen.css"  />
<link  rel="stylesheet" type="text/css"  href="<%=path%>/Assets/mobile/css/mobile.css"  />
<link type="text/css" media="all" rel="stylesheet" href="<%=path%>/Assets/mobile/dropload/css/style.css" />
<link type="text/css" media="all" rel="stylesheet" href="<%=path%>/Assets/mobile/dropload/css/dropload.css">
</head>
<body>
 <section class="ui-container">
<section id="tab">
			<div class="ui-tab">
			    <ul class="ui-tab-nav ui-border-b">
			        <li class="current">新闻</li>
			        <li>通知</li>
			        <li>公告</li>
			    </ul>
			    <ul class="ui-tab-content" style="width:300%">
			        <li> 
			           <ul class="ui-list ui-list-pure ui-border-tb" id="xinwen">
			           
                          </ul>
			       			          	        
			        </li>
			        <li>
                          <ul class="ui-list ui-list-pure ui-border-tb" id="tongzhi">
			           
                          </ul>
                   </li>
			        <li>
			         <ul class="ui-list ui-list-pure ui-border-tb" id="gonggao">
			           
                          </ul>			        
			        </li>
			    </ul>
			</div>
</section>

</section><!-- /.ui-container-->
<footer class="ui-footer ui-footer-btn">
            <ul class="ui-tiled ui-border-t">
                <li data-href="<%=path%>/mobile/toNew.html" class="ui-border-r"><div>新闻中心</div></li>
                <li  data-href="<%=path%>/mobile/meeting.html" class="ui-border-r"><div>会议中心</div></li>
                <!--  
                 <li data-href="<%=path%>/mobile/data.html" class="ui-border-r"><div>云中心</div></li>
                 -->
                 <li data-href="<%=path%>/mobile/upcoming.html" ><div>我的待办</div></li>                
            </ul>
        </footer>
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=path%>/Assets/mobile/js/lib/zeptojs/zepto.min.js"></script>
<script type="text/javascript" src="<%=path%>/Assets/mobile/js/frozen.js"></script>
<script type="text/javascript" src="<%=path%>/Assets/mobile/js/mobile.js"></script>
<script type="text/javascript">
//js获取路径
var contextPath = '<%=path %>';
var CONTEXTPATH = '<%=path %>';
</script>
<script class="demo-script">
		(function (){
            var tab = new fz.Scroll('.ui-tab', {
		        role: 'tab',
		       // autoplay: true,
		        interval: 3000
		    });
		    /* 滑动开始前 */
		    tab.on('beforeScrollStart', function(fromIndex, toIndex) {
		        console.log(fromIndex,toIndex);// from 为当前页，to 为下一页
		    })
		})();
		


		function loadMsg(){
			  $.ajax({
		          type: 'post',
		          url : contextPath+"/xiaoxi/loadMobileMsgList.html",
				  cache:false,
				  dataType:"json",
		          //data : {mobile:1},
		             success : function(data) { 
	           	            //新闻
         	            if(data.xinwenList.length >0){
         	           	 for(var i=0; i<data.xinwenList.length; i++){
     	            		 var formatD = formatDate(data.xinwenList[i].createTime); //格式化时间    	
     	            		 var n= i +1;
     	            	if(data.xinwenList[i].jiluType == 7){
                            $("#xinwen").append('<li class="ui-border-t" ><a href="/zyzcbpt/mobile/NewDetail.html?xinwenId='+data.xinwenList[i].xinwenId+'"><p><span> '+n+'.</span><span class="date"> '+formatD+'</span></p><h4>'+data.xinwenList[i].xinwenTitle+'</h4></a><span style="font-size:12px">[已读]</span></li>');          
     	            	}else{
                            $("#xinwen").append('<li class="ui-border-t" ><a href="/zyzcbpt/mobile/NewDetail.html?xinwenId='+data.xinwenList[i].xinwenId+'"><p><span> '+n+'.</span><span class="date"> '+formatD+'</span></p><h4>'+data.xinwenList[i].xinwenTitle+'</h4></a><span style="font-size:12px">[未读]</span></li>');          
     	            	}
         	           	 }
         	            }else{$("#xinwen").append('<li class="ui-border-t" >暂时没有数据</li>');}
           	            //通知
         	            if(data.tongzhiList.length >0){
         	           	 for(var i=0; i<data.tongzhiList.length; i++){
     	            		 var formatD = formatDate(data.tongzhiList[i].createTime); //格式化时间    	
     	            		 var n= i +1;
     	            		 if(data.tongzhiList[i].jiluType=8){
     	                          $("#tongzhi").append('<li class="ui-border-t" ><a href="/zyzcbpt/mobile/NoticeDetail.html?noticeId='+data.tongzhiList[i].noticeId+'"><p><span> '+n+'.</span><span class="date"> '+formatD+'</span></p><h4>'+data.tongzhiList[i].noticeName+'</h4></a><span style="font-size:12px">[已读]</span></li>');          
     	            		 }else{
    	                          $("#tongzhi").append('<li class="ui-border-t" ><a href="/zyzcbpt/mobile/NoticeDetail.html?noticeId='+data.tongzhiList[i].noticeId+'"><p><span> '+n+'.</span><span class="date"> '+formatD+'</span></p><h4>'+data.tongzhiList[i].noticeName+'</h4></a><span style="font-size:12px">[未读]</span></li>');          
     	            		 }
         	           	 }
         	            }else{$("#tongzhi").append('<li class="ui-border-t" >暂时没有数据</li>');} 
           	            
         	           //公告
        	            if(data.gonggaoList.length > 0){
        	           	 for(var i=0; i<data.gonggaoList.length; i++){
    	            		 var formatD = formatDate(data.gonggaoList[i].createTime); //格式化时间
    	            		 var n= i +1;
    	            		 if(data.gonggaoList[i].jiluType == 9){
                                 $("#gonggao").append('<li class="ui-border-t" ><a href="/zyzcbpt/mobile/AnnouncementDetail.html?gonggaoId='+data.gonggaoList[i].gonggaoId+'"><p><span> '+n+'.</span><span class="date"> '+formatD+'</span></p><h4>'+data.gonggaoList[i].gonggaoName+'</h4></a><span style="font-size:12px">[已读]</span></li>');    
    	            		 }else{
                                 $("#gonggao").append('<li class="ui-border-t" ><a href="/zyzcbpt/mobile/AnnouncementDetail.html?gonggaoId='+data.gonggaoList[i].gonggaoId+'"><p><span> '+n+'.</span><span class="date"> '+formatD+'</span></p><h4>'+data.gonggaoList[i].gonggaoName+'</h4></a><span style="font-size:12px">[未读]</span></li>');    
    	            		 }
        	           	 }
        	            }else{$("#gonggao").append('<li class="ui-border-t" >暂时没有数据</li>');  }  
		            	 
		             }
  			});
		};
		$(function(){   
			loadMsg();
		});
</script>

</body>
</html>