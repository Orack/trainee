<div id="page-content">
	<!-- start content -->
	<div class="container">

		<div class="row">

			<div class="col-md-9">

				<div class="row">
					<?php echo form_open('search/job_search_indeed', 'role="form"'); ?>
					<div class="col-md-2 col-sm-3">

						<!--  label for="searchjob" class="label">Filter</label-->
					</div>
					<!-- /.col -->
					</form>

					<div class="col-md-10 col-sm-9">
						</br>

						<p class="grey_colour">
							<?php echo $paginated_result?>
						</p>

						<?php echo $this->pagination->create_links();?>
						&nbsp;

						<?php if(!empty($all_jobs) && isset($all_jobs)): ?>
						<?php for($i=0; $i < sizeof($all_jobs); $i++): ?>

						<div class="result">
							<h5>
								<a href="javascript:;" title=""><a
									href="<?php echo site_url('search/job_detail/job/'.$all_jobs[$i]->id)?>"><?php echo $all_jobs[$i]->job_title ?>
								</a>
							
							</h5>
							<span class="dark_grey_colour"><?php echo $all_jobs[$i]->company ?>
								- <i class="fa fa-map-marker"></i> <?php echo $all_jobs[$i]->state_name.', '.$all_jobs[$i]->country_name ?>
							</span></br> <span> <?php echo character_limiter($all_jobs[$i]->description,200); ?>
								&nbsp;&nbsp;
							</span> </br>

							<?php 									
							$time = strtotime($all_jobs[$i]->post_date);
							?>
							<span class="grey_colour"><?php echo $this->globals->humanTiming($time).' ago';?>
							</span> - <a class="small_grey_colour">Share Job</a> - <a
								class="small_grey_colour">Save Job</a>
							<p>&nbsp;</p>
						</div>
						<?php endfor; ?>

						<?php echo $this->pagination->create_links();?>
						&nbsp;

						<?php else: ?>

						<hr>
						<p>No records found!</p>

						<?php endif;?>
					</div>

				</div>

			</div>



		</div>
		<!-- /.row -->


		<span id=indeed_at><a href="http://www.indeed.com/">jobs</a> by <a
			href="http://www.indeed.com/" title="Job Search"><img
				src="http://www.indeed.com/p/jobsearch.gif"
				style="border: 0; vertical-align: middle;" alt="Indeed job search">
		</a> </span>


	</div>

</div>

