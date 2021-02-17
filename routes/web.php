<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::resource('/product', 'ProductController');

Route::get('/manageproduct', 'ManageProductController@index')->name('admin')->middleware('admin');

Route::get('/', 'ProductController@index')->name('customer')->middleware('customer');

Route::get('/product/{id}/{slug?}', 'ProductController@show')->name('product.show');
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::resource('/comment', 'CommentController');
 
Route::resource('/category', 'CategoryController');

Route::get("/search",'SearchController@index');
 
Route::post('/cart-add', 'CartController@add')->name('cart.add');         

Route::post('/cart-clear', 'CartController@clear')->name('cart.clear');

Route::get('/cart-remove/{id}', 'CartController@remove')->name('cart.remove');

Route::get('/cart-show', 'CartController@show')->name('cart.show');

Route::post('/cart-update', 'CartController@update')->name('cart.update');

Route::post('/order', 'CartController@order')->name('order');

