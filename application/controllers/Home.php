<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Home page
 */
class Home extends MY_Controller {

	public function index()
	{
//		$this->render('home', 'full_width');
		redirect("/admin");
	}

    public function index0()
    {
//        $this->render('home', 'full_width');
        echo ("OK");
//		redirect("/admin");
    }
}
