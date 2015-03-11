<?php



class globals {
	
	function __construct()
	{
		$this->CI =& get_instance();		
	}
	
	function application_status($status_values)
	{
		switch($status_values){
			case 1:
				return 'Pending';
				break;
			case 2:
				return 'Considering';
				break;
			case 3:
				return 'Contacted';
				break;
			case 4:
				return 'Interview Scheduled';			
				break;
			case 5:
				return 'Not Interested';
				break;
			case 6:
				return 'Offered Made';
				break;
			case 7:
				return 'Offered Rejected';
				break;
			case 8:
				return 'Offered Accepted';		
				break;	
			default:
				return 'Inactive';
				break;				
		}				
	}
	
	function job_status($status_values)
	{
		switch($status_values){
			case 0:
				return 'Draft';
				break;
			case 1:
				return 'Active';
				break;
			case 2:
				return 'Expired';
				break;
			case 3:
				return 'Closed';
				break;
			default:
				return 'Inactive';
				break;
		}
	}
	
	function humanTiming($time)
	{
	
		$time = time() - $time; // to get the time since that moment
	
		$tokens = array (
				31536000 => 'year',
				2592000 => 'month',
				604800 => 'week',
				86400 => 'day',
				3600 => 'hour',
				60 => 'minute',
				1 => 'second'
		);
	
		foreach ($tokens as $unit => $text) {
			if ($time < $unit) continue;
			$numberOfUnits = floor($time / $unit);
			return $numberOfUnits.' '.$text.(($numberOfUnits>1)?'s':'');
		}
	
	}
	
	function paginated_calculation($limit, $page, $total)
	{			
		$page = $page == 0 ? 1 : $page;		
		$upper = min( $total, $page * $limit);
		$lower = ($page - 1) * $limit + 1;
		
		return 'Displaying jobs '.$lower.' - '.$upper.' of '. $total . ' on Page '. $page;					
	}
	
}