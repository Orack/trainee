<?php if(validation_errors()):?>
<div class="alert allert-error">
	<a class="close" data-dismiss="alert">X</a>
	<?php echo validation_errors();?>
</div>
<?php endif;?>

<?php
$first		= array('id'=>'firstname', 'class'=>'form-control', 'name'=>'firstname', 'placeholder'=>'First Name' , 'value'=> set_value('firstname', $customer['firstname']));
$last		= array('id'=>'lastname', 'class'=>'form-control', 'name'=>'lastname', 'placeholder'=>'Last Name' , 'value'=> set_value('lastname', $customer['lastname']));
$email		= array('id'=>'email', 'class'=>'form-control', 'name'=>'email', 'placeholder'=>'Email' , 'value'=> set_value('email', $customer['email']));
$phone		= array('id'=>'phone', 'class'=>'form-control', 'name'=>'phone', 'placeholder'=>'Phone' , 'value'=> set_value('phone', $customer['phone']));

$password	= array('id'=>'password', 'class'=>'form-control', 'placeholder'=>'Password', 'name'=>'password', 'value'=>'');
$confirm	= array('id'=>'confirm', 'class'=>'form-control', 'placeholder'=>'Confirm Password' , 'name'=>'confirm', 'value'=>'');
?>	
	<div class="container">
		<div class="row">
			<div class="col-md-5">
			
			<div class="form-singin-container">	
				<?php echo form_open('secure/jobseeker_account'); ?>
				<fieldset>
					<h2><?php echo lang('account_information');?></h2>								
					
					<div class="row">	
						<div class="form-group col-md-14">						
							<?php echo form_input($first);?>
						</div>
					
						<div class="form-group col-md-14">								
							<?php echo form_input($last);?>
						</div>
					</div>
				
					<div class="row">
						<div class="form-group col-md-14">							
							<?php echo form_input($email);?>
						</div>
					
						<div class="form-group col-md-14">							
							<?php echo form_input($phone);?>
						</div>
					</div>
				
					<div class="row">
						<div class="span7">
							<label class="checkbox">
								<input type="checkbox" name="email_subscribe" value="1" <?php if((bool)$customer['email_subscribe']) { ?> checked="checked" <?php } ?>/> <?php echo lang('account_newsletter_subscribe');?>
							</label>
						</div>
					</div>
				
					<div class="row">
						<div class="form-group col-md-14">
							<div style="margin:30px 0px 10px; text-align:center;">
								<strong><?php echo lang('account_password_instructions');?></strong>
							</div>
						</div>
					</div>
				
					<div class="row">	
						<div class="form-group col-md-14">
							<?php echo form_password($password);?>
						</div>
	
						<div class="form-group col-md-14">
							<?php echo form_password($confirm);?>
						</div>
					</div>
				
					
					<input type="submit" value="<?php echo lang('form_submit');?>" class="btn btn-primary" />
	
				</fieldset>
				</form>
				</div>
			</div>
		</div>
	</div>	


</div>