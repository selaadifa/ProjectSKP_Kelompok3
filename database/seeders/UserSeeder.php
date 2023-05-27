<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Models\User;
use App\Models\Jabatan;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Jabatan::create(['nama' => 'Admin']);
        Jabatan::create(['nama' => 'Dosen']);
        Jabatan::create(['nama' => 'Kepala Jurusan Teknik Informatika']);
        // Admin
        User::create([
            'name' => 'Admin',
            'email' => 'admin@admin.com',
            'password' => Hash::make('admin123'),
            'email_verified_at' => now(),
            'remember_token' => Str::random(10),
            'jabatan_id' => 1,
            'nip' => '111111111111',
            'pangkat' => 'Admin',
            'unit_kerja' => 'Politeknik Negeri Banyuwangi',
            'photo' => 'not_found.jpg',
        ]);
    }
}
