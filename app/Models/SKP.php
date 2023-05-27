<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SKP extends Model
{
    use HasFactory;

    protected $table = 'skp';
    protected $fillable = [
        'nama',
        'detail',
        'pegawai_id',
        'penilai_id',
        'periode',
        'realisasi',
        'lampiran',
    ];

    public function pegawai()
    {
        return $this->belongsTo(User::class, 'pegawai_id');
    }

    public function penilai()
    {
        return $this->belongsTo(User::class, 'penilai_id');
    }
}
