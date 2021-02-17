@extends('layouts.default')


@section('content')

<div class="container">
<div class="cart" style="margin: 60px 0">
    @if (session()->get('success'))
         <div class="alert alert-success">
            {{ session()->get('success') }}
        </div>
    @endif
    <span style="display: flex; justify-content: center; font-size: 3em">Your cart is empty</span>
    <div class="buy" style="text-align: center; margin-top: 20px;">
    <button type="submit"><a href="{{ url('/product') }}">Buy now</a></button>
    </div>
    
</div>

</div>



@endsection