(* ::Package:: *)

(* ::Title:: *)
(*Plot cleanup for export*)


(* ::Text:: *)
(*Solution taken from https://mathematica.stackexchange.com/questions/3190/saner-alternative-to-contourplot-fill/3279#3279.*)
(*Cleans up the ugly mesh that appears sometimes when exporting RegionPlot and ContourPlot to PDF.*)


BeginPackage["CleanPlot`";];


cleanPlot::usage = "Cleans up a RegionPlot/ContourPlot for PDF export";


Begin["Private`"];


(* ::Input::Initialization:: *)
cleanPlot[cp_Graphics]:=Module[{points,groups,regions,lines},groups=Cases[cp,{style__,g_GraphicsGroup}:>{{style},g},Infinity];
points=First@Cases[cp,GraphicsComplex[pts_,___]:>pts,Infinity];
regions=Table[Module[{group,style,polys,edges,cover,graph},{style,group}=g;
polys=Join@@Cases[group,Polygon[pt_,___]:>pt,Infinity];
edges=Join@@(Partition[#,2,1,1]&/@polys);
cover=Cases[Tally[Sort/@edges],{e_,1}:>e];
graph=Graph[UndirectedEdge@@@cover];
{Sequence@@style,FilledCurve[List/@Line/@First/@Map[First,FindEulerianCycle/@(Subgraph[graph,#]&)/@ConnectedComponents[graph],{3}]]}],{g,groups}];
lines=Cases[cp,_Tooltip,Infinity];
Graphics[GraphicsComplex[points,{regions,lines}],Sequence@@Options[cp]]]

cleanPlot[Legended[cp_Graphics,rest___]]:=Legended[cleanPlot[cp],rest]


End[];


EndPackage[];
