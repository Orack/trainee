
<?php echo form_open_multipart('search/process_upload', 'id="MyUploadForm"');?>
	<input name="FileInput" id="FileInput" type="file" />
	<input type="submit"  id="submit-btn" value="Upload" />
	<img src="<?php echo theme_img('ajax-loader.gif')?>" id="loading-img" style="display:none;" alt="Please Wait"/>
</form>
	<div id="progressbox" ><div id="progressbar"></div ><div id="statustxt">0%</div></div>
<div id="output"></div>
