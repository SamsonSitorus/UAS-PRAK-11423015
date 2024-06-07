<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    use HasFactory;

    public function alat() {
        return $this->hasMany(Alat::class,'kategori_id','id');
    }
}
