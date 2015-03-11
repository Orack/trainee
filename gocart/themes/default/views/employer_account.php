<?php	
	$first		= array('id'=>'bill_firstname', 'class'=>'form-control', 'name'=>'firstname', 'placeholder'=>'First Name' ,'value'=> set_value('firstname', $customer['firstname']));
	$last		= array('id'=>'bill_lastname', 'class'=>'form-control', 'name'=>'lastname',  'placeholder'=>'Last Name', 'value'=> set_value('lastname', $customer['lastname']));
	$email		= array('id'=>'bill_email', 'class'=>'form-control', 'name'=>'email', 'placeholder'=>'Email', 'value'=>set_value('email', $customer['email']));
		
	$company	= array('id'=>'bill_company', 'class'=>'form-control', 'name'=>'company', 'placeholder'=>'Company', 'value'=> set_value('company', $customer['company']));
	$phone		= array('id'=>'bill_phone', 'class'=>'form-control', 'name'=>'phone', 'placeholder'=>'Phone', 'value'=> set_value('phone', $customer['phone']));
		
	$address1	= array('id'=>'bill_address1', 'class'=>'form-control', 'name'=>'address1', 'placeholder'=>'Street Address', 'value'=> set_value('address1', $customer['address1']));
	$address2	= array('id'=>'bill_address2', 'class'=>'form-control', 'name'=>'address2', 'placeholder'=>'Street Address Cont', 'value'=> set_value('address2', $customer['address2']));
	$city		= array('id'=>'bill_city', 'class'=>'form-control', 'name'=>'city', 'placeholder'=>'City', 'value'=> set_value('city', $customer['city']));
	$zip		= array('id'=>'bill_zip', 'class'=>'form-control', 'name'=>'zip', 'placeholder'=>'Zip', 'value'=> set_value('zip', $customer['postcode']));			

	$facebook_account	= array('id'=>'facebook_account', 'class'=>'form-control', 'name'=>'facebook_account', 'placeholder'=>'Facebook Account', 'value'=> set_value('facebook_account', $customer['facebook_account']));
	$twitter_account	= array('id'=>'twitter_account', 'class'=>'form-control', 'name'=>'twitter_account', 'placeholder'=>'Twitter Account', 'value'=> set_value('twitter_account', $customer['twitter_account']));
	$google_account		= array('id'=>'google_account', 'class'=>'form-control', 'name'=>'google_account', 'placeholder'=>'Google Account', 'value'=> set_value('google_account', $customer['google_account']));
	$website			= array('id'=>'website', 'class'=>'form-control', 'name'=>'website', 'placeholder'=>'Website', 'value'=> set_value('website', $customer['website']));
	
?>

		<div class="main-page-title"><!-- start main page title -->
			<div class="container">
				<h4 class="register-title">Employer Account</h4>
				<div class="row">
						<div class="col-lg-7 register">							
							<div class="form-regist-details-container">
								<h4>User Information</h4>				
								
								<a href="<?php echo site_url('secure/change_password')?>" class="btn btn-default btn-green">Change Password</a>
								
								<?php echo form_open('secure/update_employer', 'role="form"'); ?>
								
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
									
									<div class="row form-group">
										<div class="form-group">
											<div class="col-md-7">
												<p class="form-group"><label><?php echo lang('address_country');?></label></p>
												<?php echo form_dropdown('country_id', $countries_menu, set_value('country_id', $country_id), 'id="f_country_id" class="form-control" ');?>
											</div>
						
											<div class="col-md-5">
												<p class="form-group"><label><?php echo lang('address_state');?></label></p>
												<?php echo form_dropdown('state_id', $zones_menu, set_value('state_id', $state_id), 'id="f_zone_id" class="form-control"');?>
											</div>
										</div>	
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
										<?php echo form_input($facebook_account);?>							
									</div>	
									
									<div class="form-group col-md-14">
										<?php echo form_input($twitter_account);?>							
									</div>
									
									<div class="form-group col-md-14">
										<?php echo form_input($google_account);?>							
									</div>
									
									<div class="form-group col-md-14">
										<?php echo form_input($website);?>							
									</div>
									
									<p><input type="checkbox" name="email_subscribe" value="1"  <?php echo $customer['email_subscribe'] == 1 ? 'checked' : ''  ?> checked="checked" /> <?php echo lang('account_newsletter_subscribe');?></p>
									
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
		
		