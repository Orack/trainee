<?php
Class Jobs_model extends CI_Model
{
	var $CI;
	
	function __construct()
	{
		parent::__construct();
	
		$this->CI =& get_instance();
		$this->CI->load->database();
		$this->CI->load->helper('url');
	}
	
	function get_member($id)
	{
		$result = $this->db->get_where('member', array('id'=>$id));
		return $result->row();
	}
	
	function get_member_detail($id)
	{
		$result = $this->db->get_where('employer', array('id'=>$id));
		return $result->row();
	}
	
	function save_members($customer)
	{
		if ($customer['id'])
		{
			$this->db->where('id', $customer['id']);
			$this->db->update('member', $customer);
			return $customer['id'];
		}
		else
		{
			$this->db->insert('member', $customer);
			return $this->db->insert_id();
		}
	}
	
	function save_employer_details($employer)
	{
		if ($employer['id'])
		{
			$this->db->where('id', $employer['id']);
			$this->db->update('employer', $employer);
			return $employer['id'];
		}
		else
		{
			$this->db->insert('employer', $employer);
			return $this->db->insert_id();
		}
	}
	
	/*
	 these functions handle logging in and out
	*/
	function logout()
	{
		$this->CI->session->unset_userdata('customer');
		//force expire the cookie
		$this->generateCookie('[]', time()-3600);
		$this->go_cart->destroy(false);
	}
	
	function member_login($email, $password, $remember=false)
	{
		$this->db->select('*');
		$this->db->where('email', $email);
		$this->db->where('active', 1);
		$this->db->where('password',  sha1($password));
		$this->db->limit(1);
		$result = $this->db->get('member');
		$customer   = $result->row_array();
	
		if ($customer)
		{
	
			if($remember)
			{
				$loginCred = json_encode(array('email'=>$email, 'password'=>$password));
				$loginCred = base64_encode($this->aes256Encrypt($loginCred));
				//remember the user for 6 months
				$this->generateCookie($loginCred, strtotime('+6 months'));
			}
	
			// put our customer in the cart
			$this->go_cart->save_customer($customer);
	
			return true;
		}
		else
		{
			return false;
		}
	}
	
	function employer_is_logged_in($redirect = false, $default_redirect = 'secure/login/')
	{
	
		//$redirect allows us to choose where a customer will get redirected to after they login
		//$default_redirect points is to the login page, if you do not want this, you can set it to false and then redirect wherever you wish.
	
		$customer = $this->go_cart->customer();
		if (!isset($customer['id']))
		{
			//check the cookie
			if(isset($_COOKIE['GoCartCustomer']))
			{
				//the cookie is there, lets log the customer back in.
				$info = $this->aes256Decrypt(base64_decode($_COOKIE['GoCartCustomer']));
				$cred = json_decode($info, true);
	
				if(is_array($cred))
				{
					if( $this->login($cred['email'], $cred['password']) )
					{
						return $this->employer_is_logged_in($redirect, $default_redirect);
					}
				}
			}
	
			//this tells gocart where to go once logged in
			if ($redirect)
			{
				$this->session->set_flashdata('redirect', $redirect);
			}
	
			if ($default_redirect)
			{
				redirect($default_redirect);
			}
	
			return false;
		}
		else
		{
			return true;
		}
	}
	
	function job_seeker_is_logged_in($redirect = false, $default_redirect = 'secure/job_seeker_login/')
	{
	
		//$redirect allows us to choose where a customer will get redirected to after they login
		//$default_redirect points is to the login page, if you do not want this, you can set it to false and then redirect wherever you wish.
	
		$customer = $this->go_cart->customer();
		if (!isset($customer['id']))
		{
			//check the cookie
			if(isset($_COOKIE['GoCartCustomer']))
			{
				//the cookie is there, lets log the customer back in.
				$info = $this->aes256Decrypt(base64_decode($_COOKIE['GoCartCustomer']));
				$cred = json_decode($info, true);
	
				if(is_array($cred))
				{
					if( $this->login($cred['email'], $cred['password']) )
					{
						return $this->employer_is_logged_in($redirect, $default_redirect);
					}
				}
			}
	
			//this tells gocart where to go once logged in
			if ($redirect)
			{
				$this->session->set_flashdata('redirect', $redirect);
			}
	
			if ($default_redirect)
			{
				redirect($default_redirect);
			}
	
			return false;
		}
		else
		{
			return true;
		}
	}
	
	
	private function generateCookie($data, $expire)
	{
		setcookie('GoCartCustomer', $data, $expire, '/', $_SERVER['HTTP_HOST']);
	}
	
	function reset_password($email)
	{
		$this->load->library('encrypt');
		$customer = $this->get_customer_by_email($email);
		if ($customer)
		{
			$this->load->helper('string');
			$this->load->library('email');
	
			$new_password       = random_string('alnum', 8);
			$customer['password']   = sha1($new_password);
			$this->save($customer);
	
			$this->email->from($this->config->item('email'), $this->config->item('site_name'));
			$this->email->to($email);
			$this->email->subject($this->config->item('site_name').': Password Reset');
			$this->email->message('Your password has been reset to <strong>'. $new_password .'</strong>.');
			$this->email->send();
	
			return true;
		}
		else
		{
			return false;
		}
	}
	
	private function aes256Encrypt($data)
	{
		$key = config_item('encryption_key');
		if(32 !== strlen($key))
		{
			$key = hash('SHA256', $key, true);
		}
		$padding = 16 - (strlen($data) % 16);
		$data .= str_repeat(chr($padding), $padding);
		return mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $data, MCRYPT_MODE_CBC, str_repeat("\0", 16));
	}
	
	private function aes256Decrypt($data)
	{
		$key = config_item('encryption_key');
		if(32 !== strlen($key))
		{
			$key = hash('SHA256', $key, true);
		}
		$data = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $data, MCRYPT_MODE_CBC, str_repeat("\0", 16));
		$padding = ord($data[strlen($data) - 1]);
		return substr($data, 0, -$padding);
	}
	
	/******************************************************************
	 * Application
	*****************************************************************/	 
	function save_application($application)
	{
		//echo var_dump($education['id'])
		if (isset($application['id']))
		{
			$this->db->where('id', $application['id']);
			$this->db->update('job_seeker_applications', $application);
			return $application['id'];
		}
		else
		{
			$this->db->insert('job_seeker_applications', $application);
			return $this->db->insert_id();
		}
	}
	
	//manage application
	function search_jobs_application($data=array(), $return_count=false)
	{
		if(empty($data))
		{
			//if nothing is provided return the whole shabang
			//$this->get_all_jobs();
		}
		else
		{

			$this->db->select('job_seeker_applications.*, employer_post_job.*, concat(firstname, \' \' , lastname) as name, job_seeker_applications.status as application_active, job_seeker_applications.id as application_id', false);

			//grab the limit
			if(!empty($data['rows']))
			{
				$this->db->limit($data['rows']);
			}

			//grab the offset
			if(!empty($data['page']))
			{
				$this->db->offset($data['page']);
			}

			//do we order by something other than category_id?
			if(!empty($data['order_by']))
			{
				//if we have an order_by then we must have a direction otherwise KABOOM
				if(!$return_count)
				{
					$this->db->order_by($data['order_by'], $data['sort_order']);
				}
			}

			//do we have a search submitted?
			if(!empty($data['term']))
			{
				$search	= json_decode($data['term']);
				//if we are searching dig through some basic fields
				if(!empty($search->term))
				{
					if(!$return_count)
					{
						$this->db->having("(name LIKE '%{$search->term}%')", FALSE);
					}else{
						$this->db->like('member.firstname', $search->term);
						$this->db->or_like('member.lastname', $search->term);
					}

					//$this->db->like('employer_post_job.job_title', $search->term);
					//$this->db->or_like('description', $search->term);
				}
			}

			$this->db->join('job_seeker_applications', 'job_seeker_applications.id_job=employer_post_job.id', 'right');
			$this->db->join('member', 'job_seeker_applications.id_member=member.id', 'left');

			if(!empty($data['employer_id']))
			{
				//if we have an order_by then we must have a direction otherwise KABOOM
				$this->db->where('employer_post_job.id_employer', $data['employer_id']);
			}else{
				$this->db->where('employer_post_job.id_employer', $data['employer']);

			}

			if(!empty($data['post_job_id']))
			{
				//if we have an order_by then we must have a direction otherwise KABOOM
				$this->db->where('job_seeker_applications.id_job', $data['post_job_id']);
			}

			if($return_count)
			{
				//return $this->db->count_all_results('employer_post_job');
				$this->db->from('employer_post_job');
				return $this->db->count_all_results();
			}
			else
			{
				return $this->db->get('employer_post_job')->result();
			}

		}
	}

	/******************************************************************
	 * Fresh Graduate Skills
	*****************************************************************/
	
	function save_batch_skill($skills)
	{
		$this->db->insert_batch('job_seeker_skill', $skills);
	}
	
	function get_skills_by_customerid($customer_id)
	{
		$results = $this->db->get_where('job_seeker_skill', array('id_member'=>$customer_id));
		return $results->result_array();
	}
	
	function delete_skills_by_customerid($customer_id)
	{
		$this->db->where(array('id_member'=>$customer_id))->delete('job_seeker_skill');
	}
	
	/******************************************************************
	 * Fresh Graduate Language
	*****************************************************************/
	function save_batch_language($languages)
	{
		$this->db->insert_batch('job_seeker_language', $languages);
	}
	
	function get_languages_by_customerid($customer_id)
	{
		$results = $this->db->get_where('job_seeker_language', array('id_member'=>$customer_id));
		return $results->result_array();
	}
	
	function delete_languages_by_customerid($customer_id)
	{
		$this->db->where(array('id_member'=>$customer_id))->delete('job_seeker_language');
	}
	
	/******************************************************************
	 * Fresh Graduate Experience
	*****************************************************************/
	function save_experience($experience)
	{
		if (isset($experience['id']))
		{
			$this->db->where('id', $experience['id']);
			$this->db->update('job_seeker_experience', $experience);
			return $experience['id'];
		}
		else
		{
			$this->db->insert('job_seeker_experience', $experience);
			return $this->db->insert_id();
		}
	}
	
	function get_experience_by_id_and_cid($experience_id, $customer_id)
	{
		$results = $this->db->get_where('job_seeker_experience', array('id'=>$experience_id,'id_member'=>$customer_id));
		return $results->row();
	}
	
	function get_experiences_by_customerid($customer_id)
	{
		$results = $this->db->get_where('job_seeker_experience', array('id_member'=>$customer_id));
		return $results->result_array();
	}
	
	function delete_experience_by_customerid($customer_id)
	{
		$this->db->where(array('id_member'=>$customer_id))->delete('job_seeker_experience');
	}
	
	/******************************************************************
	 * Fresh Graduate Education
	*****************************************************************/
	function save_education($education)
	{
		//echo var_dump($education['id'])
		if (isset($education['id']))
		{
			$this->db->where('id', $education['id']);
			$this->db->update('job_seeker_education', $education);
			return $education['id'];
		}
		else
		{
			$this->db->insert('job_seeker_education', $education);
			return $this->db->insert_id();
		}
	}
	
	function get_education_by_id_and_cid($education_id, $customer_id)
	{
		$results = $this->db->get_where('job_seeker_education', array('id'=>$education_id,'id_member'=>$customer_id));
		return $results->row();
	}
	
	function get_educations_by_customerid($customer_id)
	{
		$results = $this->db->get_where('job_seeker_education', array('id_member'=>$customer_id));
		return $results->result_array();
	}
	
	function delete_education_by_customerid($customer_id)
	{
		$this->db->where(array('id_member'=>$customer_id))->delete('job_seeker_education');
	}
	
	/******************************************************************
	 * Employer Post Job
	*****************************************************************/
	
	function save_employer_job($jobs)
	{
		if ($jobs['id'])
		{
			$this->db->where('id', $jobs['id']);
			$this->db->update('employer_post_job', $jobs);
			return $jobs['id'];
		}
		else
		{
			$this->db->insert('employer_post_job', $jobs);
			return $this->db->insert_id();
		}
	}
	
	function get_job($id)
	{
		$result = $this->db->get_where('employer_post_job', array('id'=>$id));
		return $result->row();
	}
	
	function get_all_jobs($id_employer)
	{
		if(isset($id_employer)){
			$this->db->where('id_employer', $id_employer);
		}
		//sort by alphabetically by default
		$this->db->order_by('id', 'ASC');
		$result	= $this->db->get('employer_post_job');
		 
		return $result->result_array();
	}
	

	function retrieve_job_details()
	{
		if(isset($id_employer)){
			$this->db->where('id_employer', $id_employer);
		}
		//sort by alphabetically by default
		$this->db->order_by('id', 'ASC');
		$result	= $this->db->get('employer_post_job');
		 
		return $result->result_array();
	}
	
	function retrieve_jobs($employer_id = false, $limit = false, $offset = false, $by=false, $sort=false)
	{
	
		//if we are provided a category_id, then get products according to category
		$this->db->select('epj.*, epj.id as id, m.logo as logo, m.company, epj.job_title, epj.position_type, epj.long_desc as description, c.name as country_name, cz.name as state_name', false)->from('employer_post_job epj')->join('member m', 'epj.id_employer = m.id', 'left')->join('countries c', 'c.id = epj.id_country', 'left')->join('country_zones cz', ' cz.id = epj.id_state', 'left')->where(array('epj.active'=>1, 'm.active'=>1, 'm.type'=>'E'));
		//$this->db->order_by($by, $sort);
		$this->db->order_by('epj.id', 'ASC');
		$result	= $this->db->offset($offset)->get()->result();
			
		return $result;
	}
	
	function jobs_search($data=array(), $return_count=false)
	{
		if(empty($data))
		{
			//if nothing is provided return the whole shabang
			$this->retrieve_jobs();
		}
		else
		{
			$this->db->select('epj.id as id, m.logo, m.company, epj.job_title, epj.position_type, epj.long_desc as description, c.name as country_name, cz.name as state_name, epj.post_date', false);
			//grab the limit
	
	
			if(!empty($data['rows']))
			{
				$this->db->limit($data['rows']);
			}
	
			//grab the offset
			if(!empty($data['page']))
			{
				$this->db->offset($data['page']);
			}
	
			//do we order by something other than category_id?
			if(!empty($data['order_by']))
			{
				//if we have an order_by then we must have a direction otherwise KABOOM
				$this->db->order_by($data['order_by'], $data['sort_order']);
			}
	
			if(!empty($data['job_title']))
			{
				$this->db->like('epj.job_title', $data['job_title']);
			}
	
			if(!empty($data['location']))
			{
				$this->db->like('epj.city', $data['location']);
				$this->db->or_like('epj.zipcode', $data['location']);
				$this->db->or_like('c.name', $data['location']);
				$this->db->or_like('cz.name', $data['location']);
			}
	
			if(!empty($data['experience']))
			{
				//$exp_pieces = explode(";", $data['experience']);
				//$this->db->where('min_exp >=', $exp_pieces[0]);
				//$this->db->where('min_exp <=', $exp_pieces[1]);
				$this->db->where('min_exp >=', $data['experience']);
			}
	
			if(!empty($data['salary']) && ($data['salary'] != '0;0'))
			{
				$salary_pieces = explode(";", $data['salary']);
				$this->db->where('approximate_salary >=', $salary_pieces[0]);
				$this->db->where('approximate_salary <=', $salary_pieces[1]);
			}
	
			$this->db->join('member m', 'epj.id_employer = m.id', 'left');
			//lets do some joins to get the proper post job with country and state
			$this->db->join('countries c', 'c.id = epj.id_country', 'left');
			$this->db->join('country_zones cz', 'cz.id = epj.id_state', 'left');
	
			$this->db->where('epj.active', 1);
			/* $this->db->order_by('epj.id', 'ASC');     		 */
	
			if($return_count)
			{
				return $this->db->count_all_results('employer_post_job epj');
			}
			else
			{
				return $this->db->get('employer_post_job epj')->result();
			}
	
		}
	}
	
	/* function search_jobs($term, $limit=false, $offset=false, $by=false, $sort=false)
	{
		$results		= array();

		$this->db->select('*', false);
		//this one counts the total number for our pagination
		$this->db->where('enabled', 1);
		$this->db->where('(name LIKE "%'.$term.'%" OR description LIKE "%'.$term.'%" OR excerpt LIKE "%'.$term.'%" OR sku LIKE "%'.$term.'%")');
		$results['count']	= $this->db->count_all_results('products');


		$this->db->select('*, LEAST(IFNULL(NULLIF(saleprice, 0), price), price) as sort_price', false);
		//this one gets just the ones we need.
		$this->db->where('enabled', 1);
		$this->db->where('(name LIKE "%'.$term.'%" OR description LIKE "%'.$term.'%" OR excerpt LIKE "%'.$term.'%" OR sku LIKE "%'.$term.'%")');

		if($by && $sort)
		{
			$this->db->order_by($by, $sort);
		}

		$results['products']	= $this->db->get('products', $limit, $offset)->result();

		return $results;
	} */


	//manage job by employers
	function search_jobs_posted($data=array(), $return_count=false)
	{
		if(empty($data))
		{
			//if nothing is provided return the whole shabang
			//$this->get_all_jobs();
		}
		else
		{
			$this->db->select('employer_post_job.*, count(job_seeker_applications.id) as qty, employer_post_job.id as post_job_id', false);
			//grab the limit
			if(!empty($data['rows']))
			{
				$this->db->limit($data['rows']);
			}
	
			//grab the offset
			if(!empty($data['page']))
			{
				$this->db->offset($data['page']);
			}
	
			//do we order by something other than category_id?
			if(!empty($data['order_by']))
			{
				//if we have an order_by then we must have a direction otherwise KABOOM
				$this->db->order_by($data['order_by'], $data['sort_order']);
			}
	
			//do we have a search submitted?
			if(!empty($data['term']))
			{
				$search	= json_decode($data['term']);
				//if we are searching dig through some basic fields
				if(!empty($search->term))
				{
					$this->db->like('employer_post_job.job_title', $search->term);
					//$this->db->or_like('description', $search->term);
				}
					
			}
			 
			//lets do some joins to get the proper category products
			$this->db->join('job_seeker_applications', 'job_seeker_applications.id_job=employer_post_job.id', 'left');
			$this->db->group_by("employer_post_job.id");
			 
			if(!empty($data['id_employer']))
			{
				//if we have an order_by then we must have a direction otherwise KABOOM
				$this->db->where('employer_post_job.id_employer', $data['id_employer']);
			}
	
			if($return_count)
			{
				//return $this->db->count_all_results('employer_post_job');
				$this->db->from('employer_post_job');
				return $this->db->count_all_results();
			}
			else
			{
				return $this->db->get('employer_post_job')->result();
			}
	
		}
	}
	 
	/******************************************************************
	 * Keep Track File Uploaded
	*****************************************************************/
	 
	public function insert_file($filename, $title)
	{
		$data = array(
				'filename'      => $filename,
				'title'         => $title
		);
		$this->db->insert('files', $data);
		return $this->db->insert_id();
	}
	 
	/******************************************************************
	 * Newsletter
	*****************************************************************/
	function save_newsletter($data)
	{
		if(!empty($data['id']))
		{
			$this->db->where('id', $data['id']);
			$this->db->update('newsletter', $data);
			return $data['id'];
		} else {
			$this->db->insert('newsletter', $data);
			return $this->db->insert_id();
		}
	}

	function get_newsletter_email($email)
	{
		$result = $this->db->get_where('newsletter', array('email'=>$email));
		return $result->row();
	}
	 
	
}