<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

	class Trip extends Model{
    	
    	protected $fillable = ['id', 'user_id', 'start_longitude', 'start_latitude','end_longitude','end_latitude','start_time','finish_time','total_distance','top_speed','average_cadence','top_cadence' ];
    	protected $hidden   = ['created_at', 'updated_at'];
		
		public function user(){
        	return $this->belongsTo('App\User');
    	}
	}

//Tamabahan
//total time = finish_time - start_time, average_speed =  total_distance/ total_time  



?>