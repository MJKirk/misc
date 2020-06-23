(* ::Package:: *)

(* ::Title:: *)
(*Colours*)


(* ::Text:: *)
(*Provides the colours to match the Matplotlib / flavio plotstyles*)


BeginPackage["Colours`"];


matplotlibColours::usage = "Matplotlib default colour scheme (v2 onwards). Used by flavio from v1.6 onwards."


(* ::Input::Initialization::Plain:: *)
oldFlavioColours::usage = "flavio colour scheme pre v1.6. Corresponds to ColorBrewer Set1 and Pastel1.";


Begin["Private`"];


oldFlavioColours = Association[
"Boundary" -> {
RGBColor[Rational[76,85], Rational[26,255], Rational[28,255]], 
RGBColor[Rational[11,51], Rational[42,85], Rational[184,255]],
RGBColor[Rational[77,255], Rational[35,51], Rational[74,255]],
RGBColor[Rational[152,255], Rational[26,85], Rational[163,255]],
RGBColor[1, Rational[127,255], 0],
RGBColor[1, 1, Rational[1,5]],
RGBColor[Rational[166,255], Rational[86,255], Rational[8,51]],
RGBColor[Rational[247,255], Rational[43,85], Rational[191,255]],
RGBColor[Rational[3,5], Rational[3,5], Rational[3,5]]
},
"Fill" -> {
RGBColor[Rational[251,255], Rational[12,17], Rational[58,85]],
RGBColor[Rational[179,255], Rational[41,51], Rational[227,255]],
RGBColor[Rational[4,5], Rational[47,51], Rational[197,255]],
RGBColor[Rational[74,85], Rational[203,255], Rational[76,85]],
RGBColor[Rational[254,255], Rational[217,255], Rational[166,255]],
RGBColor[1, 1, Rational[4,5]],
RGBColor[Rational[229,255], Rational[72,85], Rational[63,85]],
RGBColor[Rational[253,255], Rational[218,255], Rational[236,255]],
RGBColor[Rational[242,255], Rational[242,255], Rational[242,255]]
}
];


matplotlibColours = Association[
"Boundary" -> {
RGBColor["#1f77b4"], RGBColor["#ff7f0e"], RGBColor["#2ca02c"], RGBColor["#d62728"],
RGBColor["#9467bd"], RGBColor["#8c564b"], RGBColor["#e377c2"], RGBColor["#7f7f7f"],
RGBColor["#bcbd22"], RGBColor["#17becf"]
}
];


matplotlibColours["Fill"] = Lighter[matplotlibColours["Boundary"], 0.5];


End[];


EndPackage[];
