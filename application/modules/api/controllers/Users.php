<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Demo Controller with Swagger annotations
 * Reference: https://github.com/zircote/swagger-php/
 */
class Users extends API_Controller {

	/**
	 * @SWG\Get(
	 * 	path="/users",
	 * 	tags={"user"},
	 * 	summary="List out users",
	 * 	@SWG\Parameter(
	 * 		in="header",
	 * 		name="X-API-KEY",
	 * 		description="API Key",
	 * 		required=false,
	 * 		type="string"
	 * 	),
	 * 	@SWG\Response(
	 * 		response="200",
	 * 		description="List of users",
	 * 		@SWG\Schema(type="array", @SWG\Items(ref="#/definitions/User"))
	 * 	)
	 * )
	 */
	public function index_get()
	{
//		$data = $this->users
//			->select('id, username, email, active, name')
//			->get_all();
        $data = $this->users
            ->select('*')
            ->get_all();
		$this->response($data);
	}

	/**
	 * @SWG\Get(
	 * 	path="/users/{id}",
	 * 	tags={"user"},
	 * 	summary="Look up a user",
	 * 	@SWG\Parameter(
	 * 		in="path",
	 * 		name="id",
	 * 		description="User ID",
	 * 		required=true,
	 * 		type="integer"
	 * 	),
	 * 	@SWG\Response(
	 * 		response="200",
	 * 		description="User object",
	 * 		@SWG\Schema(ref="#/definitions/User")
	 * 	),
	 * 	@SWG\Response(
	 * 		response="404",
	 * 		description="Invalid user ID"
	 * 	)
	 * )
	 */
	public function id_get($id)
	{
		$data = $this->users
			->select('id, username, email, active, name,facebook_id')
			->get($id);
		$this->response($data);
	}

    public function udid_get($udid)
    {
        $data = $this->users
            ->select('*')
            ->get_by('udid',$udid);
        if (!$data){
            $data=[
                'udid'=>$udid,
                'name'=>'Guest_'.rand(1000,9999),
                'pic'=>"new_avatar/avatar_".rand(1,26),
                'frame_id'=>1,
                'skill_level'=>0,
                'coin_value'=>50000,
                'leaf_value'=>100,
            ];
            $this->users->insert($data);
        }

        $this->response($data);
    }

	/**
	 * @SWG\Put(
	 * 	path="/users/{id}",
	 * 	tags={"user"},
	 * 	summary="Update an existing user",
	 * 	@SWG\Parameter(
	 * 		in="path",
	 * 		name="id",
	 * 		description="User ID",
	 * 		required=true,
	 * 		type="integer"
	 * 	),
	 * 	@SWG\Parameter(
	 * 		in="body",
	 * 		name="body",
	 * 		description="User info",
	 * 		required=true,
	 * 		@SWG\Schema(ref="#/definitions/UserPut")
	 * 	),
	 * 	@SWG\Response(
	 * 		response="200",
	 * 		description="Successful operation"
	 * 	)
	 * )
	 */
	// TODO: user should be able to update their own account only
	public function id_put($id)
	{
		$data = elements(array('first_name', 'last_name'), $this->put());

		// proceed to update user
		$updated = $this->ion_auth->update($id, $data);

		// result
		($updated) ? $this->success($this->ion_auth->messages()) : $this->error($this->ion_auth->errors());
	}
}
