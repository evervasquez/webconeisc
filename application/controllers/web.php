<?php if (!defined('BASEPATH')) die();
class web extends Main_Controller {
    
   public function __construct() {
       parent::__construct();
   }

   public function index()
	{
      $this->load->view('include/header');
      $this->load->view('web/index');
      $this->load->view('include/footer');
	}
   
}

/* End of file frontpage.php */
/* Location: ./application/controllers/frontpage.php */
