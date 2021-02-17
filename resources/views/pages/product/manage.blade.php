@extends('layouts.default')


@section('content')
    <div class="container">
     
         @if (session()->get('success'))
            <div class="alert alert-success">
                {{ session()->get('success') }}
            </div>
        @endif

        <a href="{{ asset('/product/create/') }}" class="btn btn-primary" style="margin-top: 40px">Add product</a>
       
        <table class="table">
        <tr>
            
            <td> <h3>Product name</h3></td>
            <td><h3>Action</h3></td>
        </tr>
        @foreach($products as $item) 
            <tr>
                <td><h4>{{ $item->product_name }}</h4></td>
                <td>
                    <a href="{{ route('product.edit', $item->id) }}" class="btn btn-primary">Edit</a>
                    <form action="{{ route('product.destroy', $item->id) }}" method="post" onsubmit="return confirm('Bạn có muốn xóa không?')">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger" style="margin-top: 20px">Delete</button>
                    </form>
                </td>
            </tr>
        @endforeach
      
        </table>


        <div class="pagination">
        {{$products->links()}}
        </div>
    
  
    </div>
@endsection
