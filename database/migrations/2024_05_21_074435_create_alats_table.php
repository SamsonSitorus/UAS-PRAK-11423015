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
        Schema::create('alats', function (Blueprint $table) {
            $table->id();
            $table->foreignId('kategori_id')->references('id')->on('categories')->onDelete('cascade');
            $table->string('nama_alat');
            $table->text('deskripsi')->nullable();
            $table->integer('harga24');
            $table->integer('harga12');
            $table->integer('harga6');
            $table->string('gambar')->default('noimage.jpg');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('alats');
    }
};
