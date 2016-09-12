<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/view/jspf/taglibs.jsp" %>
<!DOCTYPE HTML5>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Highcharts导出</title>
    <script type="text/javascript" src="${ctx}/js/jquery/jquery.min.js"></script> 
	<script type="text/javascript"  src="${ctx}/js/highcharts/highcharts.js"></script>
    <script type="text/javascript"  src="${ctx}/js/highcharts/exporting.js"></script>
	<%-- <script type="text/javascript"  src="${ctx}/js/highcharts/export-csv.js"></script> --%>
    <script type="text/javascript">
        var chart = null;
        $(function () {
            $('#divChart').highcharts({
                chart: {
                    plotBorderWidth: 1
                },
                title: {
                    text:"highcharts导出"
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                credits: {
                    enabled: false   //右下角不显示LOGO
                },
                series: [{
                    data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
                }, {
                    data: [23, 45.5, 78.4, 89.2, 100.0, 135.0, 76.6, 32.5, 22.4, 67.1, 60.6, 123]
                }]
            });
        });

        ///将highcharts线性图表数据导出至Excel内
        function ExportToExcel() {
            //获取chart对象
            chart = $('#divChart').highcharts();
            //获取chart的横坐标x轴上的刻度集合
            var categoriesObj = chart.xAxis[0].categories;
            //获取chart的series对象集合
            var seriesObj = chart.series;
            //创建AX对象excel
            var oXL = new ActiveXObject("Excel.Application");
            //获取workbook对象 
            var oWB = oXL.Workbooks.Add();
            //激活当前sheet
            var oSheet = oWB.ActiveSheet; 
            //设置工作薄名称
            oSheet.name = chart.options.title.text;
            //设置表头
            //设置series一栏
            oSheet.Cells(1, 1).value = "Series名称";
            //设置x横坐标标签作为表头
            for (var i = 0; i < categoriesObj.length; i++) {
                oSheet.Cells(1, i + 2).value = categoriesObj[i];
            }
            //设置内容部分
            for (var i = 0; i < seriesObj.length; i++) {
                //动态设置第一列的series名称
                oSheet.Cells(i + 2, 1).value = seriesObj[i].name;
                //动态获取每一sereis 每一个点y轴上的数据值                
                for (var j = 0; j < categoriesObj.length; j++) {
                    oSheet.Cells(i + 2, j + 2).value = seriesObj[i].yData[j];
                }
            }
            oXL.Visible = true; //设置excel可见属性
        }        
		</script>
</head>
<body>
    
    <div id="divChart" style="width: 500px; height: 400px; margin: 0 auto">
    </div>
    <div style="margin-top: 15px; text-align: center; width: 100%;">
        <input type="button" id="btnReport" value="导出Excel" onclick="ExportToExcel()" />
    </div>
</body>
</html>