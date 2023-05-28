<!DOCTYPE html>
<html>
<head>

	<title>about</title>
	<link rel="stylesheet" type="text/css" href="admin/assets/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<!-- Bootstrap -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of 
         HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom CSS -->
    <link href="assets/style.css" rel="stylesheet">

    <style>

      #header .headerBackground{
  width: 1520px;
  height: 250px;
  background: url(img/background.jpg);
  background-size: cover; 
}

    #header{
      background: blue;
      width: 940px;
      height: 240px;
    }
    h1{
      padding-top: 0px;
    }
    article {
      background-color: white;
    }


* {box-sizing:border-box}
body {font-family: Verdana,sans-serif;}
.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 50%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 9px;
  width: 9px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

    
  </style>
  <body>
     <div id="container">
    <div id="header">
      <div class="headerBackground">
        <h1><font color="#f8192e"><br><br><b>&nbsp;&nbsp;Multibook</font><font color="#ffffff"> Store</font></b></h1>
      </div>
    </div>
  <body>

  <!-- navbar -->
  <nav class="navbar navbar-default" style="background: lightblue;" >
    <div class="container" style="background: lightblue;">
      <ul class="nav navbar-nav">
        <!-- Jika Sudah Login-->
        <?php if (isset($_SESSION['pelanggan'])): ?>
        <li><a href="logout.php" onclick="return confirm('Apakah Anda Yakin ?')">Logout</a></li>
        <li><a href="riwayat.php">Riwayat</a></li>
        <!-- Jika Sudah Belum Login-->
        <?php else: ?>
        <li><a href="login.php">Login</a></li>
        <li><a href="daftar.php">Daftar</a></li>
        <li><a href="about.php">About</a></li>
        <?php endif ?>        
        <li><a href="index.php">Belanja</a></li>
        <?php if(!isset($_SESSION["keranjang"])) : ?>
          <li><a href="rekomendasi.php">Rekomendasi</a></li>
          <li><a href="keranjang.php">Keranjang<strong>(0)</strong></a></li>
        <?php else : ?>
        <hide>
            <?php $jml=0; ?>
            <?php foreach ($_SESSION["keranjang"] as $id_produk => $jumlah): ?>
            <!-- Menampilkan Produk Perulangan Berdasarkan id_produk-->
            <?php $ambildata = $koneksi->query("SELECT * FROM produk WHERE id_produk='$id_produk'"); ?>
            <?php $pecah = $ambildata->fetch_assoc(); ?>
            <tr>
              <td><?php $jumlah ?></td>
            </tr>
            <?php $jml += $jumlah; ?>
            <?php endforeach ?>
        </hide>
        <li><a href="rekomendasi.php">Rekomendasi</a></li>
        <li><a href="keranjang.php">Keranjang<strong>(<?php echo $jml ?>)</strong></a></li>
      <?php endif ?>
        <li><a href="bayar.php">Pembayaran</a></li>
      </ul>

      <form action="pencarian.php" method="get" class="navbar-form navbar-right">
        <input type="text" name="keyword" class="form-control" placeholder="Pencarian">
        <button class="btn btn-primary">Cari</button>
      </form>

    </div>
  </nav>

<section class="myCarousel" id="myCarousel">
        <div class="myCarousel">
            <div class="row">
                <div class="col-sm-12 text-center">
                   <img src="img/store.png" width="128px" height="128px"><br>
                    <h1><b><font color="#f8192e">Multibook</font>Store</b></h1>
                    <p><h4><font color="#f8192e">Toko Buku Terupdate dan Terlengkap</font></p><h4>
             <hr>
         </div>
      </div>
   </div>

   <div id="main">
    <div id="content">
        <section>
            <div class="container">
                <h1>TOKO ONLINE BUKU MULTIBOOK STORE</h1>
                <p> TOKO ONLINE merupakan toko yang semua proses transaksinya dilakukan secara digital melalui perantara device yang digunakan oleh pembeli dan penjual. Tentunya untuk mendapatkan kesepakatan dalam kegiatan jual beli. Sedangkan dalam artian secara luasnya, online shop merupakan tempat di mana penjual dan pembeli tidak bertemu secara fisik. Di sini pembeli ditawarkan barang dalam bentuk display yang disediakan penjual sebagai gambaran dari produk yang akan dibeli oleh konsumennya.</p>
                <p>Adapun perangkat yang dapat digunakan untuk belanja online ini sangat beragam, mulai dari laptop, komputer, handphone, Buku,  dan tablet. Selain perangkat, pastinya kamu membutuhkan jaringan internet agar bisa mengakses toko online dengan maksimal.Bukan hanya dari website dan aplikasi saja, terkadang belanja online bisa juga dilakukan melalui media sosial. Saat ini, media sosial yang sering dijadikan untuk media berjualan adalah Instagram. Sudah ada banyak UMKM yang menjual produknya ke masyarakat luas melalui media sosial Instagram. Bahkan, sudah ada yang menjual produk secara live stream, sehingga kita akan menemukan teks negosiasi pada live stream tersebut.</p>
        <center>
        <marquee scrollamount="14">
        <h3 style="font-family: Rockwell;color: orange"><i class="fas fa-bullhorn"></i> YANG SUKA MEMBACA BUKU TERBARU DAN BERKUALITAS !!?? LANGSUNG SAJA BELI DI TOKO ONLINE HARGA TERJANGKAU BURUAN BELI SEBELUM KEHABISAN!!! <i class="fas fa-thumbs-up"></i></h3> </marquee>
        </center>
       </div>
      </section>
    </div> 

<!-- Bagian footer -->

    <div class="row" style="background: lightblue;">
      <nav class="footer">
            <footer class="copyright text-center"><p>&copy; MuhammadEzra</p></footer>
        </div>
      </nav>
    </div>
</body>
</html>
  </body>
  </html>