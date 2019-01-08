var req = new XMLHttpRequest();
req.open("GET", "./json/image_list.json");
req.onreadystatechange = function() {
   if (this.readystate == 4) {
      var data = JSON.parse(this.response);
      for (var i = 0; i < data.length; i++) {
         var div = document.createElement("div");
         div.setAttribute("class", "image");
      }
   }
}
req.send();