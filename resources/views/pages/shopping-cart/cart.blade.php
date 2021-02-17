@extends('layouts.default')


@section('content')
<!-- <div class="container">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted">Your cart</span>
        <span class="badge badge-secondary badge-pill">{{Cart::getContent()->count()}}</span>
      </h4>
        <ul class="list-group mb-3">
            @foreach(Cart::getContent() as $product)
            <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
             
                    <h6 class="my-0">{{$product->name}}</h6>
                    <small class="text-muted">{{$product->quantity . ' x $' . $product->price}}</small>
                </div>
                <span class="text-muted">{{'$' . $product->price * $product->quantity}}</span>
                <span class="text-muted">s</span>
            </li>
            @endforeach
            <li class="list-group-item d-flex justify-content-between">
                <span>Total</span>
                <strong>{{'$' .Cart::getSubTotal()}}</strong>
            </li>
        </ul>
        <form action="{{route('cart.clear')}}" method="POST" class="card p-2">
            @csrf
            <div class="input-group">
                <div class="input-group">
                    <button type="submit" class="btn btn-danger">Delete All</button>
                </div>
            </div>
        </form>
        <form action="{{route('cart.clear')}}" method="POST" class="card p-2">
            @csrf
            <div class="input-group">
                <div class="input-group">
                    <button type="submit" class="btn btn-danger">Delete All</button>
                </div>
            </div>
        </form>
</div> -->

<div class="container">
<span style="display: flex; justify-content: center; font-size: 2em; margin: 20px 0">Your cart</span>

<div class="table-responsive-sm">
    <table  class="table" width="700px" border="1" align="center">
    

    <tr align="center" style="background-color: #FF9900; font-weight:bold">
       
     
        <td>Product Name</td>
      
        <td>Price</td>
        <td>Quantity</td>
        <td>Delete</td>

    </tr>
  
    @foreach($cartProducts as $item)
    <tr align="center">
   

  
  
    <td>{{ $item->name }}</td>

    <td>{{'$' .$item->price }}</td>
    <td>

       
        <form action="{{ url('/cart-update') }}" method="post">
            @csrf   
            <input type="text" name="qty" id="qty" value="{{ $item->quantity }}" size="3"> 
            <input type="hidden" name="id" value="{{ $item->id }}">
            <input type="hidden" name="qty2" value="{{ $item->quantity }}">
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
   
    </td>

    <td><a href="{{ url('/cart-remove/'. $item->id) }}"><i class="far fa-trash-alt"></i></a></td>
  
    </tr>
 
     @endforeach
    <tr align="right">
        <td colspan="6"><span style="font-weight:bold">Total: </span>{{'$' . Cart::getSubTotal()}}</td>
    </tr>
    <tr align="center">

    <td>&nbsp;</td>
   
    <td >
        <form action="{{ route('cart.clear') }}" method="post">
            @csrf
            <button type="submit" class="btn btn-primary">Delete all</button>
        </form>
    </td>
   
    <td >
    
    <form action="{{route('order') }}" method="post">
        @csrf
        <button type="submit" class="btn btn-primary">Order</button>
    </form>

    </td>
        
 
    
       
      
    </tr>
   


    </table>
   
  
    </div>
    
</div>


@endsection