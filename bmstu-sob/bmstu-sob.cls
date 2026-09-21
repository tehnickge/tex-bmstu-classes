\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bmstu-sob}[2026/09/21 v1.2.1 BMSTU/GOST report class]

% --------------------------------------------------------------------------
% Class options
% --------------------------------------------------------------------------
\makeatletter
\newif\ifbmstusob@lab
\newif\ifbmstusob@gost
\newif\ifbmstusob@legacyten
\newif\ifbmstusob@headingSixteen
\newif\ifbmstusob@biblatex
\newif\ifbmstusob@inappendix
\bmstusob@labfalse
\bmstusob@gostfalse
\bmstusob@legacytenfalse
\bmstusob@headingSixteenfalse
\bmstusob@biblatexfalse
\bmstusob@inappendixfalse

% Current BMSTU profile and GOST 7.32-2017 use the same page geometry:
% left 30 mm, right 15 mm, top 20 mm, bottom 20 mm.
% The legacy10 option is retained only for departmental/older instructions.
\DeclareOption{lab}{\bmstusob@labtrue}
\DeclareOption{gost}{\bmstusob@gosttrue}
\DeclareOption{bmstu}{\bmstusob@gostfalse}
\DeclareOption{legacy10}{\bmstusob@legacytentrue}
\DeclareOption{heading16}{\bmstusob@headingSixteentrue}
\DeclareOption{biblatex}{\bmstusob@biblatextrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

% --------------------------------------------------------------------------
% Engine and fonts
% --------------------------------------------------------------------------
\RequirePackage{iftex}
\ifPDFTeX
	\ClassError{bmstu-sob}
	{The class requires XeLaTeX or LuaLaTeX}
	{Use XeLaTeX or LuaLaTeX so the real system font Times New Roman can be used.}
\fi

\LoadClass[a4paper,oneside,14pt]{extarticle}

\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX,Scale=MatchLowercase}

\IfFontExistsTF{Times New Roman}
{}
{\ClassError{bmstu-sob}{Times New Roman is not installed}
	{Install Microsoft Times New Roman and compile with XeLaTeX or LuaLaTeX.}}

\IfFontExistsTF{Courier New}
{}
{\ClassError{bmstu-sob}{Courier New is not installed}
	{Install Microsoft Courier New and compile with XeLaTeX or LuaLaTeX.}}

\setmainfont{Times New Roman}
\setmonofont{Courier New}

\newfontfamily\bmstusob@mainfont{Times New Roman}
\newfontfamily\bmstusob@codefont{Courier New}

% --------------------------------------------------------------------------
% Core modules
% --------------------------------------------------------------------------
\RequirePackage{bmstu-sob-layout}
\RequirePackage{bmstu-sob-headings}
\RequirePackage{bmstu-sob-lists}
\RequirePackage{bmstu-sob-floats}
\RequirePackage{bmstu-sob-math}
\RequirePackage{bmstu-sob-code}
\RequirePackage{bmstu-sob-refs}
\RequirePackage{bmstu-sob-appendix}
\RequirePackage{bmstu-sob-title}

\makeatother
\endinput
