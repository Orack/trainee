<?php 
/* Single page sitemap controller*/
Class Seo extends Front_Controller {

	function sitemap()
    {
        $data = "";//select urls from DB to Array
        
        $this->view('sitemap', $data);
    }

}