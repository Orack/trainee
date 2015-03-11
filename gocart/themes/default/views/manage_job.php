<?php
//set "code" for searches
if(!$job_title)
{
	$job_title = '';
}
else
{
	$job_title = '/'.$job_title;
}
function sort_url($lang, $by, $sort, $sorder, $job_title, $admin_folder)
{
	if ($sort == $by)
	{
		if ($sorder == 'asc')
		{
			$sort	= 'desc';
			$icon	= ' <i class="icon-chevron-up"></i>';
		}
		else
		{
			$sort	= 'asc';
			$icon	= ' <i class="icon-chevron-down"></i>';
		}
	}
	else
	{
		$sort	= 'asc';
		$icon	= '';
	}
		

	$return = site_url('/search/manage_job/'.$by.'/'.$sort.'/'.$job_title);
	
	echo '<a href="'.$return.'">'.lang($lang).$icon.'</a>';

}

if(!empty($term)):
	$term = json_decode($term);	
	if(!empty($term->term)):?>
		<div class="alert alert-info">
			<?php echo sprintf(lang('search_returned'), intval($total));?>
		</div>
	<?php endif;?>
<?php endif;?>



<div class="recent-job"><!-- Start Job -->
	<div class="container">	
	
	<h4><i class="glyphicon glyphicon-briefcase"></i> MANAGE JOBS</h4>
	<div class="col-md-7 job-list-location">
		<h6><i class="fa fa-user"></i>Applications</h6>	
	</div>
	<div class="col-md-7 job-list-type">
		<h6><i class="fa fa-clock-o"></i>Date Posted</h6>	
	</div>
	
	<div class="row" style="margin-top:20px; margin-bottom:15px">
	      <div class='span6'>
	           <?php echo $this->pagination->create_links();?>&nbsp;
	      </div>
	</div>
			
	<div class="row">
		<div class="span12">
			<div class="row">
				<div class="span4">
					<?php echo $this->pagination->create_links();?>	&nbsp;
				</div>
				<div class="col-md-12">
					<?php echo form_open('/search/manage_job', 'class="form-inline" style="float:right"');?>
						<fieldset>						
							<input type="text" class="span2" name="term" placeholder="<?php echo lang('search_term');?>" value="<?php echo (!empty($term) && isset($term)) ? $term->term : ''?>" /> 
							<button class="btn btn-default btn-green" name="submit" value="search"><?php echo lang('search')?></button>
							<a class="btn btn-default btn-grey" href="<?php echo site_url('/search/manage_job');?>">Reset</a>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="btn-group pull-right">
	</div>
		
	<div id="tab-container" class='tab-container'><!-- Start Tabs -->
		
		<div class='panel-container'>
			<div id="all"><!-- Tabs section 1 -->
				<?php for($i=0; $i < sizeof($job_posts); $i++): ?>	
				<div class="recent-job-list"><!-- Tabs content -->																									
						<div class="col-md-5 job-list-desc">
							<h6><?php echo $job_posts[$i]->job_title?></h6>							
							<h6>(<?php echo $this->globals->job_status($job_posts[$i]->active);?>)</h6>
						</div>
						<div class="col-md-3 job-list-location">
							<h6><i class="fa fa-user"></i>
							
							<?php if($job_posts[$i]->qty > 0){ 							
								$order_by 		= 'name'; 
								$sort_order		= 'asc'; 
								$name			= 0; 
								$page			= 0; 
								$rows			= 15; 								
							?>														
							
							<a href="<?php echo site_url('/search/manage_application/'.$order_by.'/'.$sort_order.'/'.$name.'/'.$page.'/'.$rows.'/'.$job_posts[$i]->post_job_id);?>" class="btn btn-default btn-red"><?php echo $job_posts[$i]->qty ?></a>
							
							<?php }else{ ?>
								<?php echo $job_posts[$i]->qty ?>
							<?php } ?>
							
							</h6>
						</div>
						<div class="col-md-3">
							<div class="row">
								<div class="col-md-7 job-list-type">
									<h6><i class="fa fa-clock-o"></i><?php echo $job_posts[$i]->post_date ?></h6>									
								</div>								
								<div class="col-md-4 job-list-button">										
									<a class="btn-view-job" href="<?php echo site_url('search/job_detail'.'/Details/'.$job_posts[$i]->id) ?> ">View</a>
								</div>								
							</div>
						</div>

				<div class="clearfix"></div>
				</div><!-- Tabs content -->
				<?php endfor;?>						
									
			</div><!-- Tabs section 1 -->
					
		</div>
	</div><!-- end Tabs -->
	</div>
</div><!-- end Job -->