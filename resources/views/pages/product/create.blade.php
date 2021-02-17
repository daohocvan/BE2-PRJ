@extends('layouts.default')

@section('content')
<div class="container">
    
    <div class="create" style="margin: 40px 0">
   
    @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
        @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
        @endforeach
        </ul>
    </div>
    @endif

    <form action="{{ route('product.store') }}" method="post" enctype="multipart/form-data">

    
        @csrf
        <div class="form-group">
        @foreach($subCategories as $category)
            <div class="form-check">
              <label class="form-check-label">
                <input type="checkbox" class="form-check-input" name="category_id[]" id="category_id" value="{{ $category->id}}">
                {{$category->category_name }}
              </label>
            </div>
        @endforeach
        </div>

        <div class="form-group">
            <input type="text" name="product_name" id="product_name" class="form-control" placeholder="Product Name">
        </div>
        <div class="form-group">
            <input type="text" name="product_price" id="product_price" class="form-control" placeholder="Product Price">
        </div>
        <div class="form-group">
            <textarea type="text" name="product_description" id="product_description" class="form-control" placeholder="Product Description"></textarea>
        </div>
        <div class="form-group">
            <input type="file" name="product_image" id="product_image" class="form-control" placeholder="Product Image">
        </div>
        <button type="submit" class="btn btn-primary">Add</button>
    </form>
    </div>
  
</div>
@endsection