
<!doctype html>
<html lang="en">
  <head>
   <title>Leo Shop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
    <link href="{{ asset('css/form.css') }}" rel="stylesheet" type="text/css" media="all"/>
    <link href="http://fonts.googleapis.com/css?family=Exo+2" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="{{ asset('fontawesome/css/all.min.css') }}">
    <script type="text/javascript" src="{{ asset('js/jquery1.min.js') }}"></script>
    <!-- start menu -->
    <link href="{{ asset('css/megamenu.css') }}" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="{{ asset('js/megamenu.js') }}"></script>
    
    <script>
      $(document).ready(function() {
       
        $(".megamenu").megamenu();
        
       
        
      });
    </script>
    <!--start slider -->
    <link rel="stylesheet" href="{{ asset('css/fwslider.css') }}" media="all" />
    <script src="{{ asset('js/jquery-ui.min.js') }}"></script>
    <script src="{{ asset('js/css3-mediaqueries.js') }}"></script>
    <script src="{{ asset('js/fwslider.js') }}"></script>
    <!--end slider -->
    <script src="{{ asset('js/jquery.easydropdown.js') }}"></script>

    <style>
     .scrollup{
        position:fixed;
        width:32px;
        height:32px;
        bottom:0px;
        right:20px;
        background: #222;
	
    }

       a.scrollup {
        outline:0;
        text-align: center;
    }

    a.scrollup:hover,a.scrollup:active,a.scrollup:focus {
        opacity:1;
        text-decoration:none;
    }
    a.scrollup i {
        margin-top: 10px;
        color: #fff;
    }
    a.scrollup i:hover {
        text-decoration:none;
    }

    #qty{
      margin-bottom: 30px;
      margin-left: 20px;
      width: 100px;
    }

    #comment_content{
      width: 380px;
      margin-bottom: 20px;
    }

    #slider{
      height: 800px;
    }
    @media (max-width: 768px) {
        .pagination1{
            margin-left: -240px;
        }

        .pagination2{
          margin-left: -120px;
        }
        .account{
          margin-left: -30px;
        }
    }
     </style>
  </head>

  <body>

    <div class="header-top">
        <div class="wrap">
          <div class="header-top-left">
            <div class="box">
              <select tabindex="4" class="dropdown">
                <option value="" class="label" value="">Language :</option>
                <option value="1">English</option>
                <option value="2">French</option>
                <option value="3">German</option>
              </select>
            </div>
            <div class="box1">
              <select tabindex="4" class="dropdown">
                <option value="" class="label" value="">Currency :</option>
                <option value="1">$ Dollar</option>
                <option value="2">€ Euro</option>
              </select>
            </div>
            <div class="clear"></div>
          </div>
          <div class="cssmenu">
            <ul>     
            @guest
              <li><a href="{{ url('/login') }}">Login</a></li>
              |
              <li><a href="{{ url('/register') }}">Register</a></li>
            @else
            <li><a href="#"> Welcome, {{ Auth::user()->name }}</a></li>
            |
            <li><a href="{{ route('logout') }}"  onclick="event.preventDefault();document.getElementById('logout-form').submit();">Logout</a></li>
            <form id="logout-form" action="{{ route('logout') }}" method="POST">
              @csrf
            </form>
            @endguest
            </ul>
          </div>
          <div class="clear"></div>
        </div>
      </div>
    </div>

      <div class="header-bottom">
        <div class="wrap">
          <div class="header-bottom-left">
            <div class="logo">
              <a href="{{ url('/product') }}"><img src="{{ asset('images/logo.png') }}" alt=""/></a>
            </div>
            <div class="menu">
              <ul class="megamenu skyblue">
                <li class="active grid"><a href="{{ url('/product') }}">Home</a></li>
              
                @foreach ($parentCategories as $category)
                <li>
                
                  <a  href="#">{{ $category->category_name}}</a>
                  <div class="megapanel">
                    <div class="col1">
                      <div class="h_nav">
                     
                         <ul>
                         @include('layouts.partials.subCategoryList',['subcategories' => $category->subcategories])
                         </ul>
                      </div>
                    </div>
                  </div>
                </li>
                @endforeach
               
            

                <li><a class="color6" href="#">Other</a></li>
                <li><a class="color7" href="#">Contact</a></li>
              </ul>
            </div>
          </div>

          <div class="header-bottom-right">
            <div class="search">
              <form action="{{ asset('/search') }}" method="get">
                <input type="text" name="keyword"/>
          
                <button type="submit">
                    <i class="fas fa-search"></i>

                </button>
              </form>
            </div>
          
            <div class="tag-list">
      
                <ul class="icon1 sub-icon1 profile_img">
                  <li><a class="active-icon c2" href="#"> </a>
                    
                  </li>
                </ul>
                  <ul class="last"><li><a href="{{ route('cart.show') }}">Cart({{Cart::getTotalQuantity()}})</a></li>
                  </ul>
            </div>
                      
              
          </div>

          
          <div class="clear"></div>
        </div>
      </div>

      <div id="fwslider">
      <div class="slider_container">
        <div class="slide">
          <!-- Slide image -->
          <img src="{{ asset('storage/images/banner.jpg') }}" alt="" />
          <!-- /Slide image -->
          <!-- Texts container -->
          <div class="slide_content">
            <div class="slide_content_wrap">
              <!-- Text title -->
              <h4 class="title">Aluminium Club</h4>
              <!-- /Text title -->

              <!-- Text description -->
              <p class="description">Experiance ray ban</p>
              <!-- /Text description -->
            </div>
          </div>
          <!-- /Texts container -->
        </div>
        <!-- /Duplicate to create more slides -->
        <div class="slide">
          <img src="{{ asset('storage/images/a.jpg') }}" alt="" />
          <div class="slide_content">
            <div class="slide_content_wrap">
              <h4 class="title">consectetuer adipiscing</h4>
              <p class="description">diam nonummy nibh euismod</p>
            </div>
          </div>
        </div>
        <!--/slide -->
      </div>
      <div class="timers"></div>
      <div class="slidePrev"><span></span></div>
      <div class="slideNext"><span></span></div>
    </div>
      

   
      <main role="main">

          @yield('content')

      </main>

      <div class="footer">
        <div class="footer-top">
          <div class="wrap">
            <div class="section group example">
            <div class="col_1_of_2 span_1_of_2">
              <ul class="f-list">
                <li><img src="{{ asset('images/2.png') }}"><span class="f-text">Free Shipping on orders over $100</span><div class="clear"></div></li>
              </ul>
            </div>
            <div class="col_1_of_2 span_1_of_2">
              <ul class="f-list">
                <li><img src="{{ asset('images/3.png') }}"><span class="f-text">Call us! toll free-0963 416 058 </span><div class="clear"></div></li>
              </ul>
            </div>
            <div class="clear"></div>
              </div>
          </div>
        </div>
          <div class="footer-middle">
            <div class="wrap">
    

              <div class="section group example">
                <div class="col_1_of_f_1 span_1_of_f_1">
                  <div class="section group example">
                    <div class="col_1_of_f_2 span_1_of_f_2">
                      <h3>Facebook</h3>
                      <script>
                        (function(d, s, id) {
                          var js,
                            fjs = d.getElementsByTagName(s)[0];
                          if (d.getElementById(id)) return;
                          js = d.createElement(s);
                          js.id = id;
                          js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                          fjs.parentNode.insertBefore(js, fjs);
                        })(document, "script", "facebook-jssdk");
                      </script>
                      <div class="like_box">
                        <div
                          class="fb-like-box"
                          data-href="https://www.facebook.com/tdc.fit/"
                          data-colorscheme="light"
                          data-show-faces="true"
                          data-header="true"
                          data-stream="false"
                          data-show-border="true"
                        ></div>
                      </div>
                    </div>
                    <div class="col_1_of_f_2 span_1_of_f_2 account" style="padding-left: 30px">
                      <h3>Account</h3>
                      <ul class="f-list1">
                        <li><a href="#">Accout</a></li>
                        <li><a href="#">Log in</a></li>
                        <li><a href="#">Latest News</a></li>
                        <li><a href="#">My orders</a></li>
                        <li><a href="#">Log out</a></li>
                        <li><a href="#">Register</a></li>
                    
                      </ul>
                    </div>
                    <div class="clear"></div>
                  </div>
                </div>
                <div class="col_1_of_f_1 span_1_of_f_1">
                  <div class="section group example">
                    <div class="col_1_of_f_2 span_1_of_f_2">
                      <h3>Information</h3>
                      <ul class="f-list1">
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Collections</a></li>
                        <li><a href="#">Catalog</a></li>
                    
                      </ul>
                    </div>
                    <div class="col_1_of_f_2 span_1_of_f_2">
                      <h3>Contact us</h3>
                      <div class="company_address">
                        <p>FIT - TDC</p>
                        <p>CD18TT1</p>
                        <p>TPHCM, VN</p>
                        <p>Phone: 0963 416 058</p>
                        <p>Fax: 39 39 39 39</p>
                        <p>Website: <span>leoshop.epizy.com</span></p>
                      </div>
                      <div class="social-media">
                        <ul>
                          <li>
                            <span
                              class="simptip-position-bottom simptip-movable"
                              data-tooltip="Google"
                              ><a href="#" target="_blank"> </a
                            ></span>
                          </li>
                          <li>
                            <span
                              class="simptip-position-bottom simptip-movable"
                              data-tooltip="Linked in"
                              ><a href="#" target="_blank"> </a>
                            </span>
                          </li>
                          <li>
                            <span
                              class="simptip-position-bottom simptip-movable"
                              data-tooltip="Rss"
                              ><a href="#" target="_blank"> </a
                            ></span>
                          </li>
                          <li>
                            <span
                              class="simptip-position-bottom simptip-movable"
                              data-tooltip="Facebook"
                              ><a href="#" target="_blank"> </a
                            ></span>
                          </li>
                        </ul>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </div>
                <div class="clear"></div>
              </div>
            </div>
          </div>
          <div class="footer-bottom">
            <div class="wrap">
            <p style="text-align: center; color: #fff">Copyright &copy; 2019 - Design by Dao Hoc Van - Ho Duc Long - Phan Van Phuc Em </p>
              
              <div class="clear"></div>
            </div>
            <a href="" class="scrollup"><i class="fa fa-angle-up active"></i></a>
           
          </div>
      </div>
  
  </body>
</html>
