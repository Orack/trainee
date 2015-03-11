<div class="main-page-title"><!-- start main page title -->
	<div class="container">
		<div class="post-resume-page-title">Your application has been submitted! What's next?</div>		
	</div>
</div><!-- end main page title -->
<div class="recent-job"><!-- Start Job -->
<div class="container">
	<h4><i class="glyphicon glyphicon-briefcase"></i> RELATED JOBS</h4>
	<div id="tab-container" class='tab-container'><!-- Start Tabs -->
		<ul class='etabs clearfix'>
			<li class='tab'><a href="#all">All</a></li>
			<li class='tab'><a href="#contract">Contract</a></li>
			<li class='tab'><a href="#full">Full Time</a></li>
			<li class='tab'><a href="#free">Freelence</a></li>
		</ul>

		<div class='panel-container'>
			<div id="all"><!-- Tabs section 1 -->
			
				<?php for($i=0; $i < sizeof($all_jobs); $i++): ?>	
				
				<div class="recent-job-list"><!-- Tabs content -->
					<div class="col-md-1 job-list-logo">
						<img src="<?php echo base_url($all_jobs[$i]->logo)?>" class="img-responsive" alt="company-logo" />
					</div>

					<div class="col-md-5 job-list-desc">
						<h6><?php echo $all_jobs[$i]->job_title ?></h6>						
					</div>
					<div class="col-md-3 job-list-location">
						<h6><i class="fa fa-map-marker"></i><?php echo $all_jobs[$i]->state_name.', '.$all_jobs[$i]->country_name ?></h6>
					</div>
					<div class="col-md-3">
						<div class="row">
							<div class="col-md-7 job-list-type">
								<h6><i class="fa fa-user"></i><?php echo $all_jobs[$i]->position_type ?></h6>
							</div>
							<div class="col-md-5 job-list-button">								
								<a href="<?php echo site_url('search/job_detail/job/'.$all_jobs[$i]->id)?>" class="btn-view-job">View Job</a>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div><!-- Tabs content -->
				
				<?php endfor;?>

		
			</div><!-- Tabs section 1 -->
			<div id="contract"><!-- Tabs section 2 -->
			</div><!-- Tabs section 2 -->
			<div id="full"><!-- Tabs section 3 -->
			</div><!-- Tabs section 3 -->
			<div id="free"><!-- Tabs section 4 -->
			</div><!-- Tabs section 4 -->
		</div>
	</div><!-- end Tabs -->
	
	</div>
</div><!-- end Job -->
