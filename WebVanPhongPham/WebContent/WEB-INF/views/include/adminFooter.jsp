<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- <script src="./assets/dist/js/bootstrap.bundle.min.js"></script> -->
<footer class="sticky-footer p-3 mb-2 mbg-navy mt-5">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>
				Công ty TNHH MiniStore<br>
		      	Địa chỉ: 96 Man Thiện, Quận 9, Thành phố Hồ Chí Minh<br>
		      	Hotline: (028) 3812 4124<br>
		    	Bản quyền 2021 thuộc về © MiniStore
			</span>
		</div>
	</div>
</footer>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

		/* Phần này là xử lý đóng thông báo */
		$(".rem").click(rem);
		function rem() {
			$(this).parent().remove();
		}	
		
		/* Hàm này để preview ảnh trước khi load lên server */
		function preview() {
		    img.src=URL.createObjectURL(event.target.files[0]);
		}
		
		const province = document.getElementById("province");
    	const district = document.getElementById("district");
    	const ward = document.getElementById("ward");
    	function getProvince() {
    		$.ajax({ type : 'GET',
				url : 'WebVanPhongPham/api/address/province.htm',
				success : function(data) {
					province.innerHTML = "";
			         data.forEach(item => {
			             let e = document.createElement('option');
			             e.setAttribute("value",item.id);
			             e.innerHTML = item.name;
			             province.appendChild(e);
			         })
			           getDistrict(data[0].id);
				}
			})
    		}
    		function getDistrict(provinceId) {
    			$.ajax({ type : 'GET',
       				url : '/WebVanPhongPham/api/address/district/'+provinceId+'.htm',
       				success : function(data) {1
       					 district.innerHTML = "";
       			            data.forEach(item => {
       			                let e = document.createElement('option');
       			                e.setAttribute("value",item.id);
       			                e.innerHTML = item.name;
       			                district.appendChild(e);
       			            })
       			       getWard(data[0].id);     
       				} 
       			})
    		}
    		
    		function getWard(districtId) {
    			$.ajax({ type : 'GET',
       				url : '/WebVanPhongPham/api/address/ward/'+districtId+'.htm',
       				success : function(data) {1
       					ward.innerHTML = "";
       			            data.forEach(item => {
       			                let e = document.createElement('option');
       			                e.setAttribute("value",item.id);
       			                e.innerHTML = item.name;
       			             ward.appendChild(e);
       			            })
       			            
       				}
       			})
    		}
        
    		document.addEventListener("DOMContentLoaded",function () {  
    		   province.addEventListener("change",function () {
    			   /* alert("change province"); */
    		       getDistrict(this.value); 
    		   });
    		   district.addEventListener("change",function () {
    			   /* alert("change district"); */
    			   getWard(this.value);
    		   });
    		  
    		})

</script>

<script src="<c:url value='resources/assets/dist/js/bootstrap.bundle.min.js'/>"></script>

</body>

</html>
