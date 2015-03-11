<?php 
$school		= array('id'=>'school', 'class'=>'form-control', 'name'=>'school', 'placeholder'=>'School' ,'value'=> set_value('school', !empty($education->school) ? $education->school : ''));
$desc			= array('id'=>'desc', 'class'=>'form-control', 'name'=>'desc', 'placeholder'=>'Description', 'value'=>set_value('desc', !empty($education->desc) ? $education->desc : ''));
$location		= array('id'=>'location', 'class'=>'form-control', 'name'=>'location', 'placeholder'=>'Location', 'value'=>set_value('location', !empty($education->location) ? $education->location : ''));
$major		= array('id'=>'major', 'class'=>'form-control', 'name'=>'major', 'placeholder'=>'Major', 'value'=>set_value('major',!empty($education->major) ? $education->major : ''));
$gpa		= array('id'=>'gpa', 'class'=>'form-control', 'name'=>'gpa', 'placeholder'=>'GPA', 'value'=>set_value('gpa', !empty($education->gpa) ? $education->gpa : ''));
?>


<div class="main-page-title"><!-- start main page title -->
	<div class="container">
		<div class="post-resume-page-title">My Education</div>
	</div>
</div><!-- end main page title -->
<?php if ($this->session->flashdata('message')):?>
	<div class="alert alert-warning alert-dismissable job-alert alert-lightgreen">
	<button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times-circle"></i></button>
	<?php echo $this->session->flashdata('message');?>
	</div>
<?php endif;?>

<?php if ($this->session->flashdata('error')):?>
	<div class="alert alert-warning alert-dismissable job-alert alert-red">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times-circle"></i></button>
		<?php echo $this->session->flashdata('error');?>
	</div>
<?php endif;?>

<?php if (!empty($error)):?>
	<div class="alert alert-warning alert-dismissable job-alert alert-red">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times-circle"></i></button>
		<?php echo $error;?>
	</div>
<?php endif;?>

<?php if (validation_errors()):?>
	<div class="alert alert-warning alert-dismissable job-alert alert-red">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times-circle"></i></button>
		<?php echo validation_errors();?>
	</div>
<?php endif;?>
<div class="container">
<div class="spacer-1">&nbsp;</div>
	<div class="row">
		<div class="col-md-8">			
			<?php echo form_open('search/education', 'id="education_form"') ?>
				<div class="row">				
					<div class="col-xs-10">
						<label><h5>Professional Education:</h5></label>					
					</div>
				</div>
			
				<div class="form-group">
					<label for="school">School</label>
					<?php echo form_input($school) ?>
				</div>
				
				<div class="form-group">
					<label for="major">Major</label>
					<?php echo form_input($major) ?>
				</div>	
				
				<div class="form-group">
					<label for="major">GPA</label>
					<?php echo form_input($gpa) ?>
				</div>	
				
				<div class="form-group">
					<label for="major">Degree Level</label>
					<select class="form-control" name="degree_level" id="degree_level">
					    <optgroup label="--Select Degree Level--">						    	
						  <option value="Bachelor's Degree">Bachelor's Degree</option>
						  <option value="Advanced Diploma">Advanced Diploma</option>
						  <option value="Diploma">Diploma</option>
						  <option value="Certification">Certification</option>
						  <option value="High School or equivalent">High School or equivalent</option>
						  <option value="High School Not Completed">High School Not Completed</option>
						  <option value="Master's Degree">Master's Degree</option>
						  <option value="Doctorate Degree">Doctorate Degree</option>																
					    </optgroup>				    
					</select>	
				</div>
				
				<div class="row form-group">
					<div class="form-group">
						<div class="col-md-5">
							<p class="form-group"><label><?php echo lang('address_country');?></label></p>							
								<?php echo form_dropdown('id_country', $countries_menu, set_value('id_country', $id_country), 'id="f_country_id" class="form-control"');?>
						</div>
						<div class="col-md-5">						
							<p class="form-group"><label>School Location</p>	
							<?php echo form_input($location) ?>
						
						</div>
					</div>	
				</div>
				
				<div class="row form-group">
					<div class="form-group">
						<div class="col-md-5">
							<p class="form-group">Start Month</label></p>
								<select class="form-control" name="start_month" id="start_month">
							    <optgroup label="--Select Start Month--">
								    <option value="Jan">Jan</option>
									<option value="Feb">Feb</option>
									<option value="Mar">Mar</option>
									<option value="Apr">Apr</option>
									<option value="May">May</option>
									<option value="Jun">Jun</option>
									<option value="Jul">Jul</option>
									<option value="Aug">Aug</option>
									<option value="Sep">Sep</option>
									<option value="Oct">Oct</option>
									<option value="Nov">Nov</option>
									<option value="Dec">Dec</option>									
							    </optgroup>				    
							</select>	
						</div>
	
						<div class="form-group">
							<div class="col-md-5">
							<p class="form-group">Start Year</label></p>
								<select class="form-control" name="start_year" id="start_year">
								    <optgroup label="--Select Start Year--">								    
								    	<?php for($i=1973; $i<= 2014; $i++){?>
									    	<option value="<?php echo $i?>"><?php echo $i?></option>
								    	<?php }?>								    									    																		
								    </optgroup>				    
								</select>	
							</div>
						</div>
					</div>	
				</div>
				
				
				<div class="row form-group">
					<div class="form-group">
						<div class="col-md-5">
							<p class="form-group">End Month</label></p>
								<select class="form-control" name="end_month" id="end_month">
							    <optgroup label="--Select End Month--">
								    <option value="Jan">Jan</option>
									<option value="Feb">Feb</option>
									<option value="Mar">Mar</option>
									<option value="Apr">Apr</option>
									<option value="May">May</option>
									<option value="Jun">Jun</option>
									<option value="Jul">Jul</option>
									<option value="Aug">Aug</option>
									<option value="Sep">Sep</option>
									<option value="Oct">Oct</option>
									<option value="Nov">Nov</option>
									<option value="Dec">Dec</option>									
							    </optgroup>				    
							</select>	
						</div>
	
						<div class="form-group">
							<div class="col-md-5">
							<p class="form-group">End Year</label></p>
								<select class="form-control" name="end_year" id="end_year">
								    <optgroup label="--Select End Year--">								    
								    	<?php for($i=1973; $i<= 2014; $i++){?>
									    	<option value="<?php echo $i?>"><?php echo $i?></option>
								    	<?php }?>
								    </optgroup>				    
								</select>	
							</div>
						</div>
					</div>	
				</div>
				
				
				<div class="form-group">
					<label for="describtion">Description</label>
					<?php echo form_textarea($desc) ?>
				</div>
						
						
																
				<div class="row">	
					<div class="col-md-7">
						<input type='hidden' name="education_id" value="<?php echo !empty($education) && isset($education) ?  $education->id : '-' ?>"> 
 						<input type="submit" value="Submit" id="submit_education" class="btn btn-default btn-red">
				  	</div>				  
				</div>  						
															
			</form>
			<div class="spacer-2">&nbsp;</div>
			

		</div>

		<div class="col-md-4">
			
			<div class="job-side-wrap">
				<h4>Post Your Resume</h4>
				<p>
					Upload your resume in PDF, Word or text format.
				</p>
				<p class="centering"><button class="btn btn-default btn-black">UPLOAD YOUR RESUME <i class="icon-upload white"></i></button></p>
			</div>

		</div>
	</div>
	
</div>
