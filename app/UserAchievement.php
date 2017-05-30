<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
class UserAchievement extends Model{
    protected $fillable = ['id', 'user_id', 'achievement_id', 'trip_id'];
    protected $hidden   = ['created_at', 'updated_at'];

     public function trip(){
        return $this->belongsTo('App\Trip');
    }
}

?>
