<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Customer extends Model
{
    use HasFactory;

    protected $primaryKey = 'id';
    protected $table = 'customer';
    protected $fillable = [
        'sales_id', 'nama', 'no_tlpn', 'alamat', 'status', 'metode_ketemu'
    ];

    public $timestamps = false;
}
