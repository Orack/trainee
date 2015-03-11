	<div id="footer"><!-- Footer -->
		<div class="container"><!-- Container -->
			<div class="row">
										
				<div class="col-md-5">
					</br>
				</div>
				
				
				<?php if(empty($country_page)): ?>
																											
					<div class="col-md-5 footer_link">
						<a href="<?php echo site_url('about_us')?>">About</a>					
						<a href="<?php echo site_url('contact_us')?>">Contact</a>
					</div>
				
				<?php else: ?>
									
					<div class="col-md-3 footer_link">
						Copyright &copy; 2014 Jobspeer.com
					</div>
					
				<?php endif;?>	
				<!-- News Leter Widget -->
				<!--div class="col-md-3 footer-widget">
					<h6 class="widget-title">Sign For news Letter</h6>
						
					<?php echo form_open('search/newsletter', 'class="newsletter" id="newsletter_form" name="newsletter_form"') ?>
						<div class="form-group textwidget-alert">
							<p id="email_message"></p>
							<input type="email" name="email" class="input-newstler" id="email">
						</div>						
						<input type="button" value="Sign Up" class="btn-newstler" id="btn-newstler">
						<p><div class="animation_image display_none"><img src="<?php echo theme_img('ajax-loader.gif')?>"> Loading... </div><p>	
					</form>
				
				</div><!-- News Leter Widget -->
				
							
				
				<div class="clearfix"></div>
				
				
			</div>
	
		</div><!-- Container -->
	</div><!-- Footer -->    
    
</div><!-- end main wrapper in header.php file-->

<style>
.display_none{
	display:none;
}    
</style>

<script type="text/javascript"
	src="http://gdc.indeed.com/ads/apiresults.js">
</script>

<?php echo theme_js('jquery.js', true);?>
<?php echo theme_js('bootstrap.min.js', true);?>
<?php echo theme_js('squard.js', true);?>
<?php echo theme_js('equal_heights.js', true);?>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<?php echo bootstrap_js('bootstrap.min.js', true);?>


<!-- Tabs -->
<?php echo theme_js('jquery.easytabs.min.js', true);?>
<?php echo theme_js('modernizr.custom.49511.js', true);?>
<!-- Tabs -->

<!-- Owl Carousel -->
<?php echo theme_js('owl.carousel.js', true);?>
<!-- Owl Carousel -->

<!-- Form Slider -->
<?php echo theme_js('jshashtable-2.1_src.js', true);?>


<?php echo theme_js('jquery.numberformatter-1.2.3.js', true);?>
<?php echo theme_js('tmpl.js', true);?>
<?php echo theme_js('jquery.dependClass-0.1.js', true);?>
<?php echo theme_js('draggable-0.1.js', true);?>
<?php echo theme_js('jquery.slider.js', true);?>
<?php echo theme_js('bootbox.js', true);?>
<?php echo theme_js('jquery.form.min.js', true);?>

<!-- Form Slider -->

<!-- Map -->
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<!-- Map -->

<?php echo theme_js('job-board.js', true);?>

<script>

$('#f_country_id').change(function(){
		$.post('<?php echo site_url('locations/get_zone_menu');?>',{id:$('#f_country_id').val()}, function(data) {
		  $('#f_zone_id').html(data);
		});
});


$('#f_country_id').change(function(){
	$.post('<?php echo site_url('locations/get_zone_menu');?>',{id:$('#f_country_id').val()}, function(data) {
	  $('#f_state_id').html(data);
	});
});

$(".post-resume-button").click(function(){ 
	
	window.location.replace('<?php echo site_url('post_resume')?>');
	
});


var counter = '<?php echo $this->session->userdata('countRow');?>';
counter++;

$("#addButton").click(function(){ 

	var newTextBoxDiv = $(document.createElement('div')).attr("id", 'SkillBoxDiv' + counter).attr("class", 'unique_skill_checking');
	$('<div class="row">'
			  + '<div class="col-xs-5">'
			  + '<label>Skill #'+ counter + ' : </label>' 
		      + ' <input type="text" name="skill_id['+ counter +']" id="skill_id' + counter 
		      + '" value="" class="form-control" style="margin-bottom:15px;"></div>' 
			  + '<div class="col-xs-5"><label>Level #'+ counter + ' : </label>' 
			  + ' <select name="level['+ counter +']" class="form-control" id="level_id' + counter
			  + '" style="margin-bottom:15px;">'
			  + '<option value=""></option>'
			  + '<option value="1">Basic</option>'
			  + '<option value="2">Intermediate</option>'
			  + '<option value="3">Advanced</option>'
			  + '</select></div>'
			  + '<div class="col-xs-1">'
			  +	'<input type="button" value="X" class="btn btn-default btn-green" id="'+ counter + '" onClick="doRemove(this)">'
			  + '</div>'
			  + '</div>'
			  + '</div>').appendTo(newTextBoxDiv);

	
	$previousRow = counter - 1;
	newTextBoxDiv.appendTo("#SkillTop");
	$(".qty_field").val(counter);
	counter++;
	
});

