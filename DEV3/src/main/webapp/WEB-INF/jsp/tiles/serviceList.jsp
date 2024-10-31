<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<link href="https://unpkg.com/tabulator-tables/dist/css/tabulator.min.css" rel="stylesheet">
 <script type="text/javascript" src="https://unpkg.com/tabulator-tables/dist/js/tabulator.min.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="contentsWrap">
	<div class="contents_bg">
	</div>
	<p class="title ${fav}">${pageName.srnNm}</p>
	<ul class="search_box">
		<li>
			<input type="text" value="" name="coNm" id="coNm" class="input1" placeholder="기관명">
		</li>
		<li>
			<button class="btn_search" id="btn_search">검색</button>
		</li>
	</ul>

	<ul class="contents">
		<li class="view">
			<div class="stitle">
				<p class="tl"><span class="cnt">총 <strong id="totCnt">${totCnt}</strong> 건</span></p>
				<p class="bbs_btn">
					<a href="#" class="btn_bbs btn_approve confirm">승인</a>
					<a href="#" class="btn_bbs btn_write pop_reg" data-pop="write-1">신규</a>
					<a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write-1">수정</a>
					<!-- <a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-1" data-pop="write-1"></a> -->
				</p>
			</div>

			<div class="btnBox">
				<button id="reactivity-add" class="btn_r btn_gray btn_iconTXT">Add New Row</button>
				<button id="reactivity-delete" class="btn_r btn_gray btn_iconTXT">Remove Row</button>
				<button id="reactivity-update" class="btn_r btn_gray btn_iconTXT">Update First Row Name</button>
			</div>

			<div class="tbody">
				<table class="table" id="table-1">
					<div id="example-table" height="200" width="100" background-color="red">테스트2</div>
				</table>
			</div>

		</li>
	</ul>
</div>

</body>
</html>


 <script>

 var tabledata = [];

var table = new Tabulator("#example-table", {
    data:tabledata, //assign data to table
    autoColumns:true, //create columns from data field names
});

 function getMaster(){

		var params = {
				'coNm':$('#coNm').val()
			};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getServiceList.do',
			success : function (resp) {

				var json = JSON.parse(resp);
				tabledata = json.result;
				setGrid(tabledata)
			},
			error : function(err){
				console.log(err);
			}
		});
};

getMaster();




function setGrid(data) {

	//initialize table


	table = new Tabulator("#example-table", {
	    data:data,           //load row data from array
	    layout:"fitColumns",      //fit columns to width of table
	    responsiveLayout:"hide",  //hide columns that don't fit on the table
	    addRowPos:"top",          //when adding a new row, add it to the top of the table
	    history:true,             //allow undo and redo actions on the table
	    pagination:"local",       //paginate the data
	    paginationSize:30,         //allow 7 rows per page of data
	    // paginationCounter:"rows", //display count of paginated rows in footer
	    movableColumns:true,      //allow column order to be changed
	    selectable: 1,
/* 	    initialSort:[             //set the initial sort order of the data
	        {column:"name", dir:"asc"},
	    ], */
	    columnDefaults:{
	        tooltip:true,         //show tool tips on cells
	    },
	    columns:[                 //define the table columns
	        {title:"No.", field:"rowno", editor:"input", headerHozAlign : "center",  hozAlign : "center", width:60},
	        {title:"승인여부", field:"confirmYn", editor:"list",defaultValue: "미승인",  editorParams:{
	            values:{
	            	"승인" : "승인",
	            	"미승인" : "미승인",
	            }, AllowEmpty: false}, headerHozAlign : "center"},
	        {title:"사용여부", field:"useYn", editor:"list", editorParams:{
	            values:{
	            	"사용": "사용",
	            	"미사용": "미사용",
	            } , AllowEmpty: false},  headerHozAlign : "center"},
	        {title:"기관ID", field:"coId", editable : false,  editor:"input", headerHozAlign : "center", hozAlign : "center"},
	        {title:"기관명", field:"coNm", editor:"input", headerHozAlign : "center"},
	        {title:"관리자명", field:"rdrtrNm", editor:"input", headerHozAlign : "center"},
	        {title:"관리자이메일", field:"emailAddr", editor:"input", headerHozAlign : "center"},
	       // {title:"홈페이지", field:"hpgAddr", editor:"input", headerHozAlign : "center"},
	        {title:"주소", field:"roadnmAddr", editor:"input", headerHozAlign : "center"},
	        {title:"전화번호", field:"telNo", editor:"input", headerHozAlign : "center"}
	    ],
	});


	table.on("cellEditing", function(row){
	    console.log('ddcellEditing')
	});


	table.on("rowClick", function(row){

	});





}


// 검색기능
$('#btn_search').on('click', function () {
	getMaster();
});



// 행추가
document.getElementById("reactivity-add").addEventListener("click", function(){

 	tabledata.push({"confirmYn" : "미승인", "useYn" : "미사용", "rowno" : tabledata.length+1})
 	console.log(tabledata)
	setGrid(tabledata);

});

// 행삭제
document.getElementById("reactivity-delete").addEventListener("click", function(){

/* 	alert('d')
	alert(table.getSelectedRows())
	console.log(table.getSelectedRows())
	console.log(table.getSelectedData())
	console.log(table.getSelectedData()[0].rowno) */

	var curRow = table.getSelectedData()[0].rowno-1	// 선택된 행
	tabledata.splice(curRow,1)	// 데이터 삭제
	setGrid(tabledata);			// 그리드 재조회
});

//update name on first row in table on button click
document.getElementById("reactivity-update").addEventListener("click", function(){
	 tabledata[0].name = "IVE BEEN UPDATED";
});




 </script>
