<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
class Achievement extends Model{
    protected $fillable = ['id', 'name', 'exp', 'type', 'threshold', 'threshold_type' ];
    protected $hidden   = ['created_at', 'updated_at'];
}

?>