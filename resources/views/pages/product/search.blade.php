@extends('layouts.default')


@section('content')
<div class="main">
	<div class="wrap">
		<div class="section group">
		    <div class="cont span_2_of_3">
      
                @foreach($data as $item) 
                <div class="col_1_of_3 span_1_of_3">
                        <a href="{{ url('/product/' . $item->id . '/' . Str::slug($item->product_name, '-')) }}">
                            <div class="inner_content clearfix">
                                    <div class="product_image">
                                    <img src="{{ asset('storage/images/' . $item->product_image) }}" alt="" class="img-fluid">
                                    </div>
                                    <div class="price">
                                    <div class="cart-left">
                                        <p class="title">{{ $item->product_name }}</p>
                                        <div class="price1">
                                            <span class="actual">{{'$' . $item->product_price }}</span>
                                        </div>
                                    </div>
                                    <div class="cart-right"></div>
                                    <div class="clear"></div>
                                    </div>
                            </div>
                        </a>
                </div>
                @endforeach


		     </div>
            


        </div>
        <div class="clear">
        <div class="pagination2">{{$data->links()}}</div>
        </div>
    </div>
</div>
@endsection


