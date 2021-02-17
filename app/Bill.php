<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bill extends Model
{
    
    public function billdetails()
    {
        return $this->hasMany('App\BillDetail');
    }
}
