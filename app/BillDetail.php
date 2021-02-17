<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BillDetail extends Model
{
    public $timestamps = false;
    
    protected $fillable = [
        'bill_id',
        'product_id',
        'quantity',
        'price'
    ];
    public function bill()
    {
        return $this->belongsTo('App\Bill');
    }
}
