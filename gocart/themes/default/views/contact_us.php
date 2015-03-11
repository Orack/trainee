<div class="main-page-title"><!-- start main page title -->
	<div class="container">
		<div class="page-title">Contact Us</div>
	</div>
</div><!-- end main page title -->
<div id="page-content"><!-- start content -->
	<div class="content-about">
		<div class="container-fluid full">
			<div id="page">
				<div class="location"></div>
			</div>
		</div>
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
			<?php echo form_open('search/contact_us', 'class="contact" id="contact_form" name="contact_form"') ?>
				<div class="form-group col-md-6">
					<label>Name</label>
					<input type="text" class="form-control name" name="name" id="name" value="<?php echo set_value('name')?>">
				</div>

				<div class="form-group col-md-6">
					<label>Email</label>
					<input type="text" class="form-control email" name="email" id="email" value="<?php echo set_value('email')?>">
				</div>
				
				<div class="form-group col-md-12">
					<label>Subject</label>
					<input type="text" class="form-control subject" name="subject" id="subject" value="<?php echo set_value('subject')?>">
				</div>

				<div class="form-group col-md-12">
					<label>Message</label>
					<textarea class="form-control message" rows="8" id="message" name="message"><?php echo set_value('message')?></textarea>

					<input type="submit" name="submit" id="submit" value="SEND" class="btn btn-default btn-green" >
					
				</div>
				<div class="clearfix"></div>
				 <input type="hidden" value="submitted" name="submitted"/>	
			</form>

			<!--div class="spacer-2">&nbsp;</div>
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
			</div-->
			<div class="spacer-2">&nbsp;</div>
		</div>
		
		<!--div id="cs">
			<div class="container">
			<div class="spacer-1">&nbsp;</div>
				<h1>Hey Friends Any Quries?</h1>
				<p>

					At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt.

				</p>
				<h1 class="phone-cs">Call: 1 800 000 500</h1>
			</div>
		</div--><!-- CS -->
	</div><!-- end content -->
</div><!-- end page content -->