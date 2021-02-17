<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use Cart;
use Illuminate\Support\Facades\Auth;
use App\Bill;
use App\BillDetail;
class CartController extends Controller
{
   
    public function add(Request $request){
        $product = Product::find($request->id);
       
        if(Auth::check()){
            Cart::add($product->id, $product->product_name, $product->product_price, $request->qty, array());
            return back()->with('success', "Add to cart successfully");
        }
        else{
            return back()->with('success', "Please login to buy !!");
        }
        
    }
    public function show(){
    
        $cartProducts = Cart::getContent();
      
        if(Cart::getTotalQuantity() > 0){
            return view('pages.shopping-cart.cart', compact('cartProducts'));
        }
        else{
            return view('pages.shopping-cart.cartempty');
        }
       
    }

    public function clear(){
        Cart::clear();
        return redirect('/product');
        
    }

    public function remove($id){
        
        Cart::remove($id);
        if(Cart::getTotalQuantity() > 0){
            return redirect('/cart-show');
        }
        else{
            return redirect('/product');
        }   
    }

    public function update(Request $request){
        
        Cart::update($request->id,  array('quantity' =>  $request->qty - $request->qty2));
        return redirect('/cart-show');
    } 

    public function order(Request $request)
    {
        $cartProducts = Cart::getContent();
       
        $bill = new Bill;
        $bill->user_id = Auth::user()->id;
        $bill->total_price =  Cart::getSubTotal();
        $bill->save();

        foreach($cartProducts as $key => $value){
           
            $billDetail = new BillDetail();
            $billDetail->bill_id = $bill->id;
            $billDetail->product_id = $key;
            $billDetail->quantity =  $value['quantity']; 
            $billDetail->price =   $value['quantity'] * $value['price']; 
            $billDetail->save();

        }
        Cart::clear();
        return view('pages.shopping-cart.cartempty')->with('success',"Order successfully");
    }
}
