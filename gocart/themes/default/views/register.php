<?php
	$first		= array('id'=>'bill_firstname', 'class'=>'form-control', 'name'=>'firstname', 'placeholder'=>'First Name' ,'value'=> set_value('firstname'));
	$last		= array('id'=>'bill_lastname', 'class'=>'form-control', 'name'=>'lastname',  'placeholder'=>'Last Name', 'value'=> set_value('lastname'));
	$email		= array('type'=>'email', 'id'=>'bill_email', 'class'=>'form-control', 'name'=>'email', 'placeholder'=>'Email', 'value'=>set_value('email'));	
?>



<div class="main-page-title"><!-- start main page title -->
	<div class="container">
		<h4 class="register-title">Register</h4>
		<div class="row">
			<div class="col-md-5">
				<div class="form-regist-container">
					<?php echo form_open('secure/register', 'role="form"'); ?>
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
				<h5>Already A Member? Log in Here.</h5>
				<button class="btn btn-default btn-green">LOG IN</button>
				<div class="row">
					<div class="col-md-6">
						<ul class="style-list-2">
							<li>On the other hand, we denounce with </li>
							<li>Dislike men who are so beguiled and</li>
							<li>Charms of pleasure of the moment</li>
							<li>Duty through weakness of will, which is</li>
						</ul>
					</div>
					<div class="col-md-6">
						<ul class="style-list-2">
							<li>On the other hand, we denounce with </li>
							<li>Dislike men who are so beguiled and</li>
							<li>Charms of pleasure of the moment</li>
							<li>Duty through weakness of will, which is</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- end main page title -->

<div id="page-content"><!-- start content -->
	<div class="content-about">
	<div class="spacer-2">&nbsp;</div>
		<div class="row clearfix">
				<div class="col-md-6 about-post-resume">
					<h4>Post Your Resume</h4>
					<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias</p>
					<p><button class="btn btn-default btn-black">UPLOAD YOUR RESUME <i class="icon-upload white"></i></button></p>
				</div>
				<div class="col-md-6 about-post-job">
					<h4>Post Job Now</h4>
					<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias</p>
					<p><button class="btn btn-default btn-green">POST A JOB NOW</button></p>
				</div>
			</div>
		<div class="spacer-2">&nbsp;</div>

		<div id="cs"><!-- CS -->
			<div class="container">
			<div class="spacer-1">&nbsp;</div>
				<h1>Hey Friends Any Quries?</h1>
				<p>
					At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt.
				</p>
				<h1 class="phone-cs">Call: 1 800 000 500</h1>
			</div>
		</div><!-- CS -->
	</div><!-- end content -->
</div><!-- end page content -->