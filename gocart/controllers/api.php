<?php

class Api extends Front_Controller {

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
					echo 'hi</br>';
					echo $auth_user['first_name'];
					echo $auth_user['last_name'];
					die();	
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

	public function getAuthorizationCode() {
		
		$this->config->load('oauth2');
		$allowed_providers = $this->config->item('oauth2');
		
		
		$params = array('response_type' => 'code',
				'client_id' => $allowed_providers['linkedin']['id'],				
				'state' => uniqid('', true), // unique long string
				'redirect_uri' => 'http://www.jobspeer.com/getAccessToken',
		);
		// Authentication request
		$url = 'https://www.linkedin.com/uas/oauth2/authorization?' . http_build_query($params);
	
		// Needed to identify request when it returns to us
		$_SESSION['state'] = $params['state'];
	
		// Redirect user to authenticate
		header("Location: $url");
		exit;
	}
	
	public function getAccessToken() {
		
		$this->config->load('oauth2');
		$allowed_providers = $this->config->item('oauth2');
		$return_url = 'http://www.jobspeer.com/fetch';
		
		/* echo var_dump('this is my code: '. $_GET['code']. '</br>');
		echo var_dump('this is my state: '. $_GET['state']. '</br>');
		echo var_dump('this is my session state: '. $_SESSION['state']. '</br>'); */
		
		
		/* $params = array('grant_type' => 'authorization_code',
				'code' => $_GET['code'],
				'redirect_uri' => 'http://www.jobspeer.com/fetch',
				'client_id' => $allowed_providers['linkedin']['id'],
				'client_secret' => $allowed_providers['linkedin']['secret'],								
		); */
		
		$params = array('grant_type' => 'authorization_code',
				'client_id' => $allowed_providers['linkedin']['id'],
				'client_secret' => $allowed_providers['linkedin']['secret'],
				'code' => $_GET['code'],
				'redirect_uri' => $return_url,
		);
		
		// Access Token request
		//$url = 'https://www.linkedin.com/uas/oauth2/accessToken?' . http_build_query($params); 
		
		//$url = urldecode('https://www.linkedin.com/uas/oauth2/accessToken?'.http_build_query($params));
		
		//ob_end_flush();
  		//apache_request_headers();

		//var_dump(headers_list());				
		
	 	$url = 'https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code'
		.'&code=' . $_GET['code']
		.'&redirect_uri='. $return_url
		.'&client_id=' . $allowed_providers['linkedin']['id']
		.'&client_secret='. $allowed_providers['linkedin']['secret'];
	 	
	 	
	 	//$url .= '?'.http_build_query($params);
	 	echo var_dump($url);
	 	
	 	$response = file_get_contents($url);
	 	$return = $this->parse_response($response);
		
	 	echo var_dump($return);
		
        //$response = curl_exec($ch);
        
		//curl_close($ch);
		//$token = json_decode($response);
		
		
		// Retrieve access token information
		//$response = file_get_contents($url, false, $context);
	
		// Native PHP object, please
		//$token = json_decode($response);
		
		//echo var_dump($response);
		die();
		
		// Store access token and expiration time
		$_SESSION['access_token'] = $token->access_token; // guard this!
		$_SESSION['expires_in'] = $token->expires_in; // relative time (in seconds)
		$_SESSION['expires_at'] = time() + $_SESSION['expires_in']; // absolute time
		return true;
	}
	
	protected function parse_response($response = '')
	{
		if (strpos($response, "callback") !== false)
		{
			$lpos = strpos($response, "(");
			$rpos = strrpos($response, ")");
			$response  = substr($response, $lpos + 1, $rpos - $lpos -1);
			$return = json_decode($response, true);
		}
		elseif (strpos($response, "&") !== false)
		{
			parse_str($response, $return);
	
		}
		else
		{
			$return = json_decode($response, true);
		}
		return $return;
	}
	
	public function fetch($method, $resource, $body = '') {
		$params = array('oauth2_access_token' => $_SESSION['access_token'],
				'format' => 'json',
		);
	
		// Need to use HTTPS
		$url = 'https://api.linkedin.com' . $resource . '?' . http_build_query($params);
		// Tell streams to make a (GET, POST, PUT, or DELETE) request
		$context = stream_context_create(
				array('http' =>
						array('method' => $method,
						)
				)
		);
	
	
		// Hocus Pocus
		$response = file_get_contents($url, false, $context);
	
		// Native PHP object, please
		return json_decode($response);
	}
	
	
	
	
	
	
}