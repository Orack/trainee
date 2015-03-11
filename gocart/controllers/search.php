<?php

class Search extends Front_Controller {
	
	function index()
	{
		$this->load->helper('date');
		$data['homepage']			= true;
		$data['country_page']		= true;
		$data['countries']			= $this->Location_model->get_countries();
		
		
		$this->view('country', $data);
	}
			
	public function homepage(){
		$this->load->helper('date');
		$data['homepage']			= true;
		
		$country = $this->session->userdata('user_country');
		$user_country = $this->input->post('country');
								
		if(!empty($user_country) && isset($user_country)){
			$country			= $this->Location_model->get_country($user_country);
			$this->session->set_userdata('user_country', $country->iso_code_2);
			$this->session->set_userdata('user_country_name', $country->name);
		}else{			
			if(empty($country)){
				$this->session->set_userdata('user_country', 'us');
				$this->session->set_userdata('user_country_name', 'United States');
			}						
		}	
										
		$this->view('homepage', $data);
	}
	
	public function loadmore_job(){
		$id = $this->input->post('page');
		$category_id = $this->input->post('category_id');
		$code = $this->input->post('term');

		$config['per_page'] = 12;
		$page = $id * $config['per_page'];
		$sort_by	= array('by'=>'sequence', 'sort'=>'ASC');

		if($category_id == 0){
			$data['details']  = $this->Detail_model->search_details($code, $config['per_page'], $page, $sort_by['by'], $sort_by['sort']);
			$photo = '';
			foreach($data['details']['details'] as $detail):
			$detail->images	= array_values((array)json_decode($detail->images));
			//$detail->images			= (array)json_decode($detail->images);
			if(!empty($detail->images[0]))
			{
				$primary	= $detail->images[0];
				foreach($detail->images as $image)
				{
					if(isset($image->primary))
					{
						$primary	= $image;
					}
				}
					
				$photo	= '<img src="'.base_url('uploads/images/small/'.$primary->filename).'" width="120px" height="90px" alt="'.$detail->seo_title.'"/>';
			}

			echo '<li>';
			echo '<section class="table_display">';
			echo '<div class="table_row">';
			echo '<div class="table_column">';

			echo '<div id="item-list-image">';
			echo '<a href="'.site_url($detail->slug).'">'.$photo.'</a>';
			echo '</div>';

			echo '</div>';

			echo '<div class="table_column_vertical_top">';
			echo '<div class="table_row">';
			echo '<div class="table_column">';

			echo '<div id="item-list-title">';
			echo '<a href="'.site_url($detail->slug).'">'.$detail->location_name.'</a>';
			echo '</div>';

			echo '</div>';
			echo '</div>';

			echo '<div class="table_row">';
			echo '<div class="table_column">';
			echo '<div id="item-list-desc"><p>'.$detail->places->name.'</p></div>';
			echo '</div>';
			echo '</div>';
			echo '</div>';
			echo '</li>';

			endforeach;

		}else{
			$data['details']  = $this->Detail_model->get_details_list($category_id, $config['per_page'], $page, $sort_by['by'], $sort_by['sort']);
			$photo = '';
			foreach($data['details'] as $detail):
			$detail->images	= array_values((array)json_decode($detail->images));
			//$detail->images			= (array)json_decode($detail->images);

			if(!empty($detail->images[0]))
			{
				$primary	= $detail->images[0];
				foreach($detail->images as $image)
				{
					if(isset($image->primary))
					{
						$primary	= $image;
					}
				}
					
				$photo	= '<img src="'.base_url('uploads/images/small/'.$primary->filename).'" width="120px" height="90px" alt="'.$detail->seo_title.'"/>';
			}

			echo '<li>';
			echo '<section class="table_display">';
			echo '<div class="table_row">';
			echo '<div class="table_column">';

			echo '<div id="item-list-image">';
			echo '<a href="'.site_url($detail->slug).'">'.$photo.'</a>';
			echo '</div>';

			echo '</div>';

			echo '<div class="table_column_vertical_top">';
			echo '<div class="table_row">';
			echo '<div class="table_column">';

			echo '<div id="item-list-title">';
			echo '<a href="'.site_url($detail->slug).'">'.$detail->location_name.'</a>';
			echo '</div>';

			echo '</div>';
			echo '</div>';

			echo '<div class="table_row">';
			echo '<div class="table_column">';
			echo '<div id="item-list-desc"><p>'.$detail->places->name.'</p></div>';
			echo '</div>';
			echo '</div>';
			echo '</div>';
			echo '</li>';

			endforeach;

		}

		$photo	= theme_img('no_picture.png', lang('no_image_available'));

		//echo $id;
	}

	public function email_exist_check($email)
	{
		$valid = FALSE;
		$rs_newsletter = $this->Jobs_model->get_newsletter_email($email);

		if (isset($rs_newsletter) && !empty($rs_newsletter))
		{
			$this->form_validation->set_message('email_exist_check', 'This email has been subscripted and captured. Thanks for your support!');
			$valid = FALSE;
		}
		else
		{
			$valid = TRUE;
		}

		return $valid;
	}

	function job_search($order_by="epj.job_title", $sort_order="ASC",$title=false, $page = 0){

		//actualy u just press paging, see what happen they passing in
		$data['page_title']				= lang('search');
		$data['job_search']				= true;
		$data['customer']				= $this->go_cart->customer();
		$this->load->helper('date');
		$this->load->helper('text');
		$this->load->model('Search_model');
			
		//check to see if we have a search term
		$salary = false;
		$experience = false;
		$location = false;

		$data['order_by'] = $order_by;
		$data['sort_order'] = $sort_order;


		if(!$title)
		{
			//if the term is in post, save it to the db and give me a reference
			//$term		= $this->input->post('term', true);
			$job_title 	= $this->input->post('job_title', true);

			//$location 	= $this->input->post('location', true);
			$title		= $this->Search_model->record_term($job_title);

			// no code? redirect so we can have the code in place for the sorting.
			// I know this isn't the best way...
			//redirect('search/job_search/'.$title.'/'.$page);
			redirect('search/job_search/'.$order_by.'/'.$sort_order.'/'.$title);
		}
		else
		{
			//if we have the md5 string, get the term
			$job_title	= $this->Search_model->get_term($title);
		}

		//fix for the category view page.
		$data['base_url']			= array();

		$sort_array = array(
				'name/asc' => array('by' => 'epj.job_title', 'sort'=>'ASC'),
				'name/desc' => array('by' => 'epj.job_title', 'sort'=>'DESC'),
		);
		$sort_by	= array('by'=>false, 'sort'=>false);

		if(isset($_GET['by']))
		{
			if(isset($sort_array[$_GET['by']]))
			{
				$sort_by	= $sort_array[$_GET['by']];
			}
		}

		// if you do paging, no need pasing page and row, total query only one row, if offset, thats mean empty
		$data['total']	= $this->Jobs_model->jobs_search(array('job_title'=>$job_title, 'location'=>$location, 'experience'=>$experience, 'salary'=>$salary , 'order_by'=>$order_by, 'sort_order'=>$sort_order), true);

		//set up pagination
		$this->load->library('pagination');

		//$config['base_url']		= site_url('/search/job_search/'.$job_title.'/'.$page);

		$config['base_url']		= site_url('/search/job_search/'.$order_by.'/'.$sort_order.'/'.$title);
		$config['total_rows'] 	= $data['total'];

		// importance for Paging because it is depend on the url to do setting
		$config['uri_segment']	= 6;
		$config['per_page']		= 10;

		$data['page'] 						= $page;
		$data['rows'] 						= $config['per_page'];
		$currentPage = floor(($this->uri->segment(6)/$config['per_page']) + 1);

		$data['paginated_result'] = $this->globals->paginated_calculation($config['per_page'], $currentPage, $config['total_rows']);

		$config['first_link'] = 'First';
		$config['first_tag_open'] = '<li>';
		$config['first_tag_close'] = '</li>';
		$config['last_link'] = 'Last';
		$config['last_tag_open'] = '<li>';
		$config['last_tag_close'] = '</li>';

		$config['full_tag_open'] = '<ul class="pagination">';
		$config['full_tag_close'] = '</ul>';
		$config['cur_tag_open'] = '<li class="active"><a href="#">';
		$config['cur_tag_close'] = '</a></li>';

		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';

		$config['prev_link'] = '&laquo;';
		$config['prev_tag_open'] = '<li>';
		$config['prev_tag_close'] = '</li>';

		$config['next_link'] = '&raquo;';
		$config['next_tag_open'] = '<li>';
		$config['next_tag_close'] = '</li>';

			
		//$result
		$data['all_jobs']					= $this->Jobs_model->jobs_search(array('job_title'=>$job_title, 'location'=>$location, 'experience'=>$experience, 'salary'=>$salary , 'order_by'=>$order_by, 'sort_order'=>$sort_order, 'rows'=>$config['per_page'], 'page'=>$page));
		$data['num_pages'] 					= ceil($config['total_rows'] / $config['per_page']);

		$this->pagination->initialize($config);

		$this->view('job_listing', $data);

	}
	
	function job_search_api($order_by="epj.job_title", $sort_order="ASC",$title=false, $page = 0){
		//actualy u just press paging, see what happen they passing in
		$data['page_title']				= lang('search');
		$data['job_search']				= true;
		$data['customer']				= $this->go_cart->customer();
		$this->load->helper('date');
		$this->load->helper('text');
		$this->load->model('Search_model');
			
		//check to see if we have a search term
		$salary = false;
		$experience = false;
		$location = false;
		
		$data['order_by'] = $order_by;
		$data['sort_order'] = $sort_order;
		
		$param = array();
		
		if(!$title)
		{
			//if the term is in post, save it to the db and give me a reference
			//$term		= $this->input->post('term', true);
			$job_title 	= $this->input->post('job_title', true);
			$location 	= $this->input->post('job_location', true);		
			
			//$location 	= $this->input->post('location', true);
			$title		= $this->Search_model->record_term($job_title);
		
			// no code? redirect so we can have the code in place for the sorting.
			// I know this isn't the best way...
			//redirect('search/job_search/'.$title.'/'.$page);
			redirect('search/job_search_api/'.$order_by.'/'.$sort_order.'/'.$title);
		}
		else
		{
			//if we have the md5 string, get the term
			$job_title	= $this->Search_model->get_term($title);
			
			$param['job_title'] = trim($job_title);
			$param['location'] = trim($location);								
			
		}
		
		//fix for the category view page.
		$data['base_url']			= array();
		
		$sort_array = array(
				'name/asc' => array('by' => 'epj.job_title', 'sort'=>'ASC'),
				'name/desc' => array('by' => 'epj.job_title', 'sort'=>'DESC'),
		);
		$sort_by	= array('by'=>false, 'sort'=>false);
		
		if(isset($_GET['by']))
		{
			if(isset($sort_array[$_GET['by']]))
			{
				$sort_by	= $sort_array[$_GET['by']];
			}
		}
		
		// if you do paging, no need pasing page and row, total query only one row, if offset, thats mean empty
		$data['total']	= $this->Jobs_model->jobs_search(array('job_title'=>$job_title, 'location'=>$location, 'experience'=>$experience, 'salary'=>$salary , 'order_by'=>$order_by, 'sort_order'=>$sort_order), true);
		
		//set up pagination
		$this->load->library('pagination');
		
		//$config['base_url']		= site_url('/search/job_search/'.$job_title.'/'.$page);
		
		$config['base_url']		= site_url('/search/job_search_api/'.$order_by.'/'.$sort_order.'/'.$title);
		$config['total_rows'] 	= $data['total'];
		
		// importance for Paging because it is depend on the url to do setting
		$config['uri_segment']	= 6;
		$config['per_page']		= 10;
		
		$data['page'] 						= $page;
		$data['rows'] 						= $config['per_page'];
		$currentPage = floor(($this->uri->segment(6)/$config['per_page']) + 1);
		
		$data['paginated_result'] = $this->globals->paginated_calculation($config['per_page'], $currentPage, $config['total_rows']);
		
		$config['first_link'] = 'First';
		$config['first_tag_open'] = '<li>';
		$config['first_tag_close'] = '</li>';
		$config['last_link'] = 'Last';
		$config['last_tag_open'] = '<li>';
		$config['last_tag_close'] = '</li>';
		
		$config['full_tag_open'] = '<ul class="pagination">';
		$config['full_tag_close'] = '</ul>';
		$config['cur_tag_open'] = '<li class="active"><a href="#">';
		$config['cur_tag_close'] = '</a></li>';
		
		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';
		
		$config['prev_link'] = '&laquo;';
		$config['prev_tag_open'] = '<li>';
		$config['prev_tag_close'] = '</li>';
		
		$config['next_link'] = '&raquo;';
		$config['next_tag_open'] = '<li>';
		$config['next_tag_close'] = '</li>';
		
			
		//$result
		//$data['all_jobs']					= $this->Jobs_model->jobs_search(array('job_title'=>$job_title, 'location'=>$location, 'experience'=>$experience, 'salary'=>$salary , 'order_by'=>$order_by, 'sort_order'=>$sort_order, 'rows'=>$config['per_page'], 'page'=>$page));
		
		
		//here i want testing retreive data from linked by api.
		
		//i. get Parameter and append into array:
		
		
		$url_job_search = 'https://api.linkedin.com/v1/job-search?' . http_build_query(array(
				'keyword' => $param['job_title'],
		));
		
				
		//1. so here i try using the previous method from the api that people wrote in CI
		/* $url_job_search = 'https://api.linkedin.com/v1/job-search&' . http_build_query($param);	 */			
				
		$get_content = file_get_contents($url_job_search);
		echo var_dump($get_content);
		
		//$job_results = json_decode(file_get_contents($url_job_search), true);
		//echo var_dump($job_results);		
		
		//2. if failed, research how to read XML file from api, so the mostly is read XML
		
		
		
		$data['num_pages'] 					= ceil($config['total_rows'] / $config['per_page']);
		
		$this->pagination->initialize($config);
		
		$this->view('job_listing_api', $data);
	}
	
	
	function job_search_indeed($order_by="epj.job_title", $sort_order="ASC",$job_title=false,$job_location=false, $page = 0){			
				
		//actualy u just press paging, see what happen they passing in
		$data['page_title']				= lang('search');
		$data['job_search']				= true;
		$data['customer']				= $this->go_cart->customer();
		$this->load->helper('date');
		$this->load->helper('text');
		$this->load->model('Search_model');
			
		//check to see if we have a search term
		$salary = false;
		$experience = false;
		$location = false;
	
		$data['order_by'] = $order_by;
		$data['sort_order'] = $sort_order;
	
		if(!$job_title){
			$job_title 		= $this->input->post('job_title', true);
		}
		
		if(!$job_location){
			$job_location 	= $this->input->post('location', true);
		}								
		
		//echo $job_title;		
		if($job_title){
			$job_title		= $this->Search_model->record_term_directly($job_title);
		}
		
		if($job_location){				
			$job_location		= $this->Search_model->record_term_location($job_location);
		}		
		
		//fix for the category view page.
		$data['base_url']			= array();
	
		$sort_array = array(
				'name/asc' => array('by' => 'epj.job_title', 'sort'=>'ASC'),
				'name/desc' => array('by' => 'epj.job_title', 'sort'=>'DESC'),
		);
		$sort_by	= array('by'=>false, 'sort'=>false);
	
		if(isset($_GET['by']))
		{
			if(isset($sort_array[$_GET['by']]))
			{
				$sort_by	= $sort_array[$_GET['by']];
			}
		}
	
		// if you do paging, no need pasing page and row, total query only one row, if offset, thats mean empty
		//$data['total']	= $this->Jobs_model->jobs_search(array('job_title'=>$job_title, 'location'=>$location, 'experience'=>$experience, 'salary'=>$salary , 'order_by'=>$order_by, 'sort_order'=>$sort_order), true);
	
		/* $url_job_search = 'https://api.linkedin.com/v1/job-search?' . http_build_query(array(
				'keyword' => $param['job_title'],
		)); */
		
		$country = $this->session->userdata('user_country');										
		
		$param = array(	
				'publisher' => '578545790403097',
				'co' => $country,
				'userip' => '1.2.3.4',
				'useragent' => 'Mozilla/%2F4.0%28Firefox%29',
				'v' => '2'								
		);								
		
		if($job_title){			
			$param['q'] = $job_title;
		}
		
		if($job_location){			
			$param['l'] = $job_location;
		}
		
		if($page){			
			$param['start'] = $page;						
		} 
		
		$searching_criteria = http_build_query($param);			
												
		//$url_job_search = 'http://api.indeed.com/ads/apisearch?publisher=578545790403097&q=java&l=austin%2C+tx&sort=&radius=&st=&jt=&start=&limit=&fromage=&filter=&latlong=1&co=us&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2';		
		$url_job_search = 'http://api.indeed.com/ads/apisearch?'.$searching_criteria;				
		
		echo var_dump($url_job_search);
		
		$dom = new DOMDocument();	
		$job_data = file_get_contents($url_job_search, LIBXML_DTDLOAD);
				
		$dom->loadXML($job_data);				
		
		$all_results = $dom->getElementsByTagName("result");
		$totalresults = $dom->getElementsByTagName("totalresults")->item(0)->nodeValue;

		$start = $dom->getElementsByTagName("start")->item(0)->nodeValue;
		$end = $dom->getElementsByTagName("end")->item(0)->nodeValue;		
		$pageNumber = $dom->getElementsByTagName("pageNumber")->item(0)->nodeValue;
				
		$job_array = '';
		
		foreach($all_results as $record) {						
			
			$jobtitle = $record->getElementsByTagName("jobtitle")->item(0)->nodeValue;			
			$company = $record->getElementsByTagName("company")->item(0)->nodeValue;
			$city = $record->getElementsByTagName('city')->item(0)->nodeValue;						
			$state = $record->getElementsByTagName('state')->item(0)->nodeValue;
			$country = $record->getElementsByTagName('country')->item(0)->nodeValue;
			$formattedLocation = $record->getElementsByTagName('formattedLocation')->item(0)->nodeValue;
			$source = $record->getElementsByTagName('source')->item(0)->nodeValue;
			$date = $record->getElementsByTagName('date')->item(0)->nodeValue;
			$snippet = $record->getElementsByTagName('snippet')->item(0)->nodeValue;
			$url = $record->getElementsByTagName('url')->item(0)->nodeValue;			
			$onmousedown = $record->getElementsByTagName('onmousedown')->item(0)->nodeValue;
			//$latitude = $record->getElementsByTagName('latitude')->item(0)->nodeValue;
			//$longitude = $record->getElementsByTagName('longitude')->item(0)->nodeValue;
			$jobkey = $record->getElementsByTagName('jobkey')->item(0)->nodeValue;
			$sponsored = $record->getElementsByTagName('sponsored')->item(0)->nodeValue;
			
			$expired = $record->getElementsByTagName('expired')->item(0)->nodeValue;
			$formattedLocationFull = $record->getElementsByTagName('formattedLocationFull')->item(0)->nodeValue;
			$formattedRelativeTime = $record->getElementsByTagName('formattedRelativeTime')->item(0)->nodeValue;
			
			$job_array[] = array(					
					'jobtitle' => $jobtitle,
					'company' => $company,
					'city' => $city,
					'state' => $state,
					'country' => $country,
					'formattedLocation' => $formattedLocation,
					'source' => $source,
					'date' => $date,					
					'snippet' => $snippet,
					'url' => $url,
					'onmousedown' => $onmousedown,
					//'latitude' => $latitude,
					'jobkey' => $jobkey,
					'sponsored' => $sponsored,
					'expired' => $expired,
					'formattedLocationFull' => $formattedLocationFull,
					'formattedRelativeTime' => $formattedRelativeTime,
			);						
			
							
		}
		
		//set up pagination
		$this->load->library('pagination');
	
		//$config['base_url']		= site_url('/search/job_search/'.$job_title.'/'.$page);
	
		$config['base_url']		= site_url('/search/job_search_indeed/'.$order_by.'/'.$sort_order.'/'.$job_title.'/'.$job_location.'/'.$page);
		$config['total_rows'] 	= $totalresults;
	
		// importance for Paging because it is depend on the url to do setting
		$config['uri_segment']	= 6;
		$config['per_page']		= 10;
	
		$data['page'] 						= $page;
		$data['rows'] 						= $config['per_page'];
		$currentPage = floor(($this->uri->segment(6)/$config['per_page']) + 1);
	
		$data['paginated_result'] = $this->globals->paginated_calculation($config['per_page'], $currentPage, $config['total_rows']);
	
		$config['first_link'] = 'First';
		$config['first_tag_open'] = '<li>';
		$config['first_tag_close'] = '</li>';
		$config['last_link'] = 'Last';
		$config['last_tag_open'] = '<li>';
		$config['last_tag_close'] = '</li>';
	
		$config['full_tag_open'] = '<ul class="pagination">';
		$config['full_tag_close'] = '</ul>';
		$config['cur_tag_open'] = '<li class="active"><a href="#">';
		$config['cur_tag_close'] = '</a></li>';
	
		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';
	
		$config['prev_link'] = '&laquo;';
		$config['prev_tag_open'] = '<li>';
		$config['prev_tag_close'] = '</li>';
	
		$config['next_link'] = '&raquo;';
		$config['next_tag_open'] = '<li>';
		$config['next_tag_close'] = '</li>';
	
			
		//$result
		
		$data['indeed_jobs'] = $job_array;
		
		//$data['all_jobs']					= $this->Jobs_model->jobs_search(array('job_title'=>$job_title, 'location'=>$location, 'experience'=>$experience, 'salary'=>$salary , 'order_by'=>$order_by, 'sort_order'=>$sort_order, 'rows'=>$config['per_page'], 'page'=>$page));
		$data['num_pages'] 					= ceil($config['total_rows'] / $config['per_page']);
	
		$this->pagination->initialize($config);
	
		$this->view('job_listing', $data);
	
	}
	
	

	function job_detail($dummy_data = false, $id = false)
	{
		$data['job_detail']			= true;
		$data['job'] 				= $this->Jobs_model->get_job($id);
		$data['employer'] 			= $this->Jobs_model->get_member($data['job']->id_employer);
		$data['all_jobs'] 			= $this->Jobs_model->retrieve_jobs();

		$this->view('job_detail', $data);
	}

	function application_create($dummy_data = false, $id = false){
		$data['application_create']			= true;

		$data['job'] 				= $this->Jobs_model->get_job($id);

		$this->view('application_create', $data);
	}

	function application_submit(){
		$data['application_create']			= true;
		//$data['job'] 				= $this->Jobs_model->get_job($id);

		$application['id_member'] = $this->go_cart->customer('id');
		$application['id_job'] = $this->input->post('job_id');
		$application['personal_message'] = $this->input->post('personal_message');
		$application['date_submitted'] = date("Y-m-d");
		$application['status'] = 1;

		$job_id = $this->Jobs_model->save_application($application);

		redirect('search/application_submitted/');
	}


	//Job Seeker Function:

	function my_resume()
	{
		$data['my_resume']		= true;
		$data['customer']		= $this->go_cart->customer();

		$data['member']			= (array)$this->Jobs_model->get_member($this->go_cart->customer('id'));

		$data['skills'] 			= $this->Jobs_model->get_skills_by_customerid($this->go_cart->customer('id'));
		$data['languages']			= $this->Jobs_model->get_languages_by_customerid($this->go_cart->customer('id'));
		$data['experiences']			= $this->Jobs_model->get_experiences_by_customerid($this->go_cart->customer('id'));

		$data['educations']			= $this->Jobs_model->get_educations_by_customerid($this->go_cart->customer('id'));

		$this->view('my_resume', $data);
	}

	function skill()
	{

		$data['skill']			= true;
		$data['customer']		= $this->go_cart->customer();
		$this->load->library('form_validation');


		$skill_ids = $this->input->post('skill_id');
		$levels = $this->input->post('level');
		$qty_field = $this->input->post('qty_field');

		//$this->form_validation->set_rules('skill_id[]', 'Skill', 'trim|required');
		/*validation for two text field*/
		// Begin with i = 1 because in HTML is start array with 1
		for($i=1; $i<=sizeof($skill_ids); $i++){
			$this->form_validation->set_rules("skill_id[$i]", 'Skill #'.$i);
			$this->form_validation->set_rules("level[$i]" , 'Level #'.$i);
		}
		$this->form_validation->set_rules("qty_field" , 'Qty Field');
		$data['skills'] 				= $this->Jobs_model->get_skills_by_customerid($this->go_cart->customer('id'));

		if ($this->form_validation->run() == FALSE)
		{
			$this->view('jobseeker_skill', $data);
		}else{

			//$skill_id								= $this->input->post('skill_id'); //get batch of skills
			//$level 									= $this->input->post('level'); // get batch of levels

			//check the item in db is it already exist for this member
			if(isset($data['skills'])){
				//if existed, delete all first only save data
				$this->Jobs_model->delete_skills_by_customerid($this->go_cart->customer('id'));
			}


			$has_value_in_form = 0;
			// Begin with i=1 because in HTML is start array with 1
			for($i=1; $i<= sizeof($skill_ids); $i++){
				// then all insert into array - array -> array
				if((isset($skill_ids[$i]) && !empty($skill_ids[$i])) && (isset($levels[$i]) && !empty($levels[$i])) ){
					$skills[] = array(
							'id_member'=>$this->go_cart->customer('id'),
							'title' => $skill_ids[$i],
							'level' => $levels[$i]
					);
					$has_value_in_form ++;
				}
			}

			if($has_value_in_form > 0){
				$this->Jobs_model->save_batch_skill($skills);
			}

			$this->session->set_flashdata('message', lang('message_account_updated'));

			redirect('search/my_resume');
		}


	}

	function language()
	{

		$data['language']			= true;
		$data['customer']		= $this->go_cart->customer();
		$this->load->library('form_validation');


		$language_ids = $this->input->post('language_id');
		$levels = $this->input->post('level');
		$qty_field = $this->input->post('qty_field');

		//$this->form_validation->set_rules('language_id[]', 'Language', 'trim|required');
		/*validation for two text field*/
		// Begin with i = 1 because in HTML is start array with 1
		for($i=1; $i<=sizeof($language_ids); $i++){
			$this->form_validation->set_rules("language_id[$i]", 'Language #'.$i);
			$this->form_validation->set_rules("level[$i]" , 'Level #'.$i);
		}
		$this->form_validation->set_rules("qty_field" , 'Qty Field');
		$data['languages'] 				= $this->Jobs_model->get_languages_by_customerid($this->go_cart->customer('id'));

		if ($this->form_validation->run() == FALSE)
		{
			$this->view('jobseeker_language', $data);
		}else{

			//$language_id								= $this->input->post('language_id'); //get batch of languages
			//$level 									= $this->input->post('level'); // get batch of levels

			//check the item in db is it already exist for this member
			if(isset($data['languages'])){
				//if existed, delete all first only save data
				$this->Jobs_model->delete_languages_by_customerid($this->go_cart->customer('id'));
			}


			$has_value_in_form = 0;
			// Begin with i=1 because in HTML is start array with 1
			for($i=1; $i<= sizeof($language_ids); $i++){
				// then all insert into array - array -> array
				if((isset($language_ids[$i]) && !empty($language_ids[$i])) && (isset($levels[$i]) && !empty($levels[$i])) ){
					$languages[] = array(
							'id_member'=>$this->go_cart->customer('id'),
							'title' => $language_ids[$i],
							'rank' => $levels[$i]
					);
					$has_value_in_form ++;
				}
			}

			if($has_value_in_form > 0){
				$this->Jobs_model->save_batch_language($languages);
			}

			$this->session->set_flashdata('message', lang('message_account_updated'));

			redirect('search/my_resume');
		}

	}

	function experience($dummy_data = false, $experience_id = false)
	{
		if(!$experience_id){
			$experience_id = $this->input->post('experience_id');
		}


		$data['experience']		= true;
		$data['customer']		= $this->go_cart->customer();
		$data['id_country']		= '';
		$data['id_state']		= '';
		$data['experience']		= '';
		$data['countries_menu']	= $this->Location_model->get_countries_menu();

		$this->load->library('form_validation');

		$this->form_validation->set_rules("company", 'Company', 'trim|required');
		$this->form_validation->set_rules("position" , 'Position', 'trim|required');

		$this->form_validation->set_rules("location" , 'Location', 'required');
		$this->form_validation->set_rules("id_country" , 'Country', 'required');

		$this->form_validation->set_rules("start_month" , 'Start Month', 'required');
		$this->form_validation->set_rules("start_year" , 'Start Year', 'required');
		$this->form_validation->set_rules("end_month" , 'End Year', 'required');
		$this->form_validation->set_rules("end_month" , 'End Year', 'required');

		$this->form_validation->set_rules("desc" , 'Description', 'required');

		if($experience_id){
			$data['experience'] 				= $this->Jobs_model->get_experience_by_id_and_cid($experience_id, $this->go_cart->customer('id'));
		}

		//You need pass a ID to this page, so check as well ID with member ID,
		//if it is has a data in table. Let user do update
		// if it is empty then just key in new.
		if ($this->form_validation->run() == FALSE)
		{
			$this->view('jobseeker_experience', $data);
		}else{

			//$language_id								= $this->input->post('language_id'); //get batch of languages
			//$level 									= $this->input->post('level'); // get batch of levels
			$company = $this->input->post('company');
			$position = $this->input->post('position');
			$location = $this->input->post('location');
			$id_country = $this->input->post('id_country');

			$start_month = $this->input->post('start_month');
			$start_year = $this->input->post('start_year');
			$str_start_date = strtotime($start_month.$start_year);
			$start_date = date("Y-m-d",$str_start_date);

			$end_month = $this->input->post('end_month');
			$end_year = $this->input->post('end_year');
			$str_end_date = strtotime($end_month.$end_year);
			$end_date = date("Y-m-d",$str_end_date);

			$desc = $this->input->post('desc');
			// Begin with i=1 because in HTML is start array with 1
			// then all insert into array - array -> array

			$exp['company']		= $company;
			$exp['position']	= $position;
			$exp['id_member'] 	= $this->go_cart->customer('id');
			$exp['location'] 	= $location;
			$exp['id_country'] 	= $id_country;
			$exp['start_date'] 	= $start_date;
			$exp['end_date'] 	= $end_date;
			$exp['desc'] 		= $desc;

			if(!empty($data['experience'])){
				$exp['id'] 	= $data['experience']->id;
			}

			$id = $this->Jobs_model->save_experience($exp);

			$this->session->set_flashdata('message', lang('message_account_updated'));

			redirect('search/my_resume');
		}

	}

	function education($dummy_data = false, $education_id = false)
	{
		if(!$education_id){
			$education_id = $this->input->post('education_id');
		}

		$data['customer']		= $this->go_cart->customer();
		$data['id_country']		= '';
		$data['education']		= '';
		$data['countries_menu']	= $this->Location_model->get_countries_menu();

		$this->load->library('form_validation');

		$this->form_validation->set_rules("school", 'School Name', 'trim|required');
		$this->form_validation->set_rules("major" , 'Major', 'trim|required');
		$this->form_validation->set_rules("degree_level" , 'Degree Level', 'required');
		$this->form_validation->set_rules("location" , 'Location', 'required');
		$this->form_validation->set_rules("id_country" , 'Country', 'required');

		$this->form_validation->set_rules("start_month" , 'Start Month', 'required');
		$this->form_validation->set_rules("start_year" , 'Start Year', 'required');
		$this->form_validation->set_rules("end_month" , 'End Year', 'required');
		$this->form_validation->set_rules("end_month" , 'End Year', 'required');

		$this->form_validation->set_rules("gpa" , 'GPA', 'required|numeric');

		$this->form_validation->set_rules("desc" , 'Description', 'required');

		if($education_id){
			$data['education'] 				= $this->Jobs_model->get_education_by_id_and_cid($education_id, $this->go_cart->customer('id'));
		}
			
		//You need pass a ID to this page, so check as well ID with member ID,
		//if it is has a data in table. Let user do update
		// if it is empty then just key in new.
		if ($this->form_validation->run() == FALSE)
		{
			$this->view('jobseeker_education', $data);
		}else{

			$school = $this->input->post('school');
			$major = $this->input->post('major');
			$degree_level = $this->input->post('degree_level');
			$location = $this->input->post('location');
			$id_country = $this->input->post('id_country');
			$gpa = $this->input->post('gpa');

			$start_month = $this->input->post('start_month');
			$start_year = $this->input->post('start_year');
			$str_start_date = strtotime($start_month.$start_year);
			$start_date = date("Y-m-d",$str_start_date);

			$end_month = $this->input->post('end_month');
			$end_year = $this->input->post('end_year');
			$str_end_date = strtotime($end_month.$end_year);
			$end_date = date("Y-m-d",$str_end_date);

			$desc = $this->input->post('desc');

			// Begin with i=1 because in HTML is start array with 1
			// then all insert into array - array -> array
			$edu['school']			= $school;
			$edu['major']			= $major;
			$edu['degree_level']	= $degree_level;
			$edu['gpa']				= $gpa;
			$edu['id_country']		= $id_country;
			$edu['id_member'] 		= $this->go_cart->customer('id');
			$edu['location'] 		= $location;
			$edu['id_country'] 		= $id_country;
			$edu['start_date'] 		= $start_date;
			$edu['end_date'] 		= $end_date;
			$edu['desc'] 			= $desc;

			if(!empty($data['education'])){
				$edu['id'] 	= $data['education']->id;
			}

			$id = $this->Jobs_model->save_education($edu);

			$this->session->set_flashdata('message', lang('message_account_updated'));

			redirect('search/my_resume');
		}

	}

	function post_resume()
	{
		$data['post_resume']		= true;
		$data['customer']		= $this->go_cart->customer();


		$this->view('my_resume', $data);
	}

	function post_job()
	{
		$data['post_job']			= true;

		$data['customer']		= $this->go_cart->customer();
		$this->load->library('form_validation');

		$data['id_country']		= '';
		$data['id_state']		= '';
			
		$data['countries_menu']	= $this->Location_model->get_countries_menu();

		$firstKey = 0;
		$i = 0;
		foreach($data['countries_menu'] as $key => $value){
			if($i == 0){
				$firstKey = $key;
			}else{
				break;
			}

			$i++;
		}


		$data['zones_menu']	= $this->Location_model->get_zones_menu($firstKey);

		$this->form_validation->set_rules('job_title', 'Job Title', 'trim|required');
		$this->form_validation->set_rules('job_category', 'Category', 'required');
		$this->form_validation->set_rules('description', 'Description', 'required');
		$this->form_validation->set_rules('id_country', 'Country', 'required');
		$this->form_validation->set_rules('id_state', 'State', 'required');
		$this->form_validation->set_rules('city', 'City', 'required');
		$this->form_validation->set_rules('zipcode', 'Zipcode', 'required');
		$this->form_validation->set_rules('position_type', 'Position Type', 'required');
		$this->form_validation->set_rules('min_edu', 'Minimum Education', 'required');


		if ($this->form_validation->run() == FALSE)
		{
			$this->view('post_job', $data);
		}else{
			echo 'masuk true?';
			$job['id_employer']								= $this->go_cart->customer('id');
			$job['job_title']								= $this->input->post('job_title');
			$job['job_category'] 							= $this->input->post('job_category');
			$job['long_desc'] 								= $this->input->post('description');
			$job['id_country'] 								= $this->input->post('id_country');
			$job['id_state'] 								= $this->input->post('id_state');
			$job['city'] 									= $this->input->post('city');
			$job['zipcode'] 								= $this->input->post('zipcode');
			$job['position_type'] 							= $this->input->post('position_type');
			$job['min_edu'] 								= $this->input->post('min_edu');
			$job['active']									= 1;
			$job['post_date']								= date("Y-m-d H:i:s");;

			//$this->Jobs_model->save_batch_skill($skills);
			$id = $this->Jobs_model->save_employer_job($job);

			$this->session->set_flashdata('message', lang('message_account_updated'));

			redirect('search/job_posted/'.$job['job_title']);
		}

	}

	function edit_job($id = 0, $test = '')
	{
		if(!$id){
			$id =  $this->input->post('id');
		}
		$data['edit_job']			= true;
		$data['job'] 				= 	$this->Jobs_model->get_job($id);
		$data['customer']			= 	$this->go_cart->customer();
		$this->load->library('form_validation');

		$data['id_country']		= '';
		$data['id_state']		= '';
			
		$data['countries_menu']	= $this->Location_model->get_countries_menu();

		$firstKey = 0;
		$i = 0;
		foreach($data['countries_menu'] as $key => $value){
			if($i == 0){
				$firstKey = $key;
			}else{
				break;
			}

			$i++;
		}

		$data['zones_menu']	= $this->Location_model->get_zones_menu($firstKey);

		$this->form_validation->set_rules('job_title', 'Job Title', 'trim|required');
		$this->form_validation->set_rules('job_category', 'Category', 'required');
		$this->form_validation->set_rules('description', 'Description', 'required');
		$this->form_validation->set_rules('id_country', 'Country', 'required');
		$this->form_validation->set_rules('id_state', 'State', 'required');
		$this->form_validation->set_rules('city', 'City', 'required');
		$this->form_validation->set_rules('zipcode', 'Zipcode', 'required');
		$this->form_validation->set_rules('position_type', 'Position Type', 'required');
		$this->form_validation->set_rules('min_edu', 'Minimum Education', 'required');
		$this->form_validation->set_rules('experience', 'Experience', 'required|numeric');
		$this->form_validation->set_rules('salary', 'Approximate Salary', 'required|numeric');

		if ($this->form_validation->run() == FALSE)
		{
			$this->view('edit_job', $data);
		}else{
			$job['id']										= $id;
			$job['id_employer']								= $this->go_cart->customer('id');
			$job['job_title']								= $this->input->post('job_title');
			$job['job_category'] 							= $this->input->post('job_category');
			$job['long_desc'] 								= $this->input->post('description');
			$job['id_country'] 								= $this->input->post('id_country');
			$job['id_state'] 								= $this->input->post('id_state');
			$job['city'] 									= $this->input->post('city');
			$job['zipcode'] 								= $this->input->post('zipcode');
			$job['position_type'] 							= $this->input->post('position_type');
			$job['min_edu'] 								= $this->input->post('min_edu');
			$job['min_exp'] 								= $this->input->post('experience');
			$job['approximate_salary'] 						= $this->input->post('salary');

			//$this->Jobs_model->save_batch_skill($skills);
			$id = $this->Jobs_model->save_employer_job($job);

			$this->session->set_flashdata('message', lang('message_account_updated'));

			redirect('search/job_posted/'.$job['job_title']);
		}

	}

	function contact_us()
	{
		$data['contact_us']			= true;

		$data['page_title'] = lang('contact_us');
		$data['customer'] = $this->go_cart->customer();

		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<div>', '</div>');
		$submitted 	= $this->input->post('submitted');
		$data['error'] = '';
		$data['base_url'] = 'support';

		if ($submitted){

			$this->form_validation->set_rules('name', 'Name', 'required|max_length[100]');
			$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email|max_length[128]|callback_check_email');
			$this->form_validation->set_rules('subject', 'Subject', 'required');
			$this->form_validation->set_rules('message', 'Message', 'required');

			if ($this->form_validation->run() == FALSE)
			{
				$data['error'] = validation_errors();
			}else{
				$name	  	= $this->input->post('name');
				$email		= $this->input->post('email');
				$subject   	= $this->input->post('subject');
				$message  	= $this->input->post('message');
					
				$this->load->library('email');
				$config['mailtype'] = 'html';
				$this->email->initialize($config);
				$this->email->from($email, $name);
				$this->email->to($this->config->item('email'));
				$this->email->bcc($this->config->item('email'));
				$this->email->subject($subject);
				$this->email->message(html_entity_decode($message));
				$this->email->send();

				$this->session->set_flashdata('message', 'Hi '. $name. '. Thank you! We will response you as soon as possible.');
				redirect(current_url());
			}
		}


		$this->view('contact_us', $data);
	}

	function newsletter()
	{
		$data['newsletter']			= true;
			
		$this->load->library('form_validation');
		//$this->form_validation->set_error_delimiters('<div>', '</div>');
		$data['error'] = '';
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email|max_length[128]|callback_email_exist_check');

		if ($this->form_validation->run() == FALSE)
		{
			echo validation_errors();
		}else{

			$email		= $this->input->post('email');

			$newsletter['email'] = $email;
			$today = date("Y-m-d H:i:s");

			$newsletter['newsletter_date_add'] = $today;

			if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
				$ip = $_SERVER['HTTP_CLIENT_IP'];
			} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
				$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
			} else {
				$ip = $_SERVER['REMOTE_ADDR'];
			}

			$newsletter['ip_registration_newsletter'] = $ip;
			$newsletter['active'] = 1;

			$id = $this->Jobs_model->save_newsletter($newsletter);

			if ($id)
			{
				echo 'You have successfully subscribed to this newsletter.';
			}
			else
			{
				echo 'Sorry, Please try again.';
			}

			$this->session->set_flashdata('You have successfully subscribed to this newsletter.');
		}


	}

	function application_submitted(){
		$data['application_submitted']			= true;
		//$data['job'] 				= $this->Jobs_model->get_job($id);
		$data['all_jobs'] 			= $this->Jobs_model->retrieve_jobs();

		$this->view('application_submitted', $data);
	}


	function about_us()
	{
		$data['about_us']			= true;

		$this->view('about_us', $data);
	}

	function short_code()
	{
		$data['short_code']			= true;
		$this->view('short_code', $data);
	}

	function company_logo_upload(){
		$data['logo_upload']		= true;
		$this->view('logo_upload', $data);
	}

	function upload_resume(){
		$data['upload_resume']		= true;
		$data['customer']			= (array)$this->Jobs_model->get_member($this->go_cart->customer('id'));
		$this->view('upload_resume', $data);
	}

	function process_upload(){

		// load other page content
		$this->load->helper('directory');

		$today_datetime = date("YmdHis");
		$today_date 	= date("Ymd");

		if(isset($_FILES["FileInput"]) && $_FILES["FileInput"]["error"]== UPLOAD_ERR_OK)
		{
			############ Edit settings ##############
			//$UploadDirectory	= 'F:/Websites/file_upload/uploads/'; //specify upload directory ends with / (slash)
				
				
			if (empty($_POST['resume']))
			{
				$config['allowed_types'] 	= 'gif|jpg|png|jpeg';
				$config['upload_path']		= 'uploads/company/'.$today_date.'/';

				if (!is_dir($config['upload_path'])) {
					mkdir('./uploads/company/' . $today_date, 0777, TRUE);
				}

			}else{
				$config['allowed_types'] 	= 'doc|txt|pdf';
				$config['upload_path']		= 'uploads/resume/'.$today_date.'/';

				if (!is_dir($config['upload_path'])) {
					mkdir('./uploads/resume/' . $today_date, 0777, TRUE);
				}
			}

			$config['max_size'] 		= 1024 * 8;
			$config['encrypt_name'] 	= TRUE;
			//$config['overwrite'] 		= FALSE; //overwrite user avatar
			$config['remove_spaces'] 	= true;
				
			$this->load->library('upload', $config);
			##########################################
			/*
			 Note : You will run into errors or blank page if "memory_limit" or "upload_max_filesize" is set to low in "php.ini".
			 Open "php.ini" file, and search for "memory_limit" or "upload_max_filesize" limit
			 and set them adequately, also check "post_max_size".
			*/

			//check if this is an ajax request
			if (!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){
				die('this is httpx');
			}

			//Is file size is less than allowed size.
			if ($_FILES["FileInput"]["size"] > 5242880) {
				die("File size is too big!");
			}


			if (empty($_POST['resume']))
			{
				//allowed file type Server side check
				switch(strtolower($_FILES['FileInput']['type']))
				{
					//allowed file types
					case 'image/png':
					case 'image/gif':
					case 'image/jpeg':
					case 'image/pjpeg':
						break;
					default:
						die('Unsupported File!'); //output error

						/* case 'text/plain':
						 case 'text/html': //html file
						case 'application/x-zip-compressed':
						case 'application/pdf':
						case 'application/msword':
						case 'application/vnd.ms-excel':
						case 'video/mp4': */
				}
			}
			else
			{
				//allowed file type Server side check
				switch(strtolower($_FILES['FileInput']['type']))
				{
					//allowed file types
					case 'text/plain':
					case 'text/html': //html file
					case 'application/x-zip-compressed':
					case 'application/pdf':
					case 'application/msword':
					case 'application/vnd.ms-excel':
					case 'video/mp4':
						break;
					default:
						die('Unsupported File!'); //output error
				}
					
			}
				
			//Normal PHP without framework
			/* $File_Name          = strtolower($_FILES['FileInput']['name']);
				$File_Ext           = substr($File_Name, strrpos($File_Name, '.')); //get file extention
			$Random_Number      = rand(0, 9999999999); //Random number to be added to name.
			$NewFileName 		= $Random_Number.$File_Ext; //new file name */

			// this is the name at HTML <input type=file name=FileInput>
			$file_element_name = 'FileInput';

			if (!$this->upload->do_upload($file_element_name))
			{
				/* $status = 'error';
				 $msg = $this->upload->display_errors('', ''); */
				die('Error Found which is document is empty, please try again.');
			}else{
				$data = $this->upload->data();
				// full path is uploads/ [resume||company] / [today-datetime] / [filename]
				$full_path = $config['upload_path'].$data['file_name'];
				$member['id'] 		= $this->go_cart->customer('id');


				if (empty($_POST['resume']))
				{
					$title = $today_datetime.'-CompanyLogo';
					$member['logo'] 	= $full_path;
				}
				else
				{
					$title = date("YmdHis").'-Resume';
					$member['resume'] 	= $full_path;
				}

				//update member table for record resume or logo path to retrieve next day
				$this->Jobs_model->save_members($member);
				$file_id = $this->Jobs_model->insert_file($full_path, $title);

				if($file_id)
				{
					if (empty($_POST['resume']))
					{
					 echo '<div class="step-by-inner-img2"><img src='.base_url($full_path).' alt="Company Logo" class="company-logo" style="width:280px; height:180px;"/></div>';
					}
					else
					{
						echo '<a href="'. base_url($full_path).'">'.$data['file_name'].'</a>';
					}

				}
				else
				{
					unlink($data['full_path']);
					/* $status = "error";
					 $msg = "Something went wrong when saving the file, please try again."; */
					die('Something went wrong when saving the file, please try again.');
				}

			}
			@unlink($_FILES[$file_element_name]);
			/* if(move_uploaded_file($_FILES['FileInput']['tmp_name'], $UploadDirectory.$NewFileName ))
				{
			die('Success! File Uploaded.');
			}else{
			die('error uploading File!');
			} */

		}
		else
		{
			die('Something wrong with upload! Is "upload_max_filesize" set correctly?');
		}
	}

	function job_posted($job_title = '', $job_test = ''){

		echo $job_test;
		$data['job_posted']			= true;
		$data['job_title']			= $job_title;

		$this->view('job_posted', $data);
	}

	function manage_job($order_by="job_title", $sort_order="ASC", $job_title=0, $page=0, $rows=15){
		$data['manage_job']			= true;
		$data['customer']			= $this->go_cart->customer();
		$data['job_title']			= $job_title;
		//$data['jobs'] = $this->Jobs_model->get_all_jobs($this->go_cart->customer('id'));

		$term						= false;
		$post						= $this->input->post(null, false);
		$this->load->model('Search_model');
		if($post)
		{
			$term					= json_encode($post);
		}

		//store the search term
		$data['term']			= $term;
		//$data['history_term'] 	= $term['term'];
		$data['order_by']		= $order_by;
		$data['sort_order']		= $sort_order;

		$data['job_posts']		= $this->Jobs_model->search_jobs_posted(array('term'=>$term, 'order_by'=>$order_by, 'sort_order'=>$sort_order, 'rows'=>$rows, 'page'=>$page));

		//total number of jobs posted
		$data['total']		= $this->Jobs_model->search_jobs_posted(array('term'=>$term, 'order_by'=>$order_by, 'sort_order'=>$sort_order), true);

		$this->load->library('pagination');

		$config['base_url']			= site_url('/search/manage_job/'.$order_by.'/'.$sort_order.'/'.$job_title.'/');
		$config['total_rows']		= $data['total'];
		$config['per_page']			= $rows;
		$config['uri_segment']		= 7;
		$config['first_link']		= 'First';
		$config['first_tag_open']	= '<li>';
		$config['first_tag_close']	= '</li>';
		$config['last_link']		= 'Last';
		$config['last_tag_open']	= '<li>';
		$config['last_tag_close']	= '</li>';

		$config['full_tag_open']	= '<div class="pagination"><ul>';
		$config['full_tag_close']	= '</ul></div>';
		$config['cur_tag_open']		= '<li class="active"><a href="#">';
		$config['cur_tag_close']	= '</a></li>';

		$config['num_tag_open']		= '<li>';
		$config['num_tag_close']	= '</li>';

		$config['prev_link']		= '&laquo;';
		$config['prev_tag_open']	= '<li>';
		$config['prev_tag_close']	= '</li>';

		$config['next_link']		= '&raquo;';
		$config['next_tag_open']	= '<li>';
		$config['next_tag_close']	= '</li>';

		$this->pagination->initialize($config);

		$this->view('manage_job', $data);
	}

	function manage_application($order_by="name", $sort_order="ASC", $name=0, $page=0, $rows=15, $post_job_id = false){		

		$data['manage_application']	= true;
		$data['customer']			= $this->go_cart->customer();
		$data['name']				= $name;
		//$data['jobs'] = $this->Jobs_model->get_all_jobs($this->go_cart->customer('id'));
			
		$term						= false;
		$post						= $this->input->post(null, false);
		$this->load->model('Search_model');
		if($post)
		{
			$term					= json_encode($post);
		}

		$employer_id = $this->go_cart->customer('id');
		//store the search term
		$data['term']			= $term;
		//$data['history_term'] 	= $term['term'];
		$data['order_by']		= $order_by;
		$data['sort_order']		= $sort_order;

		$data['job_application']		= $this->Jobs_model->search_jobs_application(array('term'=>$term, 'order_by'=>$order_by, 'sort_order'=>$sort_order, 'rows'=>$rows, 'page'=>$page, 'employer'=>$employer_id, 'post_job_id' => $post_job_id));

		//total number of jobs posted
		$data['total']		= $this->Jobs_model->search_jobs_application(array('term'=>$term, 'order_by'=>$order_by, 'sort_order'=>$sort_order, 'employer_id'=>$employer_id), true);

		$this->load->library('pagination');

		$config['base_url']			= site_url('/search/manage_application/'.$order_by.'/'.$sort_order.'/'.$name.'/');
		$config['total_rows']		= $data['total'];
		$config['per_page']			= $rows;
		$config['uri_segment']		= 7;
		$config['first_link']		= 'First';
		$config['first_tag_open']	= '<li>';
		$config['first_tag_close']	= '</li>';
		$config['last_link']		= 'Last';
		$config['last_tag_open']	= '<li>';
		$config['last_tag_close']	= '</li>';

		$config['full_tag_open']	= '<div class="pagination"><ul>';
		$config['full_tag_close']	= '</ul></div>';
		$config['cur_tag_open']		= '<li class="active"><a href="#">';
		$config['cur_tag_close']	= '</a></li>';

		$config['num_tag_open']		= '<li>';
		$config['num_tag_close']	= '</li>';

		$config['prev_link']		= '&laquo;';
		$config['prev_tag_open']	= '<li>';
		$config['prev_tag_close']	= '</li>';

		$config['next_link']		= '&raquo;';
		$config['next_tag_open']	= '<li>';
		$config['next_tag_close']	= '</li>';

		$this->pagination->initialize($config);

		$this->view('manage_application', $data);
	}

	function update_status_application($order_by="name", $sort_order="ASC", $name=0, $page=0, $rows=15){

		$data['update_status_application']	= true;
		$data['name']				= $name;
		$term						= false;

		$applications = $this->input->post('applications');
		$status = $this->input->post('status');
		if($applications)
		{
			foreach($applications as $app)
			{
				$application['id'] 		= $app;
				$application['status']  = $status;

				$id = $this->Jobs_model->save_application($application);
			}

			$this->session->set_flashdata('message', 'Job Application has been updated');
		}
		else
		{
			$this->session->set_flashdata('error', 'No Items selected');
		}



		$post						= $this->input->post(null, false);
		$this->load->model('Search_model');
		if($post)
		{
			$term					= json_encode($post);
		}

		$employer_id = $this->go_cart->customer('id');
		$data['term']			= $term;

		$data['order_by']		= $order_by;
		$data['sort_order']		= $sort_order;
		$data['job_application']		= $this->Jobs_model->search_jobs_application(array('term'=>$term, 'order_by'=>$order_by, 'sort_order'=>$sort_order, 'rows'=>$rows, 'page'=>$page, 'employer'=>$employer_id));

		//total number of jobs posted
		$data['total']		= $this->Jobs_model->search_jobs_application(array('term'=>$term, 'order_by'=>$order_by, 'sort_order'=>$sort_order, 'employer_id'=>$employer_id), true);

		$this->load->library('pagination');

		$config['base_url']			= site_url('/search/manage_application/'.$order_by.'/'.$sort_order.'/'.$name.'/');
		$config['total_rows']		= $data['total'];
		$config['per_page']			= $rows;
		$config['uri_segment']		= 7;
		$config['first_link']		= 'First';
		$config['first_tag_open']	= '<li>';
		$config['first_tag_close']	= '</li>';
		$config['last_link']		= 'Last';
		$config['last_tag_open']	= '<li>';
		$config['last_tag_close']	= '</li>';

		$config['full_tag_open']	= '<div class="pagination"><ul>';
		$config['full_tag_close']	= '</ul></div>';
		$config['cur_tag_open']		= '<li class="active"><a href="#">';
		$config['cur_tag_close']	= '</a></li>';

		$config['num_tag_open']		= '<li>';
		$config['num_tag_close']	= '</li>';

		$config['prev_link']		= '&laquo;';
		$config['prev_tag_open']	= '<li>';
		$config['prev_tag_close']	= '</li>';

		$config['next_link']		= '&raquo;';
		$config['next_tag_open']	= '<li>';
		$config['next_tag_close']	= '</li>';

		$this->pagination->initialize($config);
		$this->view('manage_application', $data);
	}
	
	
}