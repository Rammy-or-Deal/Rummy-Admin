<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sys extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function items()
	{
		$crud = $this->generate_crud('sys_items');
		$this->mPageTitle = 'Item List';
		$this->render_crud();
	}

    public function shop_items()
    {
        $crud = $this->generate_crud('sys_shop_items');
        $this->mPageTitle = 'Item List';
        $this->render_crud();
    }

    public function skills()
    {
        $crud = $this->generate_crud('sys_skills');
        $this->mPageTitle = 'Item List';
        $this->render_crud();
    }

}
