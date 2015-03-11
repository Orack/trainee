<?php
Class Search_model extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	/********************************************************************

	********************************************************************/
	
	function record_term($term)
	{
		$code	= md5($term);
		$this->db->where('code', $code);
		$exists	= $this->db->count_all_results('search');
		if ($exists < 1)
		{
			$this->db->insert('search', array('code'=>$code, 'term'=>$term));
		}
		return $code;
	}
	
	function record_term_directly($term)
	{
		$code	= md5($term);
		$this->db->where('code', $code);
		$exists	= $this->db->count_all_results('search');
		if ($exists < 1)
		{
			$this->db->insert('search', array('code'=>$code, 'term'=>$term));
		}
		return $term;
	}
	
	function record_term_location($location)
	{
		$code	= md5($location);
		$this->db->where('code', $code);
		$exists	= $this->db->count_all_results('search_location');				
		
		if ($exists < 1)
		{
			$id = $this->db->insert('search_location', array('code'=>$code, 'location'=>$location));
		}
		
		return $location;
	}
	
	function get_term($code)
	{		
		$this->db->select('term');
		$result	= $this->db->get_where('search', array('code'=>$code));
		$result	= $result->row();
		return $result->term;
	}
	
	function record_job($job_title, $location)
	{
		$code	= md5($job_title);
		$this->db->where('code', $code);
		$exists	= $this->db->count_all_results('search');
		if ($exists < 1)
		{
			$this->db->insert('search', array('code'=>$code, 'term'=>$term));
		}
		return $code;
	}
	
	function get_job($code)
	{
		$this->db->select('term');
		$result	= $this->db->get_where('search', array('code'=>$code));
		$result	= $result->row();
		return $result->term;
	}
	
}