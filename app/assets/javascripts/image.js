
$(function() { 
  const buildImg = (url)=> { 
      const html = `<div class="image"> 
                    <img width="150px" height="150px" src="${url}" > 
                    </div>`; 
      return html;   } 
  $("#image-form").on("change", function(e){ 
  	  $("img").remove(); 
  	  $(".image-text").remove(); 
      const blobUrl = window.URL.createObjectURL(e.target.files[0]); 
      $("#image-preview").append(buildImg(blobUrl)); 
      // $("img").css("border-radius","50%"); 
      // if($("img")
  }) 
}) 
