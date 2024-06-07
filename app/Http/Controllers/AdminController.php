<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Alat;
use App\Models\Category;
use App\Models\Payment;
use App\Models\carts;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    public function index() {
        $topUser = User::withCount('payment')->orderBy('payment_count', 'DESC')->limit(5)->get();
        $topProducts = Alat::withCount('order')->orderBy('order_count', "DESC")->limit(5)->get();

        return view('admin.admin', [
            'loggedUsername' => Auth::user()->name,
            'total_user' => User::where('role', 0)->count(),
            'total_alat' => Alat::count(),
            'total_kategori' => Category::count(),
            'total_penyewaan' => Payment::count(),
            'top_user' => $topUser,
            'top_products' => $topProducts
        ]);
    }

    public function usermanagement() {
        $user = User::with(['payment'])->get();

        return view('admin.user.user', [
            'penyewa' => $user->where('role', 0)
        ]);
    }

    public function adminmanagement() {
        $user = User::with(['payment'])->get();

        return view('admin.user.admin_management', [
            'admin' => $user->where('role', 1),
            'user' => $user->where('role', 0)
        ]);
    }

    public function newUser(Request $request) {
        $validated = $request->validate([
            'name' => 'required|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:5|max:255',
            'telepon' => 'required|max:15'
        ]);

        $validated['password'] = Hash::make($validated['password']);
        User::create($validated);

        // Menggunakan session helper untuk set flash message
        session()->flash('registrasi', 'Registrasi Berhasil, Silakan login untuk mulai menyewa');

        return redirect()->route('admin.user');
    }

    public function newOrderIndex($userId) {
        $user = User::find($userId);
        $alat = Alat::with(['category'])->get();
        $cart = Carts::with(['user'])->where('user_id', $userId)->get();

        return view('admin.penyewaan.reservasibaru', [
            'user' => $user,
            'alat' => $alat,
            'cart' => $cart,
            'total' => $cart->sum('harga')
        ]);
    }

    public function createNewOrder(Request $request, $userId) {
        $cart = Carts::where('user_id', $userId)->get();
        $pembayaran = new Payment();

        $pembayaran->no_invoice = $userId . "/" . Carbon::now()->timestamp;
        $pembayaran->user_id = $userId;
        $pembayaran->status = 3;
        $pembayaran->total = $cart->sum('harga');
        $pembayaran->save();

        foreach ($cart as $c) {
            Order::create([
                'alat_id' => $c->alat_id,
                'user_id' => $c->user_id,
                'payment_id' => $pembayaran->id,
                'durasi' => $c->durasi,
                'starts' => date('Y-m-d H:i', strtotime($request['start_date'] . $request['start_time'])),
                'ends' => date('Y-m-d H:i', strtotime($request['start_date'] . $request['start_time'] . "+" . $c->durasi . " hours")),
                'harga' => $c->harga,
                'status' => 2
            ]);
            $c->delete();
        }

        // Menggunakan session helper untuk set flash message
        session()->flash('success', 'Penyewaan baru berhasil dibuat');
        return redirect()->route('penyewaan.index');
    }
}
