<%--
  Created by IntelliJ IDEA.
  User: MS
  Date: 2017/8/4
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="shortcut icon" href="1.ico">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>展示</title>
    <!-- 百度地图API-->

    <script src="jquery-3.2.1.min.js" type="text/javascript">


    </script>
    <script type="text/javascript">
        var px=116.403884;
        var py=39.914887;
        var nr="";
        //监听事件开启
        $(document).ready(function () {
            $("#search").click(function () {

            var searchinfo = $("#searchinfo").val();
            if(searchinfo!=null&searchinfo!=""){

                $.ajax({
                    async: false,
                    type: "get",
                    url: '/search',
                    data: {
                        str:searchinfo
                    },
                    dataType: "json",
                    success: function (msg) {

                    /*    console.log(msg.length);
                        console.log(msg[0]);
                        console.log(msg[0]["url"]);
                        console.log(msg[0]["title"]);
                        console.log(msg[0]["context"]);*/
                        console.log(msg[0]["pxy"].split("pxy:")[1].split(">")[0].split(",")[0]);
                        //清空div
                        $("#searchinfoc").empty();


                        var content="";
                        var returnbtn="<div type='button' class='rebtn' onclick='clickreturn()'>返回搜索结果</div>";
                        $("#searchinfoc").append(returnbtn);

                        var pxl=new Array();
                        var pyl=new Array();
                        for(var i=0;i<msg.length;i++){

                            var context=msg[i]["context"].split("context:")[1];
                            var title=msg[i]["title"].split("title:")[1].split(">")[0];
                            var url= msg[i]["url"].split("url:")[1].split(">")[0];
                            var px=msg[i]["pxy"].split("pxy:")[1].split(">")[0].split(",")[0];
                            var py=msg[i]["pxy"].split("pxy:")[1].split(">")[0].split(",")[1];
                            var pp=msg[i]["pxy"].split("pxy:")[1].split(">")[0].split(",")[2];

                              pxl[i]=px;
                              pyl[i]=py;
                           /* content="<div style='cursor: pointer' id="+'test'+i+" onclick='inputclick("+msg[i]['px']+","+msg[i]['py']+',"'+msg[i]["conmment"]+'"'+")'>"+msg[i]['title']+"</div>"+*/
                            /*content="<div class='disshow'   id="+'test'+i+" onclick='inputclick(this)' px="+msg[i]['px'] +" py="+msg[i]['py']+">"+msg[i]['title']+"</div>"+*/
                            content="<div class='disshow'   id="+'test'+i+" onclick='inputclick(this)' px="+px +" py="+py+" pp="+pp+">新闻标题： "+title+"</div>"+
                                    "<a class='acontent' href='"+url+"' target='_blank'>资料来源</a>"+

                                "<div class='dishide'  id="+'htest'+i+">"+context+"</div> ";
                            $("#searchinfoc").append(content);

                        }
                        initialize(116.403884,39.914887,4,pxl,pyl);

                    }
                    }
                );
            }


            });


        });


            function inputclick(e) {
                console.log($(this));
                console.log($(this).attr("id"));
                console.log($(this).attr("px"));
             var divid;
                divid=e.id;
                /*console.log(divid);*/

            var hdivid='h'+divid;
            /*console.log(divid);
            console.log(hdivid);*/
         $(".disshow").hide();
          $("#"+hdivid).show();
          $(".acontent").hide();
          $(".rebtn").show();
          console.log(e);

          /*console.log(e.getAttribute("py"))*/
            initialize(e.getAttribute("px"),e.getAttribute("py"),e.getAttribute("pp"));

        }

        function clickreturn() {
            $(".rebtn").hide();
            $(".disshow").show();
            $(".acontent").show();
            $(".dishide").hide();
           // initialize(116.403884,39.914887,15);

        }

        function inputclear(){
                $("#searchinfo").val("");
                console.log($("#searchinfo").val());
        }
        //回车键监听提交
        $(document).keyup(function(event){
            if(event.keyCode ==13){
                $("#search").trigger("click");
            } });

    </script>
