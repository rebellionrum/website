import 'dart:io';

import 'sections/about_us.dart';

List<Product> products = [
  Product(
    title: 'White Stag',
    subtitle: 'Vodka',
    rrp: 38,
    blurb:
        'One of the highest purity vodkas you will experience. So smooth you will hardly know its in your drink.',
    image: 'images/product_shots/whitestag.jpg',
  ),
  Product(
    title: 'Lemon, Blood Orange, & Lime',
    subtitle: 'Ginnie in a bottle',
    rrp: 46,
    blurb:
        'A clean, crisp Gin with a light citrus punch. A great summer drink goes excellent with a Gin and Tonic.',
    image: 'images/product_shots/citrus.jpg',
  ),

  Product(
    title: 'Traditional Fine Gin',
    subtitle: 'Ginnie in a bottle',
    rrp: 46,
    blurb:
        'Juniper, coriander, cardamom, angelica root & just a hint of citrus. Because its traditional does not mean its boring. Feedback from our testers is that its one of the best gins they have ever had. Don\'t believe it? Come on in a try it out.',
    image: 'images/product_shots/traditional.jpg',
  ),
  Product(
    title: 'Traditional Butterfly Pea',
    subtitle: 'Ginnie in a bottle',
    rrp: 46,
    blurb:
        'Our traditional dry gin infused with butterfly pea flower to make a magical colour changing experience.',
    image: 'images/product_shots/traditional_blue.jpg',
    inStock: true
  ),
  Product(
    title: 'Cloak & Dagger',
    subtitle: 'Rebellion Rum Co',
    rrp: 44,
    blurb:
        'A true aussie sugar cane spirit, excellent with coke. If you are tired of Bundy and want to give something else a try, this is for you.',
    image: 'images/product_shots/cloak&dagger.jpg',
    inStock: false
  ),
];

final outOfStockTile = """
<div class='out-of-stock'>TEMPORARILY OUT OF STOCK.</div>
""";

main() async {
  products.sort((a,b)=>a.inStock && b.inStock == false ? -1 : 1);
  final site = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>OPENING SPECIAL \$30/ea - Rebellion Rum Co - Yatala Gin, Vodka & Rum Distillery</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Maven+Pro:wght@400;600&family=Neuton:wght@300;700;800&display=swap"
          rel="stylesheet">
    <style>
        
    </style>
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-V3QD1N4YKW"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-V3QD1N4YKW');
</script>
</head>
<body>

<div class='under-18-check'>
</div>

<header>
    <div class="logo"><img src="images/header_logo.png" alt="Rebellion Rum Logo" class="responsive"></div>
</header>

<section class="hero">
    <div class="hero-padding"></div>
    <div class="container">
        <!--<div class="row reverse">
            <div class="col-6 responsive-right">
                <img src="images/hero_masthead.jpg" class="responsive" alt="" style="padding: 10px">
            </div>
            <div class="col-6 vertical-center responsive-text-center">
                <div>
                    <h1>OPENING SALE ON NOW</h1>
                    <hr>
                    <h3>All bottles \$30</h3>
                </div>
            </div>
            -->
        </div>
    </div>
</section>

${products.map((e) {
  final index = products.indexOf(e);
  final modCalc = index %2;
  print('modcalc $modCalc');
    final isOdd =  modCalc == 1;
    final imageSection =
        """<div class="col-6 ${isOdd ? 'responsive-right' : 'responsive-left'}">
    <div>
    <img src="${e.image}" alt="${e.title} ${e.subtitle} Bottle" height='600px' class='responsive'>
    </div>
    </div>""";

    final infoSection = """
  <div class="col-6 ${isOdd ? 'responsive-left' : 'responsive-right'}" style="justify-content: center">
                <div style="text-align: center; max-width: 300px">
                    ${e.inStock ? '' : outOfStockTile}
                    <h2>${e.title}</h2>
                    <h3>${e.subtitle}</h3>
                    <div class="strength">${e.volume}ml / ${e.strength * 100}% Alc. Vol.</div>
                    ${e.inStock == false ? """OUT OF STOCK""" : """
                    <div class="price-row">
                        <div class="red-strikethrough">
                            <div class="price-discount">\$${e.rrp}</div>
                        </div>
                        <div class="special-price">
                            <div class="special-price-badge">Special Price</div>
                            \$${e.salePrice}
                        </div>
                    </div>"""}
                    <div class="blurb">${e.blurb}
                    </div>
                </div>

            </div>""";

    return """
<section class="product-tile">

    <div class="container">
        <div class="row ${isOdd ? '' : 'reverse'}">
        ${isOdd ? imageSection : infoSection }
        ${isOdd ? infoSection : imageSection }
        </div>
    </div>
</section>""";
  }).join()}
  
  ${aboutUs()}

</body>
</html>
  """;

  await File('index.html').writeAsString(site);
}

class Product {
  final String title;
  final String subtitle;
  final int volume;
  final double strength;
  final double rrp;
  final double salePrice;
  final String blurb;
  final String image;
  final bool inStock;

  Product(
      {required this.title,
      required this.subtitle,
      this.volume = 700,
      this.strength = .4,
      required this.rrp,
      this.salePrice = 30,
      required this.blurb,
      required this.image,
      this.inStock = true});
}
