
<?php	
	$password	= array('id'=>'bill_firstname', 'class'=>'form-control', 'name'=>'firstname', 'placeholder'=>'First Name' ,'value'=> set_value('firstname', $customer['firstname']));
	$confirm	= array('id'=>'bill_lastname', 'class'=>'form-control', 'name'=>'lastname',  'placeholder'=>'Last Name', 'value'=> set_value('lastname', $customer['lastname']));
	
?>

		<div class="main-page-title"><!-- start main page title -->
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
				<h4 class="register-title">Change Password</h4>											
				
				<div class="row">
						<div class="col-lg-7 register">							
							<div class="form-regist-details-container">
								<h4>Change Password</h4>				
								<a href="<?php echo site_url('secure/employer_account')?>" class="btn btn-default btn-green">Change User Information</a>												
								<?php echo form_open('secure/change_password', 'role="form"'); ?>
										
								<div class="form-group col-md-14">
									<input type="password" name="password" class="form-control" id="Password" placeholder="Password">														
								</div>
								
								<div class="form-group col-md-14">
									<input type="password" name="confirm" class="form-control" id="Password" placeholder="Confirm Password">														
								</div>
								
								<input type="submit" name="Submit" value="Update" class="btn btn-default btn-red">										
							</form>
							</div>
						</div>
		
						
						
						<div class="col-md-4 register">
							<div class="form-regist-container">
								<h4>Upload Logo</h4>
								
								<p>
								<a href="#" data-toggle="tooltip" data-placement="right" data-html="true" title="Company Logo">	
									<!--  div class="step-by-inner-img">										
										<img src="<?php echo theme_img('step-icon-3.png')?>" alt="Company Logo" class="company-logo"/>
									</div-->
																		
									
									<div id="output">
										<?php if(!empty($customer['logo'])){?>
												<div class="step-by-inner-img2">										
													<img src="<?php echo base_url($customer['logo'])?>" alt="Company Logo" class="company-logo" style="width:280px; height:180px;" />
												</div>											
										<?php }else{?>
												<div class="step-by-inner-img2">										
													<img src="<?php echo theme_img('YourLogo.jpg')?>" alt="Company Logo" class="company-logo" style="width:280px; height:180px;" />
												</div>																					
										<?php }?>
									</div>
									
								</a>	
								</p>
								
								<p>
									Click below to upload a company logo.Choose a file from your computer:Upload JPEG or PNG files up to 2MB
								</p>
								<div class="upload">
								<?php echo form_open_multipart('search/process_upload', 'id="MyUploadForm"');?>
									<div class="form-group">
										<input name="FileInput" id="FileInput" type="file" />					
									</div>
									
									<div class="form-group">					
										<input type="submit"  id="submit-btn" value="Upload" />					
									</div>										
									<img src="<?php echo theme_img('ajax-loader.gif')?>" id="loading-img" style="display:none;" alt="Please Wait"/>
								</form>		
								</div>																
								<div id="progressbox" ><div id="progressbar"></div ><div id="statustxt">0%</div></div>	
														
								
							</div>
						</div>
						
						<div class="col-md-4 register">
							
						</div>
						
				</div>
			</div>
		</div><!-- end main page title -->
		
		