<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://bootstrapk.com/examples/carousel/favicon.ico">

    <title>SM 카렌트</title>

       <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">

<style>
@media screen and (min-width: 768px){

 #slideLeft{
 
    position: absolute;
    top: 50%;
    z-index: 5;
    display: inline-block;
 
    width: 30px;
    height: 30px;
    margin-top: -15px;
    font-size: 30px;
}

#slideRight{
	position: absolute;
    top: 50%;
    z-index: 5;
    display: inline-block;
    
    width: 30px;
    height: 30px;
    margin-top: -15px;
    font-size: 30px;
}
#marketing{
	margin-top: 100px;

}
#marketing2{
	margin-top: 50px;

}
.img-circle{
	border-radius:5%;
	box-shadow: 5px 5px 3px #aaaaaa;
}

.img-circle:HOVER {
    cursor:pointer;
	box-shadow: 20px 20px 13px #aaaaaa;	
}

.divider{
	border: 1px solid #666;
	box-shadow:5px 5px 3px #aaaaaa;
}
#carTitle{
	margin-bottom: 30px;
}

#infoImg:HOVER{
	cursor:pointer;
	-webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.3);
    
}

@media  screen and (min-width:200px) and (max-width:500px) {

	#infoImg{
		max-width:200px;	
		box-shadow: 5px 5px 3px #aaaaaa; 
	}
	
}
@media  screen and (min-width:501px) and (max-width:1568px) {


	#infoImg{
		max-width:400px;	
		box-shadow: 5px 5px 3px #aaaaaa; 
	}
	
}

#resultImg{
	border: 1px solid #666;
	box-shadow:5px 5px 3px #aaaaaa;
}

</style>
    
   