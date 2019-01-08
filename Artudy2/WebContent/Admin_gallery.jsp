
<!DOCTYPE html>

<html>

<head>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.0.0.js"></script>
<body>




	<!-- 파일을 전송하기 위한 enctype -->

	<form name="productFrm" action="product_process" encType="multipart/form-data" method="post">

		<table style="width: 80%">

			<tr>

				<th colspan="2">** 작품 등록 **</th>

			</tr>

			<tr>

				<td style="width: 20%">ART_NAME</td>

				<td><input type="text" name="name" id="name"></td>

			</tr>

			<tr>

				<td>ART_CONTENT</td>

				<td><textarea name="content" rows="3" cols="30"></textarea></td>

			</tr>

			<tr>

				<td>ART_TAG</td>

				<td><input type="text" name="tag"></td>

			</tr>

			<tr>

				<td>ART_DIR</td>

				<td> 
					<input type="file" name="image" ></td>

			</tr>

			<tr>


				<script>
				function insert(){
					document.productFrm.action="product_process";
					document.productFrm.method="post";
					document.productFrm.submit();
				}
				function del(){
					document.productFrm.action="product_delete2";
					document.productFrm.method="post";
					document.productFrm.submit();
				}
				</script>
				<td colspan="2"><br /> 
				<input type="submit" value="작품 등록" onclick="insert();">
				
				<input type="button" value="작품 삭제" onclick="del();">
				
				</td>

			</tr>

		</table>

	</form>





</body>

</html>


