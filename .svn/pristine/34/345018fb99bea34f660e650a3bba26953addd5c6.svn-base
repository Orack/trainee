<?php
	$first		= array('id'=>'bill_firstname', 'class'=>'form-control', 'name'=>'firstname', 'placeholder'=>'First Name' ,'value'=> set_value('firstname'));
	$last		= array('id'=>'bill_lastname', 'class'=>'form-control', 'name'=>'lastname',  'placeholder'=>'Last Name', 'value'=> set_value('lastname'));
	$email		= array('type'=>'email', 'id'=>'bill_email', 'class'=>'form-control', 'name'=>'email', 'placeholder'=>'Email', 'value'=>set_value('email'));	
?>



<div class="main-page-title"><!-- start main page title -->
	<div class="container">
		<h4 class="register-title">Job Seeker Register</h4>
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
					<?php echo form_open('secure/register_jobseeker', 'role="form"'); ?>
					<input type="hidden" name="submitted" value="submitted" />
					<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
					
	
						<div class="form-group">
							<?php echo form_input($first);?>																			
						</div>

						<div class="form-group">
							<?php echo form_input($last);?>																			
						</div>
						
						<div class="form-group">
							<?php echo form_input($email);?>																			
						</div>
						
						<div class="form-group col-md-14">
							<input type="password" name="password" class="form-control" id="Password" placeholder="Password">														
						</div>
						
						<div class="form-group col-md-14">
							<input type="password" name="confirm" class="form-control" id="Password" placeholder="Confirm Password">														
						</div>
						
						<p><input type="checkbox" name="email_subscribe" value="1" checked="checked" /> <?php echo lang('account_newsletter_subscribe');?></p>
						

						<div class="form-group">							
							<button class="btn btn-default btn-green">REGISTER</button>
						</div>
					</form>
				</div>
			</div>

			<div class="col-md-7 register">
				<h5>Already have an account? Log in Here.</h5>
				<a href="<?php echo site_url('secure/login')?>" class="btn btn-default btn-green btn-sm" >LOG IN</a>
				<div class="row">
					<div class="col-md-6">
						<ul class="style-list-2">
							<li><a href="<?php echo site_url('secure/register_employers')?>">Employer Register here</a></li>
						</ul>
					</div>					
				</div>
			</div>		
		</div>
	</div>
</div><!-- end main page title -->
