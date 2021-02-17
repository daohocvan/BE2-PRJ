@extends('layouts.default')


@section('content')

<div class="main">
	<div class="wrap">
		<div class="section group">
		    <div class="cont span_2_of_3">
      
                @foreach($products as $item) 
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
                                            <span class="actual">{{'$' .$item->product_price }}</span>
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
            
             <div class="rsidebar span_1_of_left">
				<div class="top-border"> </div>
				 <div class="border">
	             <!-- <link href="{{ asset('css/default.css') }}" rel="stylesheet" type="text/css" media="all" />
	             <link href="{{ asset('css/nivo-slider.css') }}" rel="stylesheet" type="text/css" media="all" />
				  <script src="{{ asset('js/jquery.nivo.slider.js') }}"></script> -->
				<script type="text/javascript">
				    $(window).load(function() {
				        $('#slider').nivoSlider();
				    });
				</script>
                <div class="slider-wrapper theme-default">
                    <div id="slider" class="nivoSlider">
                        <div class="hinh1"><img src="{{ asset('storage/images/balen.jpg') }}"  alt="" /></div>
                        <div class="hinh1"><img src="{{ asset('storage/images/van.jpg') }}"  alt="" /></div>
                        <div class="hinh1"><img src="{{ asset('storage/images/nike.jpg') }}"  alt="" /></div>
                        <div class="hinh1"><img src="{{ asset('storage/images/dan.jpg') }}"  alt="" /></div>
                        
                    </div>
                </div>
 
            </div>
           
            
        
        </div>
        <div class="clear">
                <div class="pagination1">{{$products->links()}}</div>
            </div>
      
    </div>
</div>
@endsection



