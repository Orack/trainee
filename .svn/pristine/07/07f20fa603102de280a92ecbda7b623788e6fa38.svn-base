<div class="main-page-title"><!-- start main page title -->
	<div class="container">
		<h4 class="login-title">Log In</h4>
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
						
				<div class="form-singin-container">				
					
				
					<?php echo form_open('secure/login', 'class="form-horizontal" role="form"'); ?>
						<div class="form-group">
							<input type="email" name="email"  class="form-control input-form" placeholder="<?php echo lang('email');?>">
							<div class="singin-aksen"></div>
						</div>
						<div class="form-group">							
							<input type="password" name="password" class="form-control input-form" placeholder="<?php echo lang('password');?>" autocomplete="off">
							<div class="singin-aksen"></div>
							
							
							<label class="checkbox">
								<input name="remember" value="true" type="checkbox" />
								<?php echo lang('keep_me_logged_in');?>
							</label>
							
							
							<input type="submit" value="<?php echo lang('form_login');?>" class="btn btn-default btn-green"" name="submit"/>
							
							<!--  button class="btn btn-default btn-green">LOGIN</button -->
						</div>
						
						
						
						<input type="hidden" value="<?php echo $redirect; ?>" name="redirect"/>
						<input type="hidden" value="submitted" name="submitted"/>
					</form>
					
					<!--  forgot password -->
					<!--  button class="btn btn-default btn-green" href="<?php echo site_url('secure/forgot_password'); ?>"> <?php echo lang('forgot_password')?></button-->
										
				</div>
				
				
					
				
				
			</div>

			<div class="col-md-7 singin-page">
				<h5>Dont have account? Register Now</h5>				
				<a href="<?php echo site_url('secure/register_employers')?>" class="btn btn-default btn-blue btn-sm">REGISTER</a>				
				
			</div>
		</div>
	</div>
</div><!-- end main page title -->
