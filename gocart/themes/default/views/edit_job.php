<?php 

$job_title		= array('id'=>'job_title', 'class'=>'form-control', 'name'=>'job_title', 'placeholder'=>'Job Title' ,'value'=> set_value('job_title', $job->job_title));
$description	= array('id'=>'description', 'class'=>'form-control', 'name'=>'description', 'placeholder'=>'Description', 'value'=>set_value('description', $job->long_desc ));
$city			= array('id'=>'city', 'class'=>'form-control', 'name'=>'city', 'placeholder'=>'City', 'value'=>set_value('city', $job->city));
$zipcode		= array('id'=>'zipcode', 'class'=>'form-control', 'name'=>'zipcode', 'placeholder'=>'Zip Code', 'value'=>set_value('zipcode', $job->zipcode));
$experience		= array('id'=>'experience', 'class'=>'form-control', 'name'=>'experience', 'placeholder'=>'Experience', 'value'=>set_value('experience'));
$salary			= array('id'=>'app_salary', 'class'=>'form-control', 'name'=>'salary', 'placeholder'=>'Salary', 'value'=>set_value('salary'));

?>


<div class="main-page-title"><!-- start main page title -->
	<div class="container">
		<div class="post-job-title">Edit Existing Job</div>		
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
				
				<?php echo form_open('search/edit_job', 'role="form"', 'class="form-inline post-job-form"'); ?>
				
				<div class="row form-group">
					<div class="form-group">
						<div class="col-md-7">
							<div class="form-group">
								<label for="job_title">Job Title</label>
								<?php echo form_input($job_title) ?>
							</div>
						</div>
	
						<div class="col-md-5">
							<div class="form-group">
							<label for="job_category">Category</label>
							<select class="form-control" name="job_category" id="job_category">
							    <optgroup label="--Select Category--">
								    <option value="Accounting">Accounting</option>
									<option value="Administration">Administration</option>
									<option value="Advertising">Advertising</option>
									<option value="Aerospace Engineering">Aerospace Engineering</option>
									<option value="Agriculture">Agriculture</option>
									<option value="Animation">Animation</option>
									<option value="Anthropology">Anthropology</option>
									<option value="Architecture">Architecture</option>
									<option value="Art">Art</option>
									<option value="Banking">Banking</option>
									<option value="Biology">Biology</option>
									<option value="Biomedical">Biomedical</option>
									<option value="Biomedical Engineering">Biomedical Engineering</option>
									<option value="Biotech">Biotech</option>
									<option value="Business">Business</option>
									<option value="Chemistry">Chemistry</option>
									<option value="Civil Engineering">Civil Engineering</option>
									<option value="Communication">Communication</option>
									<option value="Computer Science">Computer Science</option>
									<option value="Congressional">Congressional</option>
									<option value="Construction">Construction</option>
									<option value="Consulting">Consulting</option>
									<option value="Criminal Justice">Criminal Justice</option>
									<option value="Culinary">Culinary</option>
									<option value="Design">Design</option>
									<option value="Development">Development</option>
									<option value="Dietetic">Dietetic</option>
									<option value="Economics">Economics</option>
									<option value="Education">Education</option>
									<option value="Electrical Engineering">Electrical Engineering</option>
									<option value="Engineering">Engineering</option>
									<option value="Entertainment">Entertainment</option>
									<option value="Environmental">Environmental</option>
									<option value="Event Planning">Event Planning</option>
									<option value="Fashion">Fashion</option>
									<option value="Federal">Federal</option>
									<option value="Film">Film</option>
									<option value="Finance">Finance</option>
									<option value="Geology">Geology</option>
									<option value="Government">Government</option>
									<option value="Graphic Design">Graphic Design</option>
									<option value="Health">Health</option>
									<option value="Healthcare">Healthcare</option>
									<option value="Hospitality">Hospitality</option>
									<option value="Human Resources">Human Resources</option>
									<option value="Industrial Engineering">Industrial Engineering</option>
									<option value="Internet">Internet</option>
									<option value="IT">IT</option>
									<option value="Journalism">Journalism</option>
									<option value="Legal">Legal</option>
									<option value="Management">Management</option>
									<option value="Market Research">Market Research</option>
									<option value="Marketing">Marketing</option>
									<option value="MBA">MBA</option>
									<option value="Mechanical Engineering">Mechanical Engineering</option>
									<option value="Media">Media</option>
									<option value="Medical">Medical</option>
									<option value="Medical Research">Medical Research</option>
									<option value="Museum">Museum</option>
									<option value="Music">Music</option>
									<option value="Non-profit">Non-profit</option>
									<option value="Nutrition">Nutrition</option>
									<option value="Pharmaceutical">Pharmaceutical</option>
									<option value="Photography">Photography</option>
									<option value="Physical Therapy">Physical Therapy</option>
									<option value="Physics">Physics</option>
									<option value="Political Science">Political Science</option>
									<option value="Politics">Politics</option>
									<option value="Pre-Med">Pre-Med</option>
									<option value="Production">Production</option>
									<option value="Psychology">Psychology</option>
									<option value="Public Health">Public Health</option>
									<option value="Public Policy">Public Policy</option>
									<option value="Public Relations">Public Relations</option>
									<option value="Publishing">Publishing</option>
									<option value="Radio">Radio</option>
									<option value="Real Estate">Real Estate</option>
									<option value="Research">Research</option>
									<option value="Retail">Retail</option>
									<option value="Sales">Sales</option>
									<option value="Science">Science</option>
									<option value="Social Media">Social Media</option>
									<option value="Software">Software</option>
									<option value="Sports">Sports</option>
									<option value="Technology">Technology</option>
									<option value="Theater">Theater</option>
									<option value="Transportation">Transportation</option>
									<option value="Wildlife">Wildlife</option>
									<option value="Writing">Writing</option>
									<option value="High School">High School</option>
							    </optgroup>				    
							</select>				
							</div>
						</div>
					</div>	
				</div>
				
				

				<div class="form-group">
					<label for="description">Description</label>					
					<?php echo form_textarea($description)?>
				</div>
				
								
											
				<div class="row form-group">
					<div class="form-group">
						<div class="col-md-7">
							<p class="form-group"><label><?php echo lang('address_country');?></label></p>							
								<?php echo form_dropdown('id_country', $countries_menu, set_value('id_country', $id_country), 'id="f_country_id" class="form-control"');?>
						</div>
	
						<div class="col-md-5">
							<p class="form-group"><label><?php echo lang('address_state');?></label></p>							
							<?php echo form_dropdown('id_state', $zones_menu, set_value('id_state', $id_state), 'id="f_state_id" class="form-control"');?>
						</div>
					</div>	
				</div>
				
				<div class="row form-group">
					<div class="form-group">
						<div class="col-md-7">
							<div class="form-group">
								<label for="city">City</label>
								<?php echo form_input($city)?>					
							</div>
						</div>
	
						<div class="col-md-5">
							<div class="form-group">
								<label for="zipcode">ZipCode</label>
								<?php echo form_input($zipcode)?>				
							</div>
						</div>
					</div>	
				</div>
				
				
				
				<div class="row form-group">
					<div class="form-group">
						<div class="col-md-7">
							<div class="form-group">
							<label for="position_type">Job Type</label>
							<select class="form-control" name="position_type" id="position_type">
							    <optgroup label="--Select Job Type--">
								    <option value="Full Time">Full Time</option>
									<option value="Part Time">Part Time</option>
									<option value="Contract">Contract</option>						
							    </optgroup>
							</select>				
							</div>
						</div>
	
						<div class="col-md-5">
							<div class="form-group">
								<label for="min_edu">Min Education</label>
								<select name="min_edu" id='min_edu' class="form-control">
								  <option value=""></option>
								  <option value="Bachelor's Degree">Bachelor's Degree</option>
								  <option value="Advanced Diploma">Advanced Diploma</option>
								  <option value="Diploma">Diploma</option>
								  <option value="Certification">Certification</option>
								  <option value="High School or equivalent">High School or equivalent</option>
								  <option value="High School Not Completed">High School Not Completed</option>
								  <option value="Master's Degree">Master's Degree</option>
								  <option value="Doctorate Degree">Doctorate Degree</option>
								</select><!-- &#039; is ' -->				
							</div>	
						</div>
					</div>	
				</div>
				
				<div class="row form-group">
					<div class="form-group">
						<div class="col-md-7">
							<div class="form-group">
								<label for="experience">Experience (Year)</label>
								<?php echo form_input($experience)?>				
							</div>
						</div>
	
						<div class="col-md-5">
							<div class="form-group">
								<label for="app_salary">Approximate Salary</label>
								<?php echo form_input($salary)?>				
							</div>
						</div>
					</div>	
				</div>
				
							
				
				<div class="form-group">
					<input type="submit" value="UPDATE THE JOB" class="btn btn-default btn-green">					
				</div>
				
				<input type="hidden" name="id" value="<?php echo $job->id ?>">
			</form>
			<div class="spacer-2">&nbsp;</div>
		</div>
		
		<div class="col-md-4">
			<div class="job-side-wrap">
				<h4>Search Fresh Graduate</h4>								
				<ul class="style-list-3">
					<li>To search for candidates you must be a registered freshgraduate.com.my employer.</li>
					<li>To contact a student, you must have an active internship listing on this website. Then you can search and invite them to apply.</li>					
				</ul>				
				<p class="centering"><button class="btn btn-default btn-green">Search</button></p>
			</div>

			<div class="job-side-wrap">
				<h4>Manage your Applicants</h4>
				<p class="centering"><button class="btn btn-default btn-green">Manage</button></p>				
			</div>

		</div>
	</div>
</div>
