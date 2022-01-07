import 'dart:io';

import 'sections/about_us.dart';

List<Product> products = [
  Product(
    title: 'White Stag',
    subtitle: 'Vodka',
    rrp: 38,
    blurb:
        'One of the highest purity vodkas you will experience. So smooth you will hardly know its in your drink.',
    image: '',
  ),
  Product(
    title: 'Citrus',
    subtitle: 'Ginnie in a bottle',
    rrp: 46,
    blurb:
        'A clean, crisp Gin with a light citrus punch. A great summer drink goes excellent with a Gin and Tonic.',
    image: '',
  ),
  Product(
    title: 'Citrus Sapphire',
    subtitle: 'Ginnie in a bottle',
    rrp: 46,
    blurb:
        'Limited edition butterfly pea version of the Citrus Ginnie in a bottle. Changes colour to a beatutiful magenta when you add soda or gin and tonic.',
    image: '',
  ),
  Product(
    title: 'Traditional Fine Gin',
    subtitle: 'Ginnie in a bottle',
    rrp: 46,
    blurb:
        'Juniper, coriander, cardamom, angelica root & just a hint of citrus. Because its traditional does not mean its boring. Feedback from our testers is that its one of the best gins they have ever had. Don\'t believe it? Come on in a try it out.',
    image: '',
  ),
  Product(
    title: 'Traditional Butterfly Pea',
    subtitle: 'Ginnie in a bottle',
    rrp: 46,
    blurb:
        'The same recipe as the traditional fine gin, but infused with butterfly pea flower to make a magical colour changing experience.',
    image: '',
  ),
  Product(
    title: 'Cloak & Dagger',
    subtitle: 'Rebellion Rum Co',
    rrp: 44,
    blurb:
        'A true aussie sugar cane spirit, excellent with coke. If you are tired of Bundy and want to give something else a try, this is for you.',
    image: '',
    inStock: false
  ),
];

final outOfStockTile = """
<div class='out-of-stock'>TEMPORARILY OUT OF STOCK</div>
""";

main() async {
  final site = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Rebellion Rum Co - Yatala Gin, Vokda & Rum Distillery</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Maven+Pro:wght@400;600&family=Neuton:wght@300;700;800&display=swap"
          rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            margin: 0;
            padding: 0;
            background: url(images/background.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: white;
            font-family: 'Maven Pro', sans-serif;
        }

        .logo img {
            margin: auto;
            display: block
        }

        header {
            display: block;
            position: fixed;
            top: 0;
            width: 100%;
        }

        .hero {
            background: url(images/hero_backgorund.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            min-height: 100vh;
            width: 100%;
            color: white;
        }

        h1, h2, .small-head{
            font-family: 'Neuton', sans-serif;
            color: white;
            font-weight: 800;
            line-height: 0.8;
            padding-bottom: 10px;
        }

        h3, h4, h5 {
            font-weight: 600;
        }

        h1 {
            font-size: 48pt
        }

        h2 {
            font-size: 42pt
        }

        h3 {
            font-size: 30pt
        }

        h4 {
            font-size: 24pt
        }

        h5 {
            font-size: 20pt
        }
        
        .small-head {
          font-size: 16pt;
        }

        .product-tile h2 {
            color: #FEE7C5;
        }

        .product-tile h3 {
            text-transform: uppercase;
            font-size: 22pt;
        }

        .hero-padding {
            padding-top: 134px;
        }

        img.responsive {
            max-width: 100%;
            max-height: 100%
        }

        .row {
            display: flex;
            flex-direction: column
        }

        .row.reverse {
            display: flex;
            flex-direction: column-reverse
        }

        .col-1 {
            flex: 1
        }

        .col-2 {
            flex: 2
        }

        .col-3 {
            flex: 3
        }

        .col-4 {
            flex: 4
        }

        .col-5 {
            flex: 5
        }

        .col-6 {
            flex: 6
        }

        .col-7 {
            flex: 7
        }

        .col-8 {
            flex: 8
        }

        .col-9 {
            flex: 9
        }

        .col-10 {
            flex: 10
        }

        .col-11 {
            flex: 11
        }

        .col-12 {
            flex: 12
        }

        .price-discount {
            font-size: 36pt;
            color: white;
        }

        .special-price {
            font-size: 36pt;
        }

        .red-strikethrough {
            color: red;
            text-decoration: line-through
        }

        .vertical-center {
            align-items: center;
            display: flex;
        }

        .responsive-right {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .row > div {
            padding-left: 30px;
            padding-right: 30px;
        }

        hr {
            border-top: 3pt solid #F1DBB4;
        }

        .product-tile {
            padding-top: 40px;
        }

        .responsive-left {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .special-price-badge {
            font-size: 13pt;
            padding: 7px;
            background: red;
            border-radius: 9px;
            text-transform: uppercase;
            margin: 20px 6px 6px;
        }

        .price-row {
            justify-content: center;
            display: flex;
            align-items: flex-end;
        }

        .blurb {
            margin: 16px;
        }
        
        .out-of-stock {
          padding: 10px;
          margin: 10px;
          color: white;
          background-color: red;
        }
        
        a {
            color: white;
    text-decoration: none;
    }
    
    .responsive-text-center {
      text-align: center;
    }

        @media only screen and (min-width: 960px) {
            .row {
                flex-direction: row
            }
            
                .responsive-text-center {
      text-align: left;
    }

            .row.reverse {
                display: flex;
                flex-direction: row
            }

            .responsive-right {
                align-items: flex-end
            }
            
            .responsive-left {
              align-items: flex-start;
            }

            .row > div {
                padding: 30px
            }
        }
    </style>
</head>
<body>

<header>
    <div class="logo"><img src="images/header_logo.png" alt="Rebellion Rum Logo" class="responsive"></div>
</header>

<section class="hero">
    <div class="hero-padding"></div>
    <div class="container">
        <div class="row reverse">
            <div class="col-6 responsive-right">
                <img src="https://via.placeholder.com/450" class="responsive" alt="" style="padding: 10px">
            </div>
            <div class="col-6 vertical-center responsive-text-center">
                <div>
                    <h1>OPENING SALE ON NOW</h1>
                    <hr>
                    <h3>All bottles \$30</h3>
                </div>
            </div>
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
    <img src="${'https://via.placeholder.com/450' ?? e.image}" alt="${e.title} ${e.subtitle} Bottle">
    </div>
    </div>""";

    final infoSection = """
  <div class="col-6 ${isOdd ? 'responsive-left' : 'responsive-right'}" style="justify-content: center">
                <div style="text-align: center; max-width: 300px">
                    ${e.inStock ? '' : outOfStockTile}
                    <h2>${e.title}</h2>
                    <h3>${e.subtitle}</h3>
                    <div class="strength">${e.volume}ml / ${e.strength * 100}% Alc. Vol.</div>
                    <div class="price-row">
                        <div class="red-strikethrough">
                            <div class="price-discount">\$${e.rrp}</div>
                        </div>
                        <div class="special-price">
                            <div class="special-price-badge">Special Price</div>
                            \$${e.salePrice}
                        </div>
                    </div>
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

  await File('index-2.html').writeAsString(site);
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