function doRemove(param){
	bootbox.confirm("Are you sure you want to delete this item?", function(result) {		
		if(result){
			$("#SkillBoxDiv" + param.id).remove();   
			$(".qty_field").val(counter);
		}
	}); 	
}


$("#submit_skill").click(function () {

	$skillErrorCount = 0;	
	
	$(".unique_skill_checking").each(function(index, element) {
				
		$rowCount = index + 1;
		
		if($("#skill_id"+$rowCount).val() != '' && $("#level_id"+$rowCount).val() == ''){
			$("#level_id"+$rowCount).addClass("error-textbox");
			$skillErrorCount ++;
		}else if($("#skill_id"+$rowCount).val() == '' && $("#level_id"+$rowCount).val() != ''){
			$("#skill_id"+$rowCount).addClass("error-textbox");
			$skillErrorCount ++;
		}								
	});		       	

	if($skillErrorCount < 1){
		$( "#skill_form" ).submit();	
	}
	   	
});


$("#addLanguageButton").click(function(){ 

	var newTextBoxDiv = $(document.createElement('div')).attr("id", 'LanguageBoxDiv' + counter).attr("class", 'unique_language_checking');		
	$('<div class="row">'
			  + '<div class="col-xs-5">'
			  + '<label>Language #'+ counter + ' : </label>' 
		      + ' <input type="text" name="language_id['+ counter +']" id="language_id' + counter 
		      + '" value="" class="form-control" style="margin-bottom:15px;"></div>' 
			  + '<div class="col-xs-5"><label>Level #'+ counter + ' : </label>' 
			  + ' <select name="level['+ counter +']" class="form-control" id="level_id' + counter
			  + '" style="margin-bottom:15px;">'
			  + '<option value=""></option>'
			  + '<option value="1">Basic</option>'
			  + '<option value="2">Intermediate</option>'
			  + '<option value="3">Advanced</option>'
			  + '</select></div>'
			  + '<div class="col-xs-1">'
			  +	'<input type="button" value="X" class="btn btn-default btn-green" id="'+ counter + '" onClick="doRemoveLanguage(this)">'
			  + '</div>'
			  + '</div>'
			  + '</div>').appendTo(newTextBoxDiv);

	
	$previousRow = counter - 1;
	newTextBoxDiv.appendTo("#LanguageTop");
	$(".qty_field").val(counter);
	counter++;
	
});

function doRemoveLanguage(param){
	bootbox.confirm("Are you sure you want to delete this item?", function(result) {		
		if(result){
			$("#LanguageBoxDiv" + param.id).remove();   
			$(".qty_field").val(counter);
		}
	}); 	
}


$("#submit_language").click(function () {

	$languageErrorCount = 0;	
	
	$(".unique_language_checking").each(function(index, element) {
				
		$rowCount = index + 1;	
		
		if($("#language_id"+$rowCount).val() != '' && $("#level_id"+$rowCount).val() == ''){
			$("#level_id"+$rowCount).addClass("error-textbox");
			$languageErrorCount ++;
		}else if($("#language_id"+$rowCount).val() == '' && $("#level_id"+$rowCount).val() != ''){
			$("#language_id"+$rowCount).addClass("error-textbox");
			$languageErrorCount ++;
		}					
		//console.log( index + "Element - "+ element + ": " + $( this ).text() );		
	});		       	

	if($languageErrorCount < 1){
		$( "#language_form" ).submit();	
	}
	   	
});


/* Upload Manager */

var options = { 
		target:   '#output',   // target element(s) to be updated with server response 
		beforeSubmit:  beforeSubmit,  // pre-submit callback 
		success:       afterSuccess,  // post-submit callback 
		uploadProgress: OnProgress, //upload progress callback 
		resetForm: true        // reset the form after successful submit 
}; 


$('.btn-file :file').on('fileselect', function(event, numFiles, label) {
        
	var input = $(this).parents('.input-group').find(':text'),
	log = numFiles > 1 ? numFiles + ' files selected' : label;

	console.log(input.length);
	if( input.length ) {
	    //input.val(log);
		$(this).ajaxSubmit(options);  			
		// always return false to prevent standard browser submit and page navigation 
		return false; 
	    
	} else {		
	    //if( log ) alert(log);
		$(this).ajaxSubmit(options);  			
		// always return false to prevent standard browser submit and page navigation 
		return false; 
	}        
        
});

$(document).on('change', '.btn-file :file', function() {
  var input = $(this),
      numFiles = input.get(0).files ? input.get(0).files.length : 1,
      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
  input.trigger('fileselect', [numFiles, label]);
});

if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
    $('.selectpicker').selectpicker('mobile');
}

$("[data-toggle=tooltip]").tooltip();


	
 $('#MyUploadForm').submit(function() { 
		$(this).ajaxSubmit(options);  			
		// always return false to prevent standard browser submit and page navigation 
		return false; 
}); 
		

//function after succesful file upload (when server response)
function afterSuccess()
{
	$('#submit-btn').show(); //hide submit button
	$('#loading-img').hide(); //hide submit button
	$('#progressbox').delay( 1000 ).fadeOut(); //hide progress bar

}

