<?php

namespace App;

use Illuminate\Auth\Authenticatable;
use Laravel\Lumen\Auth\Authorizable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Support\Facades\Hash;
class User extends Model implements AuthenticatableContract, AuthorizableContract {
    use Authenticatable, Authorizable;
    protected $fillable = ['id', 'name', 'email'];
    protected $hidden   = ['created_at', 'updated_at', 'password'];

    public function achievements(){
        return $this->hasMany('App\UserAchievement')->leftjoin('achievements as u', function($join) {
                $join->on('user_achievements.achievement_id', '=', 'u.id');
        })->select(array('*'));
    }
    
    public function trip(){
        return $this->hasMany('App\Trip');
    }
}