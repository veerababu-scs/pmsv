$(document).ready(function(){
  $("#btn1").click(function(){
    //$("#test3").hide();
    var fn = $("#_task_project_id").val();
    if (fn=="") {
    	//$("#fns").text("Enter Search Value ");
      alert("Select Project")
    }else
    {
      alert(fn)
    }

  });
});