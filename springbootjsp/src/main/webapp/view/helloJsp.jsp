<%--
  Created by IntelliJ IDEA.
  User: MS
  Date: 2017/8/3
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <script type="text/javascript" src="http://api.map.baidu.com/api?key=46ce9d0614bf7aefe0ba562f8cf87194&v=1.0&services=false">
        var map = new BMap.Map("container");          // 创建地图实例

         var point = new BMap.Point(116.404, 39.915);  // 创建点坐标

        map.centerAndZoom(point, 15);

    </script>
</head>
<body>
helloJsp
<hr>
${hello}
<div style="width:520px;height:340px;border:1px solid gray" id="container">
    888
</div>



</body>
</html>
