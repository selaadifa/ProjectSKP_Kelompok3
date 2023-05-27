<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SKPDetail extends Model
{
    use HasFactory;

    protected $table = 'skp_detail';
    protected $fillable = [
        'skp_id',
        'feedback',
        'nilai',
        'nilai_angka'
    ];

    public function skp()
    {
        return $this->belongsTo(SKP::class, 'skp_id');
    }
}
