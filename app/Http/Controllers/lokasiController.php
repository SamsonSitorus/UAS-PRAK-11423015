<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Lokasi;
use App\Models\User;

class lokasiController extends Controller
{
    public function index() {
        $locations = Lokasi::with('admin')->get();
        return view('admin.lokasi', compact('locations'));
    }


    
    
    public function store(Request $request) {
        $this->validate($request, [
            'name' => 'required|max:255',
            'admin_id' => 'nullable|exists:users,id',
        ]);
    
        Lokasi::create([
            'name' => $request->name,
            'admin_id' => $request->admin_id,
        ]);
    
        return redirect()->route('lokasi.index')->with('success', 'Lokasi berhasil dibuat');
    }
    
    public function edit($id) {
        $location = Lokasi::findOrFail($id);
        $admins = User::where('role', 1)->get();
        return view('admin.editlokasi', compact('location', 'admins'));
    }

    public function update(Request $request, $id) {
        $location = Lokasi::findOrFail($id);
    
        $this->validate($request, [
            'name' => 'required|max:255',
            'admin_id' => 'nullable|exists:users,id',
        ]);
    
        $location->update([
            'name' => $request->name,
            'admin_id' => $request->admin_id,
        ]);
    
        return redirect()->route('lokasi.index')->with('success', 'Lokasi berhasil diperbarui');
    }
    
    public function destroy($id) {
        $location = Lokasi::findOrFail($id);
        $location->delete();

        return redirect()->route('lokasi.index')->with('success', 'Lokasi berhasil dihapus');
    }
}
