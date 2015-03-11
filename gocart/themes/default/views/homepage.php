
<!-- start main-headline section -->
<!-- 
<div class="main-slider">
	<div class="slider-nav">
		<a class="slider-prev"><i class="fa fa-chevron-circle-left"></i></a>
		<a class="slider-next"><i class="fa fa-chevron-circle-right"></i></a>
	</div>
	<div id="home-slider" class="owl-carousel owl-theme">
		<div class="item-slide">
			<img src="<?php echo theme_img('upload/business-group.jpg')?>" class="img-responsive" alt="dummy-slide" />
		</div>
		<!--div class="item-slide">
			<img src="<?php echo theme_img('upload/business-group2.jpg')?>" class="img-responsive" alt="dummy-slide" />
		</div-->
	</div>
</div><!-- end main-headline section -->

<!-- start headline section -->
<!--
<div class="headline container">
		<div class="row" >
		<?php echo form_open('search/job_search', 'role="form"'); ?>
			<div class="col-md-5 align-left">
				<label for="searchjob" class="label">Search</label>													
				<input type="text" id="searchjob" name="job_title" class="input-job" placeholder="Keywords (IT Engineer, Shop Manager, Hr Manager...)">
								
			</div>
			<div class="col-md-5 align-right">
				<label for="searchplace" class="label">Location</label>
				<input type="text" id="searchplace" name="location" class="input-location" placeholder="Kuala Lumpur, Penang, Johor Bharu, Ipoh etc.">								
			</div>
			
			<div class="col-md-2 align-right">
				<label for="searchplace" class="label"><p></br></p></label>
				<input type="submit" value="Search" class="btn btn-default btn-blue btn-lg">
			</div>
			<div class="clearfix"></div>
		</form>
		</div>
</div><!-- end headline section -->

<div class="job-finder"><!-- start job finder -->
	<div class="container">
		<p>&nbsp;</p>		
		<?php echo form_open('search/job_search_indeed', 'role="form"'); ?>
		
			<div class="col-md-4">
				</br>
			</div>
		
			<div class="col-md-5">
				<a href="<?php echo site_url('search/homepage')?>" title="Job Board" rel="home">
					<img class="main-logo" src="<?php echo theme_img('logo_homepage.png')?>" alt="job board" />
				</a>
				<?php echo $this->session->userdata('user_country_name');?>
			</div>	
			
			<p>&nbsp;</p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>					
						
			<div class="row form-group">
				<div class="form-group">
					<div class="col-md-5">
						<label for="searchjob" class="label">Keywords</label>
						<input type="text" id="searchjob" name="job_title" class="input-job" placeholder="Keywords (IT Engineer, Shop Manager, Hr Manager...)">
					</div>
					
					<div class="col-md-5">
						<label for="searchplace" class="label">Location</label>
						<input type="text" id="searchplace" name="location" class="input-location" placeholder="Kuala Lumpur, Penang, Johor Bharu, Ipoh etc.">
					</div>
					
					<!--div class="col-md-5">
						<label for="experiences" class="label">Experiences</label>
						<select class="form-control input-experience" name="experience" id="job_category">
						    <optgroup label="--Select Experience--">					    
							    <?php for($i = 1; $i <= 45; $i++):?>
							    	<option value="<?php echo $i ?>"><?php echo $i ?></option>
							    <?php endfor;?>
						    </optgroup>
						</select>
					</div-->
					
					
					<div class="col-md-2">
						<label for="searchplace" class="label"></br></label>
						<input type="submit" value="Search" class="btn btn-default btn-green">
					</div>
					
					
				</div>
			</div>		
						
		</form>
	</div>
</div><!-- end job finder -->


<!--div class="table-responsive">
  <table class="table table-responsive">
  	<tr>
  		<td>123444444444444444444444444444444444444</td>
  		<td>456444444444444444444444444444</td>
  		<td>75644444444444444444444</td>
  	</tr>
  </table>
</div-->

<!--div class="testimony">
	<div class="container">
		<h1>What People Say About Us</h1>
		<p>
			At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas mo
		</p>
			
	</div>
	<div id="sync2" class="owl-carousel">
		<div class="testimony-image">
			<img src="<?php echo theme_img('upload/dummy-testimony.png')?>" class="img-responsive" alt="summy-testimony" />
		</div>
		<div class="testimony-image">
			<img src="<?php echo theme_img('upload/dummy-testimony.png')?>" class="img-responsive" alt="summy-testimony" />
		</div>
		<div class="testimony-image">
			<img src="<?php echo theme_img('upload/dummy-testimony.png')?>" class="img-responsive" alt="summy-testimony" />
		</div>
		<div class="testimony-image">
			<img src="<?php echo theme_img('upload/dummy-testimony.png')?>" class="img-responsive" alt="summy-testimony" />
		</div>
		<div class="testimony-image">
			<img src="<?php echo theme_img('upload/dummy-testimony.png')?>" class="img-responsive" alt="summy-testimony" />
		</div>
		<div class="testimony-image">
			<img src="<?php echo theme_img('upload/dummy-testimony.png')?>" class="img-responsive" alt="summy-testimony" />
		</div>
		<div class="testimony-image">
			<img src="<?php echo theme_img('upload/dummy-testimony.png')?>" class="img-responsive" alt="summy-testimony" />
		</div>
		<div class="testimony-image">
			<img src="<?php echo theme_img('upload/dummy-testimony.png')?>" class="img-responsive" alt="summy-testimony" />
		</div>
		<div class="testimony-image">
			<img src="<?php echo theme_img('upload/dummy-testimony.png')?>" class="img-responsive" alt="summy-testimony" />
		</div>
		<div class="testimony-image">
			<img src="<?php echo theme_img('upload/dummy-testimony.png')?>" class="img-responsive" alt="summy-testimony" />
		</div>
		
	</div>
	
	<div id="sync1" class="owl-carousel">
		<div class="testimony-content container">
			<p>
				"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum .
				
			</p>
			<p>
				John Grasin, CEO, IT-Planet
			</p>
			<div class="media-testimony">
				<a href="" target="blank"><i class="fa fa-twitter twit"></i></a>
				<a href="" target="blank"><i class="fa fa-linkedin linkedin"></i></a>
				<a href="" target="blank"><i class="fa fa-facebook fb"></i></a>
			</div>
		</div>
		<div class="testimony-content container">
			<p>
				"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum .
				
			</p>
			<p>
				John Grasin, CEO, IT-Planet
			</p>
			<div class="media-testimony">
				<a href="" target="blank"><i class="fa fa-twitter twit"></i></a>
				<a href="" target="blank"><i class="fa fa-linkedin linkedin"></i></a>
				<a href="" target="blank"><i class="fa fa-facebook fb"></i></a>
			</div>
		</div>
		<div class="testimony-content container">
			<p>
				"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum .
				
			</p>
			<p>
				John Grasin, CEO, IT-Planet
			</p>
			<div class="media-testimony">
				<a href="" target="blank"><i class="fa fa-twitter twit"></i></a>
				<a href="" target="blank"><i class="fa fa-linkedin linkedin"></i></a>
				<a href="" target="blank"><i class="fa fa-facebook fb"></i></a>
			</div>
		</div>
		<div class="testimony-content container">
			<p>
				"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum .
				
			</p>
			<p>
				John Grasin, CEO, IT-Planet
			</p>
			<div class="media-testimony">
				<a href="" target="blank"><i class="fa fa-twitter twit"></i></a>
				<a href="" target="blank"><i class="fa fa-linkedin linkedin"></i></a>
				<a href="" target="blank"><i class="fa fa-facebook fb"></i></a>
			</div>
		</div>
		<div class="testimony-content container">
			<p>
				"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia.
				
			</p>
			<p>
				John Grasin, CEO, IT-Planet
			</p>
			<div class="media-testimony">
				<a href="" target="blank"><i class="fa fa-twitter twit"></i></a>
				<a href="" target="blank"><i class="fa fa-linkedin linkedin"></i></a>
				<a href="" target="blank"><i class="fa fa-facebook fb"></i></a>
			</div>
		</div>
		<div class="testimony-content container">
			<p>
				"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate.
				
			</p>
			<p>
				John Grasin, CEO, IT-Planet
			</p>
			<div class="media-testimony">
				<a href="" target="blank"><i class="fa fa-twitter twit"></i></a>
				<a href="" target="blank"><i class="fa fa-linkedin linkedin"></i></a>
				<a href="" target="blank"><i class="fa fa-facebook fb"></i></a>
			</div>
		</div>
		<div class="testimony-content container">
			<p>
				"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum .
				
			</p>
			<p>
				John Grasin, CEO, IT-Planet
			</p>
			<div class="media-testimony">
				<a href="" target="blank"><i class="fa fa-twitter twit"></i></a>
				<a href="" target="blank"><i class="fa fa-linkedin linkedin"></i></a>
				<a href="" target="blank"><i class="fa fa-facebook fb"></i></a>
			</div>
		</div>
		<div class="testimony-content container">
			<p>
				"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum . At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum .
				
			</p>
			<p>
				John Grasin, CEO, IT-Planet
			</p>
			<div class="media-testimony">
				<a href="" target="blank"><i class="fa fa-twitter twit"></i></a>
				<a href="" target="blank"><i class="fa fa-linkedin linkedin"></i></a>
				<a href="" target="blank"><i class="fa fa-facebook fb"></i></a>
			</div>
		</div>
		<div class="testimony-content container">
			<p>
				"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti.	
			</p>
			<p>
				John Grasin, CEO, IT-Planet
			</p>
			<div class="media-testimony">
				<a href="" target="blank"><i class="fa fa-twitter twit"></i></a>
				<a href="" target="blank"><i class="fa fa-linkedin linkedin"></i></a>
				<a href="" target="blank"><i class="fa fa-facebook fb"></i></a>
			</div>
		</div>
		<div class="testimony-content container">
			<p>
				"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.
				
			</p>
			<p>
				John Grasin, CEO, IT-Planet
			</p>
			<div class="media-testimony">
				<a href="" target="blank"><i class="fa fa-twitter twit"></i></a>
				<a href="" target="blank"><i class="fa fa-linkedin linkedin"></i></a>
				<a href="" target="blank"><i class="fa fa-facebook fb"></i></a>
			</div>
		</div>
	</div>
</div-->

<div id="step-to">
	<div class="container">
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</div>
</div>

<!--div class="step-to">
	<div class="container">
		<h1>Easiest Way To Use</h1>
		<p>
			Fresh Graduate are the best way for students to gain the work experience necessary to find a job after graduation. These are easy way to get a full time job offer after successful completion of the program.
		</p>

		<div class="step-spacer"></div>
		<div id="step-image">
			<div class="step-by-container">
				<div class="step-by">
					First Step
					<div class="step-by-inner">
						<div class="step-by-inner-img">
							<a href="<?php echo site_url('secure/register_jobseeker')?>"><img src="<?php echo theme_img('step-icon-1.png')?>" alt="step" /></a>
						</div>
					</div>
					<h5>Register with us</h5>
				</div>
						
				<div class="step-by">
					Second Step
					<div class="step-by-inner">
						<div class="step-by-inner-img">
							<a href="<?php echo site_url('secure/register_jobseeker')?>"><img src="<?php echo theme_img('step-icon-2.png')?>" alt="step" /></a>
						</div>
					</div>
					<h5>Create your profile</h5>
				</div>
						
				<div class="step-by">
					Third Step
					<div class="step-by-inner">
						<div class="step-by-inner-img">
							<a href="<?php echo site_url('secure/register_jobseeker')?>"><img src="<?php echo theme_img('step-icon-3.png')?>" alt="step" /></a>
						</div>
					</div>
					<h5>Upload your resume</h5>
				</div>
						
				<div class="step-by">
					Now it's our turn
					<div class="step-by-inner">
						<div class="step-by-inner-img">
							<img src="<?php echo theme_img('step-icon-4.png')?>" alt="step" />
						</div>
					</div>
					<h5>Now take rest :)</h5>
				</div>
						
			</div>
		</div>
		<div class="step-spacer"></div>
	</div>
</div-->

<!--div id="company-post">
	<div class="container">
		
		<h1>Companies Who Have Posted Jobs</h1>
		<p>
			At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi.
		</p>
			
		<div id="company-post-list" class="owl-carousel company-post">
			<div class="company">
				<img src="<?php echo theme_img('upload/logo-1.jpg')?>" class="img-responsive" alt="company-post" />
			</div>
			<div class="company">
				<img src="<?php echo theme_img('upload/logo-2.jpg')?>" class="img-responsive" alt="company-post" />
			</div>
			<div class="company">
				<img src="<?php echo theme_img('upload/logo-3.jpg')?>" class="img-responsive" alt="company-post" />
			</div>
			<div class="company">
				<img src="<?php echo theme_img('upload/company-4.png')?>" class="img-responsive" alt="company-post" />
			</div>
			<div class="company">
				<img src="<?php echo theme_img('upload/company-5.png')?>" class="img-responsive" alt="company-post" />
			</div>			
			<div class="company">
				<img src="<?php echo theme_img('upload/company-1.png')?>" class="img-responsive" alt="company-post" />
			</div>
			<div class="company">
				<img src="<?php echo theme_img('upload/company-2.png')?>" class="img-responsive" alt="company-post" />
			</div>
			<div class="company">
				<img src="<?php echo theme_img('upload/company-3.png')?>" class="img-responsive" alt="company-post" />
			</div>
			<div class="company">
				<img src="<?php echo theme_img('upload/company-4.png')?>" class="img-responsive" alt="company-post" />
			</div>
			<div class="company">
				<img src="<?php echo theme_img('upload/company-5.png')?>" class="img-responsive" alt="company-post" />
			</div>			
		</div>
	</div>
</div-->