//function to check file size before uploading.
function beforeSubmit(){
    //check whether browser fully supports all File API
   if (window.File && window.FileReader && window.FileList && window.Blob)
	{
		
		if( !$('#FileInput').val()) //check empty input filed
		{
			$("#output").html("No Image has been selected, Please try again.");
			return false
		}
		
		var fsize = $('#FileInput')[0].files[0].size; //get file size
		var ftype = $('#FileInput')[0].files[0].type; // get file type
		

		//allow file types 
		switch(ftype)
        {
            case 'image/png': 
			case 'image/gif': 
			case 'image/jpeg': 
			case 'image/pjpeg':
			case 'text/plain':
			case 'text/html':
			case 'application/x-zip-compressed':
			case 'application/pdf':
			case 'application/msword':
			case 'application/vnd.ms-excel':
			case 'video/mp4':
                break;
            default:
                $("#output").html("<b>"+ftype+"</b> Unsupported file type!");
				return false
        }
		
		//Allowed file size is less than 5 MB (1048576)
		if(fsize>5242880) 
		{
			$("#output").html("<b>"+bytesToSize(fsize) +"</b> Too big file! <br />File is too big, it should be less than 5 MB.");
			return false
		}
				
		$('#submit-btn').hide(); //hide submit button
		$('#loading-img').show(); //hide submit button
		$("#output").html("");  
	}
	else
	{
		//Output error to older unsupported browsers that doesn't support HTML5 File API
		$("#output").html("Please upgrade your browser, because your current browser lacks some new features we need!");
		return false;
	}
}

//progress bar function
function OnProgress(event, position, total, percentComplete)
{
    //Progress bar
	$('#progressbox').show();
    $('#progressbar').width(percentComplete + '%') //update progressbar percent complete
    $('#statustxt').html(percentComplete + '%'); //update status text
    if(percentComplete>50)
        {
            $('#statustxt').css('color','#000'); //change status text to white after 50%
        }
}

//function to format bites bit.ly/19yoIPO
function bytesToSize(bytes) {
   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
   if (bytes == 0) return '0 Bytes';
   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
}


$('#status').change(function() {   	
   	document.getElementById("application_form").submit();
});



$("#btn-newstler").click(function (e) { //user clicks on button
	
	var email = $("#email").val();
	var isPassingValid = true;

	if(!noBlanks(email))
	{
		$("#email_message").show();
		$("#email_message").text('');
		$("#email_message").text("Email is required.");
		isPassingValid = false;
	}else{
		$("#email_message").hide();

		if(!isValidEmail(email))
		{
			$("#email_message").show();
			$("#email_message").text("Please include an '@' in the email address. "+ email +" is missing '@' ");
			isPassingValid = false;
		}else{
			$("#email_message").hide();
		}
	}
	if(isPassingValid)
	{
		//$(this).hide(); 
		$('.animation_image').show(); //show loading image
		$.post('<?php echo site_url('search/newsletter');?>',{'email': email}, 
		function(data) {
			$('.animation_image').hide(); //hide loading image	
			$("#email_message").show();
			$("#email_message").text(data);							
		}).fail(function(xhr, ajaxOptions, thrownError) { 
			alert(thrownError); //alert any HTTP error
			$('.animation_image').hide(); //hide loading image once data is received			
		});	
	}
									 		  
});

function isValidEmail(email)
{
	return email.indexOf("@") != -1;
}

function noBlanks(fields)
{
	if(fields != ''){
		return true;
	}else{
		return false;
	}
}

var track_click = 0; //track user click on "load more" button, righ now it is 0 click

var total_pages =  <?php echo isset($num_pages) && !empty($num_pages) ? $num_pages : 0  ?>;
var category_id = <?php echo isset($category->id) && !empty($category->id) ? $category->id : 0 ?>;
track_click++;

$(".load_more").click(function (e) { //user clicks on button

	$(this).hide(); //hide load more button on click
	$('.animation_image').show(); //show loading image

	if(track_click <= total_pages) //make sure user clicks are still less than total pages
	{
		//post page number and load returned data into result element
		$.post('<?php echo site_url('search/loadmore_job');?>',{'page': track_click, 'category_id': category_id}, function(data) {
		
			$(".load_more").show(); //bring back load more button					
			$("#item-list ul").append(data); //append data received from server
			
			//scroll page to button element
			//$("html, body").animate({scrollTop: $("#load_more_button").offset().top}, 500);
			
			//hide loading image
			$('.animation_image').hide(); //hide loading image once data is received

			track_click++; //user click increment on load button
		
		}).fail(function(xhr, ajaxOptions, thrownError) { 
			alert(thrownError); //alert any HTTP error
			$(".load_more").show(); //bring back load more button
			$('.animation_image').hide(); //hide loading image once data is received
		});
						
		if(track_click >= total_pages-1)
		{
			//reached end of the page yet? disable load button
			$(".load_more").attr("disabled", "disabled");
		}
	 }
	  
	});

/* End of Upload Manager */ 


</script>

<script>

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){

(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),

m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)

})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-53885147-1', 'auto');

ga('send', 'pageview');

</script>

</body>
</html>