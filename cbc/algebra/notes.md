VECTORES
========

Vectores en R² y R³

Vectores equivalentes: igual direccion longitud y sentido.

A = (a₁, a₂, …, an) B = (b₁, b₂, …, bn)

* A + B = (a₁+b₁, a₂+b₂, …, an+bn)
* Si c pertenece a R, c(A) = (c(a₁), c(a₂), …, c(an))

Propiedades:

1) A + (B + C) = (A + B) + C
2) A + B = B + A
3) Si c pertenece a R, c(A + B) = c(A) + c(B)
4) Si c₁, c₂ pertenecen a R, (c₁ + c₂)(A) = c₁(A) + c₂(A) y (c₁c₂)(A) = (c₁)(c₂A)
5) Ō + A = A
6) (1) (A) = A
7) A + (-1)(A) = 0
8) ŌA = Ō

* Siendo a, b, c y d puntos, ab es equivalente a cd sii (d - c) = (b - a)
* AB // CD sii (B - A) = k(D - C) y k ≠ 0.

Punto Medio
===========

  P1/2(A, B) = 1/2(A+B) = (1/2)A + (1/2)B

Segmento
========

  Existe t perteneciente a [0; 1] tal que X = (t)A + (1-t)B
  (si t = 0.5 se obtiene el punto medio)

NORMA
=====

La norma de un vector es una medida de su longitud.

  ||A|| = sqrt(a₁² + a₂² + … + an²)

Propiedades:

1) Si A = Ō, ||A|| = 0, si A ≠ Ō, entonces ||A|| > 0
2) ||A|| = ||-A||
3) Si c pertenece a R, ||(c)(A)|| = |c| ||A||
4) ||A + B|| ≤ ||A|| + ||B||

DISTANCIA
=========

La distancia entre los puntos A y B: es igual a la norma del vector AB:

d(A, B) = ||B - A|| = sqrt((b₁ - a₁)² + (b₂ - a₂)² + … + (bn - an)²)

d(A, A) = 0

PRODUCTO ESCALAR (inner product)
================================

A.B = a₁b₁ + a₂b₂ + … + anbn

Propiedades:

1) A.B = B.A
2) A.(B + C) = A.B + A.C = (B + C).A
3) Si k pertence a R, (kA).B = k(A.B) = A.(kB)
4) Si A = Ō, A.A = 0. Si A ≠ Ō, A.A > 0.
5) |A.B| ≤ ||A|| ||B||
6) ||A|| = sqrt(A.A)
7) A.Ō = 0

Un vector con modulo 1 se obtiene a partir de cualquier otro dividiendo por su modulo:

Ū = A / ||A||

El angulo theta entro dos vectores A y B (siempre ≤ pi) se obtiene mediante:

A.B = ||A|| ||B|| cos(theta)

* Si A y B son ortogonales, theta = pi/2, entonces A.B = 0
* Si A y B son paralelos, entonces theta = 0 o theta = pi, por lo tanto:

  A.B =    ||A|| ||B||   (theta = 0), o
  A.B = -( ||A|| ||B|| ) (theta = pi)

Proyecciones
============

  proj-B(A) = ( A.B  )(B)
               ||B||²

  proj-A(B) = ( A.B  )(A)
               ||A||²

Cosenos directores
==================

cos alpha = A.i / ||A|| = a₁ / ||A||
cos beta  = A.j / ||A|| = a₂ / ||A||
cos gamma = A.k / ||A|| = a₃ / ||A||

U (v. unitario de A):

  U = <cos alpha, cos beta, cos gamma>

A en funcion de su vector cosenos-directores:

  A = ||A|| * <cos alpha, cos beta, cos gamma>

Rectas alabeadas
================

Cuando dos rectas en R³ no son paralelas ni se cruzan.

Producto Vectorial (R³)
=======================

A = <a₁, a₂, a₃>,
B = <b₁, b₂, b₃>
AxB = <a₂b₃-a₃b₂, a₃b₁-a₁b₃, a₁b₂-a₂b₁> (otro vector en R³)

Propiedades:

1) AxB = -BxA
2) Ax(B+C) = AxB + AxC
   (B+C)xA = BxA + CxA

3) Si k pertenece a R, (kA)xB = k(AxB) = Ax(kB)
4) AxA = Ō
5) AxB es un vector perpendicular a A y B.
6) ||AxB||² = ||A||² + ||B||² - (A.B)²

7) ||AxB|| = ||A|| ||B|| |sen(theta)| (theta es el angulo entre A y B)
   Geometricamente, ||AxB|| es el area del parelelogramo de vertices O, A, B, A+B

8) (UxV).W = U.(VxW)

Si A y B son paralelos, el angulo entre A y B es o 0 o pi, entonces:
  sen(theta) = 0, entonces ||AxB|| = ||A|| ||B|| sen(theta) = 0
  pero el unico vector de norma 0 es Ō, entonces: AxB = Ō

Si AxB ≠ Ō entonces AxB es perpendicular a A y a B.

Si A, B y C son vectores, el volumen del parelelepipedo definido entre ellos es:
  (AxB).C

Si los 3 vectores apuntan a puntos del mismo plano, el calculo del volumen
comprendido debe dar 0:

  A.(BxC) = |a₁ a₂ a₃| = a₁(b₂c₃-b₃c₂) - a₂(b₁c₃-b₃c₁) + a₃(b₁c₂-b₂c₁) = 0
            |b₁ b₂ b₃|
            |c₁ c₂ c₃|
Planos
======

     z
     |
     |
    / \
  x/   \y

* Plano xy: Plano de todos los puntos de la forma <x, y, 0> (aka z = 0)
* Plano xz: Plano de todos los puntos de la forma <x, 0, z> (aka y = 0)
* Plano yz: Plano de todos los puntos de la forma <0, y, z> (aka x = 0)

Si Q = <x, y, z>, entonces <x, y, 0> es la proyeccion del punto en el plano xy.
Si Q = <x, y, z>, entonces <x, 0, z> es la proyeccion del punto en el plano xz.
Si Q = <x, y, z>, entonces <0, y, z> es la proyeccion del punto en el plano yz.

Ecuacion Lineas en R³
=====================

Una recta se define en el espacio segun un vector paralelo y un punto que la contenga, tal que:

Si V = <a, b, c> es el vector director y P₀ = <X₀, Y₀, Z₀> el punto de la recta:

  R = P₀ + tV = <X₀, Y₀, Z₀> + t <a, b, c> = <x, y, z> de la recta (forma vectorial).

La forma parametrica se calcula en funcion de cada variable x, y, z:

    <x, y, z> = <X₀+ta, Y₀+tb, Z₀+tc>, entonces:

    x = X₀+ta
    y = Y₀+tb
    z = Z₀+tc

Despejando t de todas estas ecuaciones se obtiene la forma simetrica:

   (x - X₀) / a = (y - Y₀) / b = (z - Z₀) / c

En la forma simetrica, si a, b o c es = 0 se remueve la ecuacion y se coloca
x = x0, y = y0 o z = z0 segun corresponda.

Ecuacion de Planos en R³
========================

Siendo P₀ un punto del plano, n un vector normal al plano, P un punto cualquiera
del plano, r el vector OP y r₀ el vector OP₀:

* r-r₀ es un vector contenido en el plano
* Si r-r₀ esta contenido en el plano entonces el producto escalar con la normal
  debe ser 0.

  n.(r-r₀) = 0

Esta es la forma vectorial del plano. Desarrollando:

  n = <a, b, c>
  r = <X, Y, Z>
  r₀ = <X₀, Y₀, Z₀>

  <a, b, c> . (<X, Y, Z> - <X₀, Y₀, Z₀>) = 0

  a(X - X₀) + b(Y - Y₀) + c(Z - Z₀) = 0

Esta es la forma escalar del plano. Distribuyendo:

  aX + bY + cZ = (aX₀ + bZ₀ + cZ₀ = d)

Esta es una forma habitual en la que se presenta la ecuacion escalar del plano.
Los factores que acomañan a X, Y y Z son los componentes del vector normal al
plano.

Distancia punto-plano
=====================

Es la menor distancia desde el punto a los infinitos puntos del plano.

Esta distancia corresponde a la perpendicular trazada desde el punto al
plano.

Si P = <X0, Y0, Z0) y Pi = AX +BY +CZ + D = 0

D(P, Pi) = |AX0 + BY0 +CZ0 + D| / sqrt(A² + B² + C²)

Distancia entre planos paralelos: Se calcula hallando la distancia a un
punto cualquiera de uno de ellos al otro. Si los planos comparten la
normal, se puede calcular como:

P1 = Ax + By + Cz + D1 = 0
P2 = Ax + By + Cz + D2 = 0

D(P1, P2) = |D2 - D1| / sqrt(A² + B² + C²)
