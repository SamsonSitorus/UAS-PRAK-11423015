@extends('admin.main')
@section('content')
<main>
    <div class="container-fluid px-4">
        <a href="{{ route('lokasi.index') }}" class="btn btn-sm btn-primary"><i class="fas fa-arrow-left"></i></a>
        <h1 class="mt-4 mb-4">Edit Lokasi "{{ $location->name }}"</h1>
        <div class="row">
            <form action="{{ route('lokasi.update', ['id' => $location->id]) }}" method="POST">
                @method('PATCH')
                @csrf
                <div class="mb-3">
                    <label for="nama">Nama Lokasi:</label>
                    <input type="text" name="name" class="form-control" value="{{ $location->name }}" required>
                </div>
                <div class="mb-3">
                    <label for="admin_id">Admin:</label>
                    <select name="admin_id" class="form-control">
                        <option value="">Pilih Admin</option>
                        @foreach($admins as $admin)
                            <option value="{{ $admin->id }}" {{ $admin->id == $location->admin_id ? 'selected' : '' }}>
                                {{ $admin->name }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
            </form>
        </div>
    </div>
</main>
@endsection