</head>
<body>
<div>
    <input  id="searchinfo" class="searchinfo" type="text" name="search" placeholder="搜索内容" required>
    <a href="javascript:" onclick="inputclear()" class="clear"></a>

    <button id="search" class="search" type="submit">搜索</button>
</div>

<div id="show" class="show">
    <div id="searchinfoc" class="searchinfoc">
        <%--<input type="text"  onclick="inputclick(value)" name="valu1" id="valu" value="122223"/>
        <input type="text"  onclick="inputclick(value)" name="valu2" id="valu2" value="332987"/>--%>
            <%--<div id="test" onclick="inputclick(223965)" >新建div</div>
            <div id="test" onclick="inputclick('第三者')" >新建div2</div>
            <div id="test" onclick="inputclick('ddds')" >新建div3</div>--%>
           <%-- <div id="test" class="tg" onclick="inputclick(2,3,'第三者')" >新建div2</div>
            <a href="index.jsp">点击</a>
            <iframe src="view/helloJsp.jsp" width="300px" height="200px" scrolling="yes" frameborder="1px">打开 </iframe>--%>

    </div>

</div>
<!-- 百度地图地图容器-->
<div id="map" style="width:60%;height:420px;right: 20px;float: right;padding-top: 20px"></div>
</body>


<link rel="stylesheet" href="leftDiv.css" >
<script src="http://api.map.baidu.com/api?v=1.2" type="text/javascript"></script>
<script type="text/javascript">
    function initialize(x,y,z,pxl,pyl) {
       /* if(x==null&y==null){
            x=117.403884,y=38.914887;
        }*/
        //创建地图实例
        var map = new BMap.Map('map');
        //创建一个坐标
        var point =new BMap.Point(x, y);
        //地图初始化，设置中心点坐标和地图级别
        map.centerAndZoom(point,z);
        var marker = new BMap.Marker(point); 　　　　　 // 创建标注
        map.addOverlay(marker);      // 将标注添加到地图中
        map.addControl(new BMap.NavigationControl());
       // map.centerAndZoom(point, z);


        if(pxl!=null&&pxl.length>0){
            for(var i=0;i<pxl.length;i++){
                var mp='maker'+i;
                mp=new BMap.Marker(new BMap.Point(pxl[i],pyl[i]));
                //map.centerAndZoom(new BMap.point(112.920744,11.652339),6);
                map.addOverlay(mp);
                mp.setAnimation(BMAP_ANIMATION_BOUNCE);
            }
        }

       /*// var point2=
        var marker2=new BMap.Marker(new BMap.Point(112.920744,11.652339));
        //map.centerAndZoom(new BMap.point(112.920744,11.652339),6);
        map.addOverlay(marker2);
        marker2.setAnimation(BMAP_ANIMATION_BOUNCE);


        var marker3=new BMap.Marker(new BMap.Point(125.780455,39.06135));
       // map.centerAndZoom(new BMap.point(125.780455,39.06135),6);
        map.addOverlay(marker3);
        marker3.setAnimation(BMAP_ANIMATION_BOUNCE);

        var marker4=new BMap.Marker(new BMap.Point(125.780455,39.06135));
        // map.centerAndZoom(new BMap.point(125.780455,39.06135),6);
        map.addOverlay(marker4);
        marker4.setAnimation(BMAP_ANIMATION_BOUNCE);*/

       /* //打开信息窗口
        var opts = {
            width : 60,     // 信息窗口宽度
            height: 60,     // 信息窗口高度
            title : "地名" , // 信息窗口标题
            //font-size : 12
        } ;
        var infoWindow = new BMap.InfoWindow("描述信息", opts);  // 创建信息窗口对象
        map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口*/

    }
    window.onload = initialize(116.403884,39.914887,15,null,null);
</script>
</html>