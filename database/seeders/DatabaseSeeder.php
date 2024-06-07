<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            [
                'name' => 'Nicholas',
                'email' => 'nicholas@gmail.com',
                'password' => Hash::make('12345678'),
                'role' => 2
            ],
            [
                'name' => 'edo',
                'email' => 'edo@gmail.com',
                'password' => Hash::make('12345678'),
                'role' => 1
            ],
            [
                'name' => 'Hanna',
                'email' => 'hannan@test.com',
                'password' => Hash::make('12345678'),
                'role' => 0
            ]
        ]);
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        DB::table('categories')->insert([
            [
                'nama_kategori' => 'lapangan'
            ],
            [
                'nama_kategori' => 'alat'
            ]
            
        ]);
    }
}
