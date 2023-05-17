function draw() {
    var canvas = document.getElementById("canvas");
    if (canvas.getContext){
        var context = canvas.getContext("2d");

        context.fillStyle = "rgb(256,0,0)";
        context.fillRect (10, 40, 5, 10);
        
        context.fillStyle = "rgba(0, 0, 200, 0.6)";
        context.fillRect (18, 50, 35, 4);
    }
}
  
