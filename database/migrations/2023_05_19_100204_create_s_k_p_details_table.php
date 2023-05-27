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
        Schema::create('skp_detail', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('skp_id');
            $table->string('feedback');
            $table->string('nilai');
            $table->integer('nilai_angka');
            $table->foreign('skp_id')->references('id')->on('skp');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('s_k_p_details');
    }
};
