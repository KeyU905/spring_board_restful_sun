<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Ajax</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
   <script type="text/javascript">
      /*    $.ajax({
         url : '서비스 주소'
         , data : '서비스 처리에 필요한 인자값'
         , type : 'HTTP방식' (POST/GET 등)
         , dataType : 'return 받을 데이터 타입' (json, text 등)
         , success : function('결과값'){
         // 서비스 성공 시 처리 할 내용
         }, error : function('결과값'){
         // 서비스 실패 시 처리 할 내용
         }
      }); */
   
      function getList(){
         var url = "${pageContext.request.contextPath}/rest/after.json";
         // 이 url 위치 찍어보면 알겠지만, 
         // RestBoardSpring4AfterController에 있는url이다.
         //
         // 비동기 통신
         
         $.ajax({
            type:'GET',
            url: url,
            cache: false, // 이걸 안쓰거나 true하면 수정해도 값 반영이 잘 안 됨.
            dataType:'json',// 데이터 타입을 제이슨 꼭해야함
            success:function(result){  //result는 객체
               var htmls = "";
               
               $("#list_table").html("");
               //.html()은 선택한 요소 안의 내용을 가져오거나, 다른 내용으로 바꿉니다. 
               //.text()와 비슷하지만 태그의 처리가 다릅니다.
               
               $("<tr>" , {
                  html : "<td>" + "번호" + "</td>"+  // 컬럼명들
                        "<td>" + "이름" + "</td>"+
                        "<td>" + "제목" + "</td>"+
                        "<td>" + "날짜" + "</td>"+            
                        "<td>" + "히트" + "</td>"+
                        "<td>" + "삭제" + "</td>"
               }).appendTo("#list_table") // 이것을 테이블에붙임
              
               //"#list_table" 이 있는 곳에 {html:  ~~} 의 형식인 
               // "<tr>" 을 넣는다.
               
               if(result.length <1){
                  htmls.push("등록된 댓글이 없습니다.");
               } else {
                  
                  $(result).each(function(){
                     
                          htmls += '<tr>';
                          htmls += '<td>'+ this.bid + '</td>';
                          htmls += '<td>'+ this.bname + '</td>';
                          htmls += '<td>'
                        for(var i=0; i < this.bindent; i++) { //for 문은 시작하는 숫자와 종료되는 숫자를 적고 증가되는 값을 적어요. i++ 은 1씩 증가 i+2 는 2씩 증가^^
                           htmls += '-'   
                       }
                          htmls += '<a href="${pageContext.request.contextPath}/content_view?bId=' + this.bid + '">' + this.btitle + '</a></td>';
                          htmls += '<td>'+ this.bdate + '</td>'; 
                          htmls += '<td>'+ this.bhit + '</td>';   
                          htmls += '<td>'+  '<a class="a-delete" href="${pageContext.request.contextPath}/ajax/delete?bid=' + this.bid +'">' +'삭제</a>'  + '</td>';       
                          htmls += '</tr>';
                          
                      });   //each end

                      htmls+='<tr>';
                      htmls+='<td colspan="5"> <a href="${pageContext.request.contextPath}/write_view">글작성</a> </td>';                         
                      htmls+='</tr>';
                  
               }
               
               $("#list_table").append(htmls);
            }
            
            
         }); //Ajax end
         
      }//end getList   
      
      
  
   </script>
   
    <!--  
     <script>
      $(document).ready(function(){
     
         $('.a-delete').click(function(event){

             event.preventDefault();
             console.log("ajax 호출전"); 

             var trObj =  $(this).parent().parent();
             
             var result;
             
             $.ajax({
                 type : "GET",
                 url : $(this).attr("href"),
/*                  data:{"bId":"${content_view.bId}"},  */
                 async:false,
                 dataType:'json',
                 success: function (data) {       
                     console.log(result); 
                     result = data;
                     
                   if(result == "SUCCESS"){
                        getList();
                      $(trObj).remove();  
                      // $().remove(); 기본으로 주어진 함수.
                                
                   }                       
                 },
                 error: function (e) {
                     console.log(e);
                 }
             });
              
          });     
      
      });
   </script> -->
   
      <script>
      $(document).ready(function(){
         $(document).on("click",".a-delete",function(event){
            //prevendDefault()는 href로 연결해 주지 않고 단순히 click에 대한 처리를 하도록 해준다.
            event.preventDefault();
            console.log("ajax 호출전"); 
            //해당 tr제거
            var trObj =  $(this).parent().parent();
            
            $.ajax({
                type : "GET",
                url : $(this).attr("href"),
                // this 요소의 href 속성의 값을 가져온다
                // 저 .a-delete 의 주소를 가져와서 여기서 실행.
                //위에서 event.preventDefault(); 를 통해
                // url로 넘어가는 걸 막고, 실행 결과는 ajax를 통해 실행하기 위해 여기서 처리.
                success: function (result) {       
                    console.log(result); 
                  if(result == "SUCCESS"){
                       //getList();
                     $(trObj).remove();  
                               
                  }                       
                },
                error: function (e) {
                    console.log(e);
                }
            })
             
         });   
      
      });
   </script>
  
   <script>
      $(document).ready(function(){
         getList();
         console.log("이건 언제 찍힐까");
         // 실제로 f12로 보면 알겠지만 getList() 보다
         // console. 이 먼저 찍힌다. 이유는 비동기 통신 특성상
         // getList()가 불러오는 시간 동안 기다리지 않고 console을 먼저 실행하는 것.
      
         
      });
   </script>
   
   
   
   </head>
<body>
   <table id="list_table" width="500" cellpadding="0" cellspacing="0" border="1">
            
         
   </table>
</body>
</html>