@extends('layouts.default')

@section('content')

<div class="mens">
	<div class="main">
      <div class="wrap">
      @if (session()->get('success'))
            <div class="alert alert-success">
                {{ session()->get('success') }}
            </div>
      @endif
        <div class="cont span_2_of_3">
          <div class="grid images_3_of_2">
            <img src="{{ asset('storage/images/' . $item->product_image) }}" alt="">
          </div>
          <div class="desc1 span_3_of_2">
              <h3 class="m_3">{{ $item->product_name}}</h3>
              <p class="m_5">{{'$' . $item->product_price}}</p>
              <div class="btn_form">
              
                <p class="m_text2">{{ $item->product_description}}</p>
              </div>
              <form action="{{route('cart.add')}}" method="post">
              @csrf
            
              <input name="id" type="hidden" value="{{ $item->id }}">
                <label for="qty">Quantity: </label>
                
                <input type="text" name="qty" id="qty">
                
                  <br>
                
                  <button type="submit" name = "add" id = "add" class="btn btn-primary">Add to cart</button>
              </form>
              </div>
          </div>
          @guest    
          @else
          <div class="comment">
            <form action="{{ route('comment.store') }}" method="post">
                  @csrf
                  <div class="form-group">
                      <textarea name="comment_content" id="comment_content" class="form-control"></textarea>
                      <input type="hidden" name="product_id" value="{{ $item->id }}">
                      
                      <button type="submit"  class="btn btn-primary">Send</button>
                  </div>
            </form>
          
              @foreach ($comments as $comment)
                  {{ Auth::user()->name }} 
                  <li>{{ $comment->comment_content }}</li>
                  <li>{{$comment->created_at}}</li>
            
              @endforeach
            @endguest
          </div>
         
          <div class="clear"></div>
          
        </div>
      </div>
		
	</div>
</div>

@endsection