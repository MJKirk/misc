(* ::Package:: *)

(* ::Input:: *)
(*<<FeynArts`*)


(* ::Input:: *)
(*t = CreateTopologies[1, 1 -> 2,ExcludeTopologies->{SelfEnergies,Tadpoles}];*)
(*Paint[t];*)


(* ::Input:: *)
(*ins=InsertFields[t, {S[1]} -> {S[3], -S[3]},ExcludeParticles->{S[_],V[1|3],U[_],F[3]}];*)
(*Paint[ins,PaintLevel->{Classes},ColumnsXRows->1,Numbering->Simple];*)


(* ::Input:: *)
(*Export[NotebookDirectory[]<>"FA_output.tex",%,"TeX"]*)
