<?php

//set "code" for searches
if(!$name)
{
	$name = '';
}
else
{
	$name = '/'.$name;
}
function sort_url($lang, $by, $sort, $sorder, $name, $admin_folder)
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
		

	$return = site_url('/search/manage_application/'.$by.'/'.$sort.'/'.$name);
	
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
	
	<h4><i class="glyphicon glyphicon-briefcase"></i> MANAGE APPLICATION</h4>
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
					<?php echo form_open('/search/manage_application', 'class="form-inline" style="float:right"');?>
						<fieldset>						
							<input type="text" class="span2" name="term" placeholder="<?php echo lang('search_term');?>" value="<?php echo (!empty($term) && isset($term)) ? $term->term : ''?>" /> 
							<button class="btn btn-default btn-green" name="submit" value="search"><?php echo lang('search')?></button>
							<a class="btn btn-default btn-grey" href="<?php echo site_url('/search/manage_application');?>">Reset</a>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>		
	
<?php echo form_open('search/update_status_application', 'role="form" id="application_form"'); ?>	
	<div class="row">
		<div class="span12">
			<div class="row">				
				<div class="col-md-2">
					<select name="status" id='status' class="form-control">
					  <option value="">---Select Status---</option>
					  <option value="1">Pending</option>
					  <option value="2">Considering</option>
					  <option value="3">Contacted</option>
					  <option value="4">Interview Scheduled</option>
					  <option value="5">Not Interested</option>
					  <option value="6">Offered Made</option>
					  <option value="7">Offered Rejected</option>
					  <option value="8">Offered Accepted</option>
					</select><!-- &#039; is ' -->		
				</div>
			</div>
		</div>
	</div>		
	
	
	<div class="btn-group pull-right">			
	</div>
	
	<div id="tab-container" class='tab-container'><!-- Start Tabs -->
		
	<div class='panel-container'>
		
			<div id="all"><!-- Tabs section 1 -->
				<?php for($i=0; $i < sizeof($job_application); $i++): ?>	
				<div class="recent-job-list"><!-- Tabs content -->
						<div class="col-md-1 job-list-desc">
							<div class="checkbox">
						        <label>
						          <input name="applications[]" type="checkbox" value="<?php echo $job_application[$i]->application_id; ?>">
						        </label>
						    </div>
						</div>																	
						<div class="col-md-5 job-list-desc">
							<h6><?php echo $job_application[$i]->name?>
							(<?php echo $this->globals->application_status($job_application[$i]->application_active);?>)
							</h6>
						</div>
						<div class="col-md-3 job-list-location">
							<h6><i class="fa fa-user"><?php echo $job_application[$i]->job_title ?></i></h6>
						</div>
						<div class="col-md-3">
							<div class="row">
								<div class="col-md-7 job-list-type">
									<h6><i class="fa fa-clock-o"></i><?php echo $job_application[$i]->post_date ?></h6>									
								</div>																								
							</div>
						</div>

				<div class="clearfix"></div>
				</div><!-- Tabs content -->
				<?php endfor;?>															
			</div><!-- Tabs section 1 -->
				
		</div>
	</div><!-- end Tabs -->
<input type="hidden" class="span2" name="term" />
</form>		
	</div>
</div><!-- end Job -->