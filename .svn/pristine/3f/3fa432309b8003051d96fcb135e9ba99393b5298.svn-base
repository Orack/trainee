<?php 
	$countRow = 1;
?>

<div class="main-page-title"><!-- start main page title -->
	<div class="container">
		<div class="post-resume-page-title">My Skill</div>		
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
			<?php echo form_open('search/skill', 'id="skill_form"') ?>
				<div class="row">				
					<div class="col-xs-10">
						<label><h5>Professional Skills:</h5></label>					
					</div>
				</div>
				
				<div id="SkillTop">
				<?php
					if(isset($skills)){
						foreach($skills as $skill)
						{			
				?>
				<div id="SkillBoxDiv<?php echo $countRow?>" class="unique_skill_checking">
					<div class="row">
						<div class="col-xs-5">
							<label>Skill #<?php echo $countRow ?> :  </label>
				            <input type="text" name="skill_id[<?php echo $countRow?>]" id="skill_id<?php echo $countRow?>" value="<?php echo $skill['title'];?>" class="form-control" style="margin-bottom:15px;">
				        </div>
				        <div class="col-xs-5">    
				            <label>Level #<?php echo $countRow ?> :  </label>
				            <select name="level[<?php echo $countRow?>]" class="form-control" id="level_id<?php echo $countRow?>" style="margin-bottom:15px;">
							    <option value=""></option>
							    <option value="1" <?php echo $skill['level'] == 1 ? 'selected' : '' ?>>Basic</option>
							    <option value="2" <?php echo $skill['level'] == 2 ? 'selected' : '' ?>>Intermediate</option>
							    <option value="3" <?php echo $skill['level'] == 3 ? 'selected' : '' ?>>Advanced</option>							    
							</select>							
				        </div>
				        
				        <div class="col-xs-1">
				        	<input type="button" value="X" class="btn btn-default btn-green" id="<?php echo $countRow?>" onClick="doRemove(this)">
				        </div>    
				       	        
					</div>						
				</div>				
				<?php 	
						$countRow++;
						}																													
					}
				?>
								
				<div id="SkillBoxDiv<?php echo $countRow?>" class="unique_skill_checking">
					<div class="row" id="SkillGroup<?php echo $countRow?>">
							<div class="col-xs-5">
								<label>Skill #<?php echo $countRow?> :  </label>
					            <input type="text" name="skill_id[<?php echo $countRow?>]" id="skill_id<?php echo $countRow?>" value="<?php echo set_value('skill_id['.$countRow.']')?>" class="form-control" style="margin-bottom:15px;">
					        </div>
					        <div class="col-xs-5">    
					            <label>Level #<?php echo $countRow ?> :  </label>
					            <select name="level[<?php echo $countRow?>]" class="form-control" id="level_id<?php echo $countRow?>" style="margin-bottom:15px;">
								    <option value=""></option>
								    <option value="1">Basic</option>
								    <option value="2">Intermediate</option>
								    <option value="3">Advanced</option>							    
								</select>
					        </div>
					        
					        <div class="col-xs-1">					        						         	
					        	<input type="button" value="X" class="btn btn-default btn-green" id="<?php echo $countRow?>" onClick="doRemove(this)">					         	
					        </div>   				        
					</div>	
				</div>	
				
				<?php 									
					$qty_field = set_value('qty_field');					
					$qty_field_left = $qty_field - $countRow;
				
					if($qty_field_left > 0){
						for($i=0; $i < $qty_field_left; $i++){	
							$countRow++;											
				?>
					<div id="SkillBoxDiv<?php echo $countRow?>" class="unique_skill_checking">
						<div class="row" id="SkillGroup<?php echo $countRow?>">
								<div class="col-xs-5">
									<label>Skill #<?php echo $countRow?> :  </label>
						            <input type="text" name="skill_id[<?php echo $countRow?>]" id="skill_id<?php echo $countRow?>" value="<?php echo set_value('skill_id['.$countRow.']')?>" class="form-control" style="margin-bottom:15px;">
						        </div>
						        <div class="col-xs-5">    
						            <label>Level #<?php echo $countRow ?> :  </label>
						            <select name="level[<?php echo $countRow?>]" class="form-control" id="level_id<?php echo $countRow?>" style="margin-bottom:15px;">
									    <option value=""></option>
									    <option value="1">Basic</option>
									    <option value="2">Intermediate</option>
									    <option value="3">Advanced</option>							    
									</select>
						        </div>
						        
						        <div class="col-xs-1">					        						         	
						        	<input type="button" value="X" class="btn btn-default btn-green" id="<?php echo $countRow?>" onClick="doRemove(this)">					         	
						        </div>   				        
						</div>	
					</div>	
				<?php 
						}
					}
				?>
										
				
				</div>
				
				<?php 				
					//set session for footer:
					$dataPassing[] = array();
					$dataPassing['countRow'] = $countRow;				
					$this->session->set_userdata($dataPassing);
				?>
				
				<div class="row">	
					<div class="col-md-7">					               
						<input class="span2 btn" id="addButton" type="button" value="+ More Field"/>
						<input type="hidden" name="qty_field" class="qty_field" value="<?php echo $countRow?>"> 
						<input type="button" value="Submit" id="submit_skill" class="btn btn-default btn-red">
				  	</div>				  
				</div>  						
				
								
			
			</form>
			<div class="spacer-2">&nbsp;</div>
			

		</div>

		<div class="col-md-4">
			
			<div class="job-side-wrap">
				<h4>Post Your Resume</h4>
				<p>
					Upload your resume in PDF, Word or text format.
				</p>
				<p class="centering"><button class="btn btn-default btn-black">UPLOAD YOUR RESUME <i class="icon-upload white"></i></button></p>
			</div>

		</div>
	</div>
	
</div>




