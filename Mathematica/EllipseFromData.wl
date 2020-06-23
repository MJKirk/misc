(* ::Package:: *)

(* ::Title:: *)
(*Data Fit Ellipse *)


(* ::Text:: *)
(*From https://mathematica.stackexchange.com/questions/81061/how-to-draw-confidence-ellipse-from-a-covariance-matrix.*)
(*I use this to draw 2d ellipses of a normal distribution, for comparison with some graphical fit (say from flavio or someone's else paper).*)


BeginPackage["EllipseFromData`"];


dataEllipse::usage = "dataEllipse[{xmean,ymean},{xerr,yerr},xycorr,nSigma] creates an ellipse representing two fitted variables with errors and correlation. nSigma represents how many standard deviations the ellipse covers.";


Begin["`Private`"];


dataEllipse[{xmean_,ymean_},{xerr_,yerr_},xycorr_,nSigma_]:=
Module[{mean,cov},
mean ={xmean,ymean};
cov = {{xerr^2, xerr yerr xycorr},{xerr yerr xycorr, yerr^2}};
Ellipsoid[mean,cov * Quantile[ChiSquareDistribution[2],2CDF[NormalDistribution[],nSigma]-1]]
];


End[];
EndPackage[];
