<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String str = request.getContextPath(); %>    
<!DOCTYPE html>
<html>

<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script>
    $(document).ready(function () {
    	
      $("button").click(function () {
        $.ajax({
          url: "<%=request.getContextPath()%>/EmpServlet?action=list",
          dataType: "json",
          success: function (results) {
            console.log(results);
            var $tags = "<ul>";
            for (var i = 0; i < results.result.length; i++) {
              $tags += "<li>" + results.result[i].employeeid + ",  " + results.result[i].firstName + ",  " + results.result[i].salary + "</li>";
            }
            //$("#div1").text(result);
            $("#div1").append($tags + "</ul>");
          }
        });
      });
    });
  </script>
</head>

<body>

  <div id="div1">
    <h2>Let jQuery AJAX Change This Text</h2>
  </div>

  <button>Get External Content</button>

</body>

</html>