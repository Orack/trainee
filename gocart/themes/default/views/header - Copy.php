<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><?php echo (!empty($seo_title)) ? $seo_title .' - ' : ''; echo $this->config->item('company_name'); ?></title>


<?php if(isset($meta)):?>
	<?php echo $meta;?>
<?php else:?>
<meta name="Keywords" content="jobs in world wide, malaysia, jobs, IT jobs, HR jobs, finance jobs, sales jobs, marketing jobs, engineering jobs, customer service jobs, accounting jobs, management jobs, legal jobs, business development, HR, career resource,  career, create resume, education career, employer, employment, employment opportunity, employment asia,  find job, free job posting,  it recruitment, human resource, internet recruitment, jawatan kosong, jobspeer, job, job interview, job listing, job site, job vacancy, job opening, job placement, job opportunity, job seeker, job tips,  job alert,  job online, job search,online job search, online recruitment,  post advertisement, recruitment, recruitment agency, resume, resume service, kuala lumpur, Job Opportunities, Fresher Jobs, Job Vacancy, Submit Resume, job vacancies, sales jobs.">
<meta name="Description" content="Search thousands of Jobs in World Wide at JobsPeer.com. Find new employment in world wide world. Employers, advertise jobs and find resumes here.">
<?php endif;?>

<link rel="shortcut icon" href="<?php echo theme_img('favicon.ico')?>"/>


<!-- Bootstrap -->
<?php echo bootstrap_css('bootstrap.min.css', true);?>
<!-- Bootstrap -->

<!-- Main Style -->
<?php echo theme_css('style.css', true);?>
<!-- Main Style -->

<!-- fonts -->
<link href='http://fonts.googleapis.com/css?family=Nunito:300,400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,500,600,700' rel='stylesheet' type='text/css'>
<?php echo font_css('font-awesome.css', true);?>
<!-- fonts -->

<!-- Owl Carousel -->
<?php echo theme_css('owl.carousel.css', true);?>
<?php echo theme_css('owl.theme.css', true);?>
<?php echo theme_css('owl.transitions.css', true);?>
<!-- Owl Carousel -->

<!-- Form Slider -->
<?php echo theme_css('jslider.css', true);?>
<?php echo theme_css('jslider.round.css', true);?>	
<!-- Form Slider -->


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->


<?php
//with this I can put header data in the header instead of in the body.
if(isset($additional_header_info))
{
	echo $additional_header_info;
}

?>

<?php 
	$customer = $this->go_cart->customer();	
?>
</head>

<body>
	<div id="wrapper"><!-- start main wrapper -->
	<div id="header"><!-- start main header -->
			<div class="top-line">&nbsp;</div>
			<div class="top"><!-- top -->
				<div class="container">
					<div class="media-top-right">
						<ul class="media-top clearfix">
							<!--li><a href="<?php echo site_url('about_us')?>" class="btn btn-default btn-grey btn-sm">About</a></li>
							<li><a href="<?php echo site_url('contact_us')?>" class="btn btn-default btn-grey btn-sm">Contact</a></li-->
						</ul>						
						
						<!--ul class="media-top clearfix">
							<li class="item"><a href="" target="blank"><i class="fa fa-twitter"></i></a></li>
							<li class="item"><a href="" target="blank"><i class="fa fa-facebook"></i></a></li>
							<li class="item"><a href="" target="blank"><i class="fa fa-linkedin"></i></a></li>
							<li class="item"><a href="" target="blank"><i class="fa fa-rss"></i></a></li>
							<li class="item"><a href="" target="blank"><i class="fa fa-google-plus"></i></a></li>
						</ul-->
						
						<?php if(!isset($customer) || !$customer){?>
							<ul class="media-top-2 clearfix">
								<li><a href="<?php echo site_url('secure/register_jobseeker')?>" class="btn btn-default btn-blue btn-sm">Job Seeker</a></li>
								<li><a href="<?php echo site_url('secure/register_employers')?>" class="btn btn-default btn-blue btn-sm">Employer</a></li>
								<li><a href="<?php echo site_url('secure/login')?>" class="btn btn-default btn-green btn-sm" >LOG IN</a></li>
								<li><a href="<?php echo site_url('secure/register_employers')?>" class="btn btn-default btn-red btn-sm" >REGISTRATION</a></li>											
							</ul>
						<?php }else{?>
							<ul class="media-top-2 clearfix">
								<li><a href="<?php echo site_url('secure/logout')?>" class="btn btn-default btn-red btn-sm">LOG OUT</a></li>																			
							</ul>
						<?php }?>
						
						<div class="clearfix"></div>
					</div>
				</div>
			</div><!-- top -->
			<div class="container"><!-- container -->
				<div class="row">
					<div class="col-md-4"><!-- logo -->
						<a href="<?php echo site_url()?>" title="Job Board" rel="home">
							<img class="main-logo" src="<?php echo theme_img('logo.png')?>" alt="job board" />
						</a>
					</div><!-- logo -->
					<div class="col-md-8 main-nav"><!-- Main Navigation -->
						<a id="touch-menu" class="mobile-menu" href="#"><i class="fa fa-bars fa-2x"></i></a>
						<nav>
							<ul class="menu">
								<li><a href="<?php echo site_url()?>">HOME</a></li>
																
								<?php if(!$customer){?>									
									<!--li><a href="<?php echo site_url('secure/register_employers')?>">Employers</a></li-->
									<li> <a href="<?php echo site_url('job_search')?>">Search Job</a></li>								
								<?php }else{?>								
									<?php if($this->go_cart->customer('type') == 'E'){ ?>										
										<li><a  href="<?php echo site_url('post_job');?>">POST A JOB</a></li>
										<li><a href="<?php echo site_url('manage_job')?>">My Applications</a>
											<ul class="sub-menu">																								
											  		<li><a href="<?php echo site_url('manage_job')?>">MANAGE JOB</a></li>										  	
											  		<li><a href="<?php echo site_url('manage_application')?>">MANAGE APPLICATIONS</a></li>										  	                            			  	
											</ul>
										</li>
										<!--li> <a href="#">Search Resume</a></li-->
										<!--li><a href="<?php echo site_url('candidate_search')?>">CANDIDATE SEARCH</a></li-->
										
									<?php }else{?>
										<li><a href="<?php echo site_url('job_search')?>">JOB SEARCH</a></li>
										<!--li><a  href="<?php echo site_url('post_resume');?> ">POST A RESUME</a></li-->
										<li><a  href="<?php echo site_url('my_resume');?> ">MY RESUME</a></li>
									<?php }?>																
								
								<?php }?>
									
								<?php if($customer){?>																																								
								<li><a href="#">My Account</a>
									<ul class="sub-menu">
										  <?php if($this->go_cart->customer('type') == 'E'){ ?>
										  		<li><a href="<?php echo site_url('secure/employer_account')?>">Setting</a></li>
										  <?php }else if($this->go_cart->customer('type') == 'J'){ ?>										  		
										  		<li><a href="<?php echo site_url('secure/jobseeker_account')?>">Setting</a></li>
										  <?php }?>
                            			  <li><a href="#">My Preference</a></li>
                            			      																																																	
									</ul>
								</li>
								<?php }?>
								
								<!--li><a  href="<?php echo site_url('short_code');?>">SHORTCODE</a></li-->
							</ul>
						</nav>
					</div><!-- Main Navigation -->
					<div class="clearfix"></div>
				</div>
			</div><!-- container -->
	</div><!-- end main header -->
		
		

<?php
/*
End header.php file
*/