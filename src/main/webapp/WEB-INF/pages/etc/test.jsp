<!DOCTYPE html>
<html>
<head>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<div id="result"></div>
<input type="text" id="msg" />
<input type="button" value="get result" id="getResult" />
<script>
  $('#getResult').click( function() {
    $('#result').html('');
    $.ajax({
      url:'/test',
      dataType:'json',
      type:'GET',
      data:{'msg':$('#msg').val()},
      success:function(result){
        if(result['result']==true){
          $('#result').html(result['msg']);
        }
      }
    });
  })
</script>
</body>
</html>