<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#contaiar{width:100%; height: 100%; margin:0 auto;}
.abc{width:100%;height:1080px;}
</style>
<script src="https://code.jquery.com/jquery-3.0.0.js"></script>
</head>
<body>
<input type= "button" value="Select All" onclick="selectAll(this,event);">
<label>����</label><input type="checkbox" name="ch_tag" value="landmark"  onclick="checkSearch(this,this.value);"/>
<label>����</label><input type="checkbox" name="ch_tag" value="relic"  onclick="checkSearch(this,this.value);"/>
<label>�ι�</label><input type="checkbox" name="ch_tag" value="people"  onclick="checkSearch(this,this.value);"/>


<script>
	var tag=""; 
	function checkSearch(object,val){
		if(object.checked==true){
			if(tag!=""){
				tag+=",";
			}
			tag+=val;
			$.ajax({
				url:"Ajax02",
				data:"ch_tag="+tag,
				success:function(data){
					alert(data[0].name)
					//alert("��ż��� >> "+data.info[0].name+"/"+data.info[0].dir);
	                //console.log(data.info[0].name);
	                var temp="";
	                $.each(data, function(index, item){
	                	temp+="<img class='image' src=\""+data[index].dir+"\"; style='width:300px;height:300px; margin-left: 30px;margin-bottom:20px;float:left;'/>";
	                });
                	$(".abc").html(temp);
				},error : function(e) {
	                console.log(e.responseText);
	            }
			});
			alert("üũȮ��")
		}else{
			tag=tag.replace(val,"");
			tag=tag.replace(",","");
			if(tag!=""){
			$.ajax({
				url:"Ajax02",
				data:"ch_tag="+tag,
				success:function(data){
					alert(data[0].name)
					//alert("��ż��� >> "+data.info[0].name+"/"+data.info[0].dir);
	                //console.log(data.info[0].name);
	                var temp="";
					 $.each(data, function(index, item){
		                	temp+="<img class='image' src=\""+data[index].dir+"\"; style='width:300px;height:300px; margin-left: 30px;margin-bottom:20px;float:left;'/>";
		                });
	                	$(".abc").html(temp);
				},error : function(e) {
	                console.log(e.responseText);
	            }
			});
			}else{
				var temp="";
				$(".abc").html(temp);
			}
			alert(tag+"üũ����");
		}
	}
	</script>
<hr>
<div id="contaiar">
<div class='abc'> </div>


</div>
</body>
</html>