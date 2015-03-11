<div class="container">
	<div class="page-title">

		<?php echo form_open('search/homepage', 'role="form" id="application_form"'); ?>			
	
			<div class="job-side-wrap">
				<h4>Over 12 million candidates find their dream jobs</h4>
	
				<p>
					<a href="<?php echo site_url()?>" title="Job Board" rel="home"> <img
						src="<?php echo theme_img('logo_homepage.png')?>" alt="job board" />
					</a>
				</p>
	
				<p>
					<div class="col-md-4">
						&nbsp;
					</div>
				
					<div class="col-md-4">
						<select name="country" id='country' class="form-control">
							<?php foreach($countries as $country): ?>
							<option value="<?php echo $country->id ?>">
								<?php echo $country->name ?>
							</option>
							<?php endforeach;?>
						</select>
					</div>
					
					<div class="col-md-4">
						&nbsp;
					</div>
				</p>
	
	
				<p>				
					<input type="submit" name="submit" id="submit" value="Select Country" class="btn btn-blue">				
				</p>
	
	
			</div>
		</form>

	</div>
</div>



<div class="clearfix"></div>
