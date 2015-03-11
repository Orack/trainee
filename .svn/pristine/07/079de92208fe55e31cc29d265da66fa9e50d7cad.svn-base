<div class="main-page-title"><!-- start main page title -->
	<div class="container">
		<div class="post-resume-page-title">My Resume</div>		
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
			<form role="form" class="post-resume-form">
			
			<div class="panel panel-default">
				  	<div class="panel-heading">
				    	<h3 class="panel-title">Personal Details:</h3>
				  	</div>
				  	<div class="panel-body">
				    	<div class="row form-group">
							<div class="form-group">
								<div class="col-md-7">
									<p><label for="name"><h5>Name:</h5></label></p>							
										<?php echo $customer['firstname'].' '.$customer['lastname'] ?>
								</div>			
								<div class="col-md-5">
									<p><label for="email"><h5>Email:</h5></label></p>							
									<?php echo $customer['email'] ?>
								</div>
							</div>	
						</div>
						<div class="form-group">
							<label for="phone"><b>Contact:</b> <?php echo (!empty($customer['phone']) && isset($customer['phone'])) ? $customer['phone'] : '-' ?></label>					
						</div>	
				  	</div>
				</div>	

				
				
				
				<div class="panel panel-default">
				  	<div class="panel-heading">
				    	<h3 class="panel-title">Professional Skills:</h3>
				  	</div>
				  	<div class="panel-body">
				    	<?php if(!empty($skills)){
						$skill_set = '';
						for($i=0; $i<sizeof($skills);$i++){
							if($i == 0){
								$skill_set = $skills[$i]['title'];
							}else{
								$skill_set .= ', '.$skills[$i]['title'];
							}
						}
						?>
						<p><?php echo $skill_set ?></p>
												
						<?php }else{ ?>
							<label>Please enter your professional skills and qualifications (e.g. car repair, computer programming languages, etc.).</label>
						<?php }?>						
						<p><a href="<?php echo site_url('skill')?>" class="btn btn-default btn-red btn-sm">Click here to add a Skill</a></p>
				  	</div>
				</div>
						
						
				<div class="panel panel-default">
				  	<div class="panel-heading">
				    	<h3 class="panel-title">Language:</h3>
				  	</div>
				  	<div class="panel-body">
				    	<?php if(!empty($languages)){
						$skill_set = '';
						for($i=0; $i<sizeof($languages);$i++){														
							if($i == 0){								
								$skill_set = $languages[$i]['title'];
							}else{
								$skill_set .= ', '.$languages[$i]['title'];
							}																		
						}
					?>										
					<p><?php echo $skill_set ?></p>
											
					<?php }else{ ?>
						<label>Please enter any languages you speak or write.</label>
					<?php }?>
					<p><a href="<?php echo site_url('language')?>" class="btn btn-default btn-red btn-sm">Click here to add a Language</a></p>
				  	</div>
				</div>		
				
				
				<div class="panel panel-default">
				  	<div class="panel-heading">
				    	<h3 class="panel-title">Experience:</h3>
				  	</div>
				  	<div class="panel-body">
				  	<!-- Table -->
					<table class="table" width="100%">					    					  
					<?php if(!empty($experiences)){
					?>					
						<tr>
							<th width="60%">Description</th>
							<th width="40%">Actions</th>
						</tr>
					<?php 
						for($i=0; $i<sizeof($experiences);$i++){														
					?>
						<tr>
							<td>
							
							<div class="form-group">
								<?php echo $experiences[$i]['company'] ?>(<?php echo $experiences[$i]['position'] ?>)																
								- <?php echo $experiences[$i]['location'] ?>
								<p><?php echo $experiences[$i]['start_date'] ?> - <?php echo $experiences[$i]['end_date'] ?></p>
							</div>
																															
							</td>							
							<td><a href="<?php echo site_url('search/experience/resume/'.$experiences[$i]['id'])?>" class="btn btn-default btn-green btn-sm"> Edit</a></td>
						</tr>															
					<?php 																				
						}
					?>										
																
					<?php }else{ ?>					
						<label>Experience matters. Add full or part-time employment, volunteering and community service experiences. Need help? Start with our samples available on our "add position" page.</label>					
					<?php }?>
					<tr>
						<td colspan=2>
							<p><a href="<?php echo site_url('experience')?>" class="btn btn-default btn-red btn-sm">Click here to add a Experience</a></p>
						</td>
					</tr>
					</table>
				  	</div>
				</div>		
																
				
				<div class="panel panel-default">
				  	<div class="panel-heading">
				    	<h3 class="panel-title">Education:</h3>
				  	</div>
				  	<div class="panel-body">
						<table class="table" width="100%">						
						<?php if(!empty($educations)){							
						?>
						
						<tr>
							<th width="60%">Description</th>
							<th width="40%">Actions</th>
						</tr>						
						
						<?php 		
							for($i=0; $i<sizeof($educations);$i++){														
						?>					
							<tr>
								<td>
									<?php echo $educations[$i]['school'] ?>(<?php echo $educations[$i]['major'] ?>) - <?php echo $educations[$i]['gpa'] ?>
									</br><?php echo $educations[$i]['location'] ?>
									<p><?php echo $educations[$i]['start_date'] ?> - <?php echo $educations[$i]['end_date'] ?></p>		
								</td>								
								<td>
									<a href="<?php echo site_url('search/education/resume/'.$educations[$i]['id'])?>" class="btn btn-default btn-green btn-sm"> Edit</a></p>
								</td>
							</tr>			
						<?php 																				
							}
						?>							
						<?php }else{ ?>	
						<tr>
							<td>
								<label>Employers are interested in your educational background.</label>
							</td>							
						</tr>	
						<?php }?>
						<tr>
						<td colspan=2>
							<p><a href="<?php echo site_url('education')?>" class="btn btn-default btn-red btn-sm">Click here to add a Education</a></p>
						</td>
						</tr>
						</table>
																		
				  	</div>
				</div>
				
				
					<div class="panel panel-default">
				  	<div class="panel-heading">
				    	<h3 class="panel-title">Document:</h3>
				  	</div>
				  	<div class="panel-body">
					<?php if(!empty($member) && isset($member['resume'])){
						$file_name_seperation = explode("/",$member['resume']);
						$file_name = $file_name_seperation[3];
					?>
						<p><a href="<?php echo base_url($member['resume'])?>" target="_blank"> <?php echo $file_name ?></a></p>
					<?php }else{ ?>	
						<a href="<?php echo site_url('upload_resume')?>" class="btn btn-default btn-red btn-sm">Provide your document here.</a>
					<?php }?>
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
				<p class="centering"><a href="<?php echo site_url('upload_resume')?>" class="btn btn-default btn-black">UPLOAD YOUR RESUME <i class="icon-upload white"></i></a></p>
			</div>

		</div>
	</div>
	
</div>
