<?php 
	$personal	= array('id'=>'personal_message', 'class'=>'form-control', 'name'=>'personal_message', 'placeholder'=>'Personal Message');
?>

<div class="main-page-title"><!-- start main page title -->
	<div class="container">
		<div class="post-resume-page-title"><?php echo $job->job_title ?> (<?php echo $job->job_category ?>) </div>		
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
			<?php echo form_open('search/application_submit', 'role="form" class="post-resume-form'); ?>
			
				<h1>Application</h1>
				<p>
					<b style="color:blue;">Company Location</b>: <?php echo $job->city ?>
				</p>
				<p>
					<b style="color:blue;">Position</b>: <?php echo $job->position_type ?>
				</p>
								
				<p>
					When you apply, the employer will see your personal message and your live profile. Make sure your profile is ready!
				</p>
				<p>&nbsp;</p>
				<p>Add a personal message to introduce yourself. If you have a cover letter, paste it here.</p>																		
				<?php echo form_input($personal)?>
				<p>
				This is your first chance to stand out and capture the employer's attention. Introduce yourself and briefly state your reason for applying to this internship. Mention any other information that may be relevant to the employer, including if you are willing to relocate.
				</p>
				
				<input type="hidden" value="<?php echo $job->id ?>" name="job_id">				
				<input type="submit" value="Submit Application" class="btn-apply-job">							
			</form>
			<div class="spacer-2">&nbsp;</div>
		</div>

		<div class="col-md-4">
			
			<div class="job-side-wrap">
				<h4>Update Your Resume</h4>
				<p>
					You can now apply to internships and be found by employers. Add more details to stand out from the crowd.
				</p>
				<p class="centering"><a href="<?php echo site_url('my_resume')?>" class="btn btn-default btn-black">Update Your Resume <i class="icon-upload white"></i></a></p>
			</div>

		</div>
	</div>
	
</div>
