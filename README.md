# ValidateVKN

Vergi kimlik numarası 10 haneden oluşmaktadır. İlk 9 hanesi gerçek numara bilgisini tutmakta, 10. hanesi de kontrol/doğrulama amaçlı eklenmiştir.

Vergi numarasının ilk 9 rakamına sırayla 10 eklenip sıra değeri (en büyük basamak değeri 1 ve en küçük basamak değeri 9 kabul edilir) çıkarılır, çıkan sonucun modül 10'a göre değeri alınır. Elde edilen değer 9 ise bir işlem yapmadan bırakılır. 9 dan farklı bir rakam elde edildi ise değer 2'nin 10 eksi sıra değeri kuvveti ile çarpılıp, modül 9 a göre değeri ele alınır. Tüm rakamlar için bu işlemler tekrar edildiğinde yeni elde edilen bu 9 rakam toplanır ve modül 10'a göre değeri hesaplanır. Elde ettiğimiz rakam 10 dan çıkarılır ve tekrar modül 10'a göre değeri vergi numaramızın 10. rakamımızı verir.

Biraz daha matematiksel olarak ifade etmek gerekirse ;

Vergi Numarasının ilk 9 rakamı için d, kontrol basamağı için c kullanırsak :

Vergi No = d1 d2 d3 d4 d5 d6 d7 d8 d9 c1

İlk 9 rakam olan d1..d9 değerlerini i = 1..9 için d[i] olarak ifade edersek;

p[i] = (d[i] + 10 - i) mod 10

p[i] = 9 => q[i] = 9
p[i] != 9 => q[i] = (p[i] * 2^(10 - i)) mod 9

c1 = (10 - (Σ q[i] mod 10)) mod 10

-----------

Örneğin Vergi Kimlik Numarası : 018273645x olsun.

p[1] = ( d[1] + 10 - 1 ) mod 10 = (0 + 10 - 1) mod 10 = 9

p[2] = ( d[2] + 10 - 2) mod 10 = (1 + 10 - 2) mod 10 = 9

p[3] = ( d[3] + 10 - 3 ) mod 10 = (8 + 10 - 3) mod 10 = 5

p[4] = ( d[4] + 10 - 4 ) mod 10 = (2 + 10 - 4) mod 10 = 8

p[5] = ( d[5] + 10 - 5 ) mod 10 = (7 + 10 - 5) mod 10 = 2

p[6] = ( d[6] + 10 - 6 ) mod 10 = (3 + 10 - 6) mod 10 = 7

p[7] = ( d[7] + 10 - 7 ) mod 10 = (6 + 10 - 7) mod 10 = 9

p[8] = ( d[8] + 10 - 8 ) mod 10 = (4 + 10 - 8) mod 10 = 6

p[9] = ( d[9] + 10 - 9 ) mod 10 = (5 + 10 - 9) mod 10 = 6



-------------



q[1] = 9

q[2] = 9

q[3] = (p[3] * 2^(10 - 3)) mod 9 = (5 * 2^7) mod 9 = 1

q[4] = (p[4] * 2^(10 - 4)) mod 9 = (8 * 2^6) mod 9 = 8

q[5] = (p[5] * 2^(10 - 5)) mod 9 = (2 * 2^5) mod 9 = 1

q[6] = (p[6] * 2^(10 - 6)) mod 9 = (7 * 2^4) mod 9 = 4

q[7] = 9

q[8] = (p[8] * 2^(10 - 8)) mod 9 = (6 * 2^2) mod 9 = 6

q[9] = (p[9] * 2^(10 - 9)) mod 9 = (6 * 2^1) mod 9 = 3


i = 1..9 için Σ q[i] = 9 + 9 + 1 + 8 + 1 + 4 + 9 + 6 + 3 = 50

c1 = (10 - (Σ q[i] mod 10)) mod 10 = (10 - 50 mod 10) mod 10

c1 = (10 - 0) mod 10 = 0


Vergi Kimlik Numarası 0182736450
