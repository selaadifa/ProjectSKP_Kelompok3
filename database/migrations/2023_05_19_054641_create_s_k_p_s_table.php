<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('skp', function (Blueprint $table) {
            $table->id();
            $table->text('nama');
            $table->text('detail');
            $table->unsignedBigInteger('pegawai_id');
            $table->unsignedBigInteger('penilai_id');
            $table->string('periode');
            $table->text('realisasi');
            $table->string('lampiran');
            $table->foreign('pegawai_id')->references('id')->on('users');
            $table->foreign('penilai_id')->references('id')->on('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('s_k_p_s');
    }
};
