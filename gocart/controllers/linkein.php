<?php

class Search extends Front_Controller {

	public function __construct()
    {
      	parent::__construct(); 	
    }
	
	public function session($provider = '')
	{
		$this->config->load('oauth2');
		$allowed_providers = $this->config->item('oauth2');
		if ( ! $provider OR ! isset($allowed_providers[$provider]))
		{
        	$this->session->set_flashdata('info', 'Not Support'.$provider);
            redirect();
            return;
		}
		$this->load->library('oauth2');
		$provider = $this->oauth2->provider($provider, $allowed_providers[$provider]);
        $args = $this->input->get();
        if ($args AND !isset($args['code']))
        {
          	$this->session->set_flashdata('info', 'Failed authorisation, it is may causing by configuration issue or failed autorisation.<br />Details:<br />'.json_encode($args));
            redirect();
            return;
        }
        $code = $this->input->get('code', TRUE);
		if ( ! $code)
		{
                  try
                  {
			         $provider->authorize();
                  }
                  catch (OAuth2_Exception $e)
                  {
                  	$this->session->set_flashdata('info', 'Operation Failed<pre>'.$e.'</pre>');
                  }
		}
		else
		{
			try
			{
				$token = $provider->access($code);
	        	$auth_user = $provider->get_user_info($token);
				if (is_array($auth_user))
				{
                    $this->session->set_flashdata('info', 'Success Login');
					$this->session->set_userdata('user', $auth_user);
                    $this->session->set_userdata('is_login', TRUE);
				}
				else
				{
                    $this->session->set_flashdata('info', 'Fail to retrieve user info');
				}
			}
			catch (OAuth2_Exception $e)
			{
                $this->session->set_flashdata('info', 'Operation Failed<pre>'.$e.'</pre>');
			}
		}
        redirect();
	}
	
}