doc ///
  Key
    gbw
    (gbw, Ideal, List)
    (gbw, Matrix, List)
  Headline
    Groebner bases w.r.t. a weight
  Usage
    gbw(I,w)
    gbw(M,w)
  Inputs
    I:Ideal
      in the Weyl algebra
    M:Matrix
      with entries in the Weyl algebra
    w:List
      of weights
  Outputs
    gbI:Ideal
      with the generators forming a Groebner basis of the ideal with respect to the weight vector
    gbM:Matrix
      with the columns forming a Groebner basis of the submodule generated by the columns of the
      matrix with respect to the weight vector
  Description
    Text
     This routine computes a Groebner basis of a left ideal @EM "I"@ of the Weyl algebra with
      respect to a weight vector @EM "w = (u,v)"@ where  @EM "u+v >= 0"@.
     In the case where @EM "u_i+v_i > 0"@ for all @EM"i"@, the ordinary Buchberger algorithm works for any 
     term order refining the weight order.
     If there exists @EM "i"@ so that @EM "u_i+v_i = 0"@ the Buchberger algorithm needs to be adapted to 
     guarantee termination.
     There are two strategies for doing this. One is to homogenize to an ideal of the 
     homogeneous Weyl algebra.
     The other is to homogenize with respect to the weight vector @EM "w"@. More
     details can be found in 
     [@HREF("https://mathscinet.ams.org/mathscinet/pdf/1734566.pdf","SST")@, Sections 1.1 and 1.2].
    Example
      makeWA(QQ[x,y])
      I = ideal (x*dx+2*y*dy-3, dx^2-dy)
      gbw(I, {1,3,3,-1})
      gbw(I, {-1,-3,1,3})
  Caveat
    The weight vector @EM "w = (u,v)"@ must have @EM "u+v>=0"@.
  SeeAlso
    inw
    setHomSwitch
///

doc ///
  Key
    inw
    (inw, Matrix, List)
    (inw, RingElement, List)
    (inw, Ideal, List)
  Headline
    initial form/ideal w.r.t. a weight
  Usage
    inw(F,w)
    inw(I,w)
    inw(M,w)
  Inputs
    F:RingElement
    I:Ideal
    M:Matrix
    w:List
      of weights
  Outputs
    inF:RingElement
      the initial form of @EM "F"@ with respect to the weight vector
    inI:Ideal
      the initial ideal of @EM "I"@ with respect to the weight vector
    inM:Matrix
      with the columns generating the initial module of the image of @EM "M"@ with respect to the weight vector
  Description
    Text
      This routine computes the initial ideal of a left ideal @EM "I"@
      of the Weyl algebra with respect to a weight vector @EM "w = (u,v)"@
      where @EM "u+v >= 0"@.
      In the case where @EM "u+v > 0"@, then the ideal lives in the
      associated graded ring which is a commutative ring.
      In the case where u+v = 0, then the ideal lives in the associated
      graded ring which is again the Weyl algebra.
      In the general case @EM "u+v >= 0"@ the associated graded ring is
      somewhere between. There are two strategies to compute the initial
      ideal. One is to homogenize to an ideal of the homogeneous Weyl algebra.
      The other is to homogenize with respect to the weight vector @EM "w"@.
       For more details, see [@HREF("https://mathscinet.ams.org/mathscinet/pdf/1734566.pdf","SST")@, Sections 1.1 and 1.2].
    Example
      makeWA(QQ[x,y])
      I = ideal (x*dx+2*y*dy-3, dx^2-dy)
      inw(I, {1,3,3,-1})
      inw(I, {-1,-3,1,3})
  Caveat
    The weight vector @EM "w = (u,v)"@ must have @EM "u+v>=0"@.
  SeeAlso
    gbw
    setHomSwitch
///

doc ///
   Key
     Fourier
     (Fourier,Matrix)
     (Fourier,RingElement)
     (Fourier,Ideal)
     (Fourier,Module)
     (Fourier,ChainComplex)
   Headline
     Fourier transform for Weyl algebra
   Usage
    Fourier A
   Inputs
     A:{Matrix, RingElement, Ideal, ChainComplex}
       over the Weyl algebra
   Outputs
     :{Matrix, RingElement, Ideal, ChainComplex}
       the Fourier transform of @TT "A"@ as a matrix, function, ideal, or chain complex over the Weyl algebra
   Description
    Text
      The Fourier transform is the automorphism of the Weyl algebra
      that sends @EM {"x",SUB "i"}@ to @EM {"-D", SUB "i"}@
      and @EM  {"D", SUB "i"}@ to @EM {"x",SUB "i"}@. In order to compute the Fourier transform of the finitely generated module M, we compute 
      the Fourier transform of the matrix A of which M is the cokernel.
    Example
      makeWA(QQ[x,y])
      A = matrix{{2*x^2+1,y*dy},{9*x*dx, x*y*dx^2}}
      Fourier A
      L = x^2*dy + y*dy^2 + 3*dx^5*dy
      Fourier L
      I = ideal(8*x*y*dy^3+y^5, dx^7+5)
      Fourier I
      C = chainComplex{matrix{{x*dx, y^2+dx}},matrix{{dx*dy},{y^2*dy^3}}}
      FC = Fourier C
      FC.dd
   SeeAlso
     WeylAlgebra
///

doc ///
   Key
     Dtransposition
     (Dtransposition,Matrix)
     (Dtransposition,Ideal)
     (Dtransposition,ChainComplex)
     (Dtransposition,RingElement)
   Headline
     standard transposition for Weyl algebra
   Usage
     Dtransposition A
   Inputs
     A:Matrix
       a matrix (between free modules), function, ideal, or chain complex of free modules over the Weyl algebra
   Outputs
     :Matrix
       the standard transpose of @TT "A"@ as a matrix, function, ideal, or chain complex over the Weyl algebra
   Description
    Text
      The standard transposition is the involution of the Weyl algebra
      which sends @EM {"x", SUP "a","d", SUP "b"}@ to @EM {"(-d)", SUP "b", "x", SUP "a"}@.
      It provides the equivalence in the Weyl algebra between left and right D-modules.
    Example
      makeWeylAlgebra(QQ[x,y])
      L = x^2*dy + y*dy^2 + 3*dx^5*dy
      Dtransposition L
   Caveat
     The standard transposition of a left ideal should be a right ideal, however M2 currently doesn't support right modules.
     Thus the output is left ideal generated by the transposition of the previous generators.
   SeeAlso
     WeylAlgebra
///

doc ///
   Key
     makeCyclic
     (makeCyclic, Matrix)
   Headline
     finds a cyclic generator of a D-module
   Usage
     makeCyclic M
   Inputs
     M:Matrix
       that specifies a map such that @TT "coker M"@ is a holonomic D-module
   Outputs
     H:HashTable
       where @TT "H.Generator"@ is a cyclic generator and @TT "H.AnnG"@
       is the annihilator ideal of this generator
   Description
    Text
      It is known that every holonomic module is cyclic and
      there is an algorithm for computing a cyclic generator.
    Example
      makeWA(QQ[x])
      M = matrix {{dx,0,0},{0,dx,0},{0,0,dx}} -- coker M = QQ[x]^3
      h = makeCyclic M
   Caveat
     The module @EM "M"@ must be holonomic.
   SeeAlso
     isHolonomic
///

document {
     Key => Generator,
     Headline =>
     "a key created by makeCyclic",
     "See ", TO "makeCyclic", "."
     }

document {
     Key => AnnG,
     Headline =>
     "a key created by makeCyclic",
     "See ", TO "makeCyclic", "."
     }

doc ///
   Key
     stafford
     (stafford, Ideal)
   Headline
     computes 2 generators for a given ideal in the Weyl algebra
   Usage
     stafford I
   Inputs
     I:Ideal
       of the Weyl algebra
   Outputs
     :Ideal
       with 2 generators (that has the same extension as I in k(x)<dx>)
   Description
    Text
      A theorem of Stafford says that every ideal in the Weyl algebra
      can be generated by 2 elements. This routine is the implementation of the
      effective version of this theorem following the constructive proof in
      @EM "A.Leykin, `Algorithmic proofs of two theorems of Stafford',
      Journal of Symbolic Computation, 38(6):1535-1550, 2004"@.
      @BR{}@
      The current implementation provides a weaker result: the 2 generators
      produced are guaranteed to generate only the extension of the ideal @EM "I"@
      in the Weyl algebra with rational-function coefficients.
    Example
      makeWA(QQ[x_1..x_4])
      stafford ideal (dx_1,dx_2,dx_3,dx_4)
   Caveat
     The input should be generated by at least 2 generators. The output and input ideals are not equal necessarily.
   SeeAlso
     makeCyclic
///

doc ///
  Key
    extractVarsAlgebra
    (extractVarsAlgebra, PolynomialRing)
  Headline
   underlying polynomial ring in the ordinary variables of a Weyl algebra
  Usage
    extractVarsAlgebra D
  Inputs
    D:PolynomialRing
       a Weyl algebra
  Outputs
    :PolynomialRing
  Description
    Text
      Extracts from a Weyl algebra the polynomial ring in its ordinary variables.
    Example
      D = makeWA(QQ[x,y])
      R = extractVarsAlgebra D
      describe R
  SeeAlso
    extractDiffsAlgebra
///

doc ///
  Key
    extractDiffsAlgebra
    (extractDiffsAlgebra, PolynomialRing)
  Headline
   underlying polynomial ring in the differentials of a Weyl algebra
  Usage
    extractDiffsAlgebra D
  Inputs
    D:PolynomialRing
      a Weyl algebra
  Outputs
    :PolynomialRing
  Description
    Text
      Extracts from a Weyl algebra the polynomial ring in its differentials only.
    Example
      D = makeWA(QQ[x,y])
      S = extractDiffsAlgebra D
      describe S
  SeeAlso
    extractVarsAlgebra 
///
