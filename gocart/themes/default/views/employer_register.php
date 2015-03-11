<?php	
	$first		= array('id'=>'bill_firstname', 'class'=>'form-control', 'name'=>'firstname', 'placeholder'=>'First Name' ,'value'=> set_value('firstname'));
	$last		= array('id'=>'bill_lastname', 'class'=>'form-control', 'name'=>'lastname',  'placeholder'=>'Last Name', 'value'=> set_value('lastname'));
	$email		= array('id'=>'bill_email', 'class'=>'form-control', 'name'=>'email', 'placeholder'=>'Email', 'value'=>set_value('email'));
		
	$company	= array('id'=>'bill_company', 'class'=>'form-control', 'name'=>'company', 'placeholder'=>'Company', 'value'=> set_value('company'));
	$phone		= array('id'=>'bill_phone', 'class'=>'form-control', 'name'=>'phone', 'placeholder'=>'Phone', 'value'=> set_value('phone'));
		
	$address1	= array('id'=>'bill_address1', 'class'=>'form-control', 'name'=>'address1', 'placeholder'=>'Street Address', 'value'=> set_value('address1'));
	$address2	= array('id'=>'bill_address2', 'class'=>'form-control', 'name'=>'address2', 'placeholder'=>'Street Address Cont', 'value'=> set_value('address2'));
	$city		= array('id'=>'bill_city', 'class'=>'form-control', 'name'=>'city', 'placeholder'=>'City', 'value'=> set_value('city'));
	$zip		= array('id'=>'bill_zip', 'class'=>'form-control', 'name'=>'zip', 'placeholder'=>'Zip', 'value'=> set_value('zip'));
	
	
?>


<div class="main-page-title"><!-- start main page title -->
	<div class="container">
		<h4 class="register-title">Employer Registration</h4>
		<?php echo form_open('secure/register_employers', 'role="form"'); ?>
		<div class="row">
			<div class="col-md-5">
				
				<?php if ($this->session->flashdata('message')):?>
					<div class="alert alert-info">
						<a class="close" data-dismiss="alert">X</a>
						<?php echo $this->session->flashdata('message');?>
					</div>
				<?php endif;?>
				
				<?php if ($this->session->flashdata('error')):?>
					<div class="alert alert-error">
						<a class="close" data-dismiss="alert">X</a>
						<?php echo $this->session->flashdata('error');?>
					</div>
				<?php endif;?>
				
				<?php if (!empty($error)):?>
					<div class="alert alert-error">
						<a class="close" data-dismiss="alert">X</a>
						<?php echo $error;?>
					</div>
				<?php endif;?>
				
				<div class="form-regist-container">					
					<input type="hidden" name="submitted" value="submitted" />
					<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />					
								
						<h5>Complete this simple form to register:</h5>	
								
						<div class="form-group col-md-14">							
							<?php echo form_input($first);?>													
						</div>
								
						<div class="form-group col-md-14">							
							<?php echo form_input($last);?>													
						</div>		
									
						<div class="form-group col-md-14">
							<?php echo form_input($email);?>																					
						</div>														
						
						<div class="form-group col-md-14">
							<?php echo form_input($company);?>																					
						</div>	
						
						<div class="form-group col-md-14">
							<?php echo form_input($address1);?>																					
						</div>	
						
						<div class="form-group col-md-14">
							<?php echo form_input($address2);?>																					
						</div>
						
						<div class="form-group col-md-14">
							<label><?php echo lang('address_country');?></label>
							<?php echo form_dropdown('country_id', $countries_menu, set_value('country_id', $country_id), 'id="f_country_id" class="span12"');?>
						</div>
												
						<div class="form-group col-md-14">
							<label><?php echo lang('address_state');?></label></br>
							<?php echo form_dropdown('state_id', $zones_menu, set_value('state_id', $state_id), 'id="f_zone_id" class="span12"');?>
						</div>
						
						<div class="form-group col-md-14">
							<?php echo form_input($city);?>																					
						</div>	
						
						<div class="form-group col-md-14">
							<?php echo form_input($zip);?>																					
						</div>																														
						
						<div class="form-group col-md-14">
							<?php echo form_input($phone);?>							
						</div>
												
						<div class="form-group col-md-14">
							<input type="password" name="password" class="form-control" id="Password" placeholder="Password">														
						</div>
						
						<div class="form-group col-md-14">
							<input type="password" name="confirm" class="form-control" id="Password" placeholder="Confirm Password">														
						</div>
						
						<p><input type="checkbox" name="email_subscribe" value="1" checked="checked" /> <?php echo lang('account_newsletter_subscribe');?></p>
																																				
						<button class="btn btn-default btn-green">REGISTER</button>		
										
				</div>
				</form>
				
			</div>

			<div class="col-md-7 register">
				<h5>Already have an account? Log in Here.</h5>
				<a href="<?php echo site_url('secure/login')?>" class="btn btn-default btn-green btn-sm" >LOG IN</a>
				<div class="row">
					<div class="col-md-6">
						<ul class="style-list-2">
							<li><a href="<?php echo site_url('secure/register_jobseeker')?>">Job Seeker Register here</a></li>
						</ul>
					</div>					
				</div>
			</div>		
				
		</div>
	
			
	</div>
</div><!-- end main page title -->
