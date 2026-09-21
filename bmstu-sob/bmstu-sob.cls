\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bmstu-sob}[2026/09/21 v1.1.0 BMSTU/GOST report class]

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

% --------------------------------------------------------------------------
% BMSTU report title page
% --------------------------------------------------------------------------
% Usage:
%
% \makereporttitle
%   {Название университета/направления}
%   {Кафедра}
%   {Тип работы}
%   {Дисциплина}
%   {Название работы}
%   {Номер варианта}
%   {Студент}
%   {Преподаватель}
%
\newcommand{\makereporttitle}[8]{%
  \begin{titlepage}
    \thispagestyle{empty}

    \begin{center}
      {\bmstusob@mainfont
       \fontsize{14}{21}\selectfont
       \bfseries
       МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО ОБРАЗОВАНИЯ
       РОССИЙСКОЙ ФЕДЕРАЦИИ
      \par}

      \vspace{0.5\baselineskip}

      {\bmstusob@mainfont
       \fontsize{14}{21}\selectfont
       \bfseries
       ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ АВТОНОМНОЕ
       ОБРАЗОВАТЕЛЬНОЕ УЧРЕЖДЕНИЕ
       ВЫСШЕГО ОБРАЗОВАНИЯ
      \par}

      \vspace{0.5\baselineskip}

      {\bmstusob@mainfont
       \fontsize{14}{21}\selectfont
       \bfseries
       «МОСКОВСКИЙ ГОСУДАРСТВЕННЫЙ ТЕХНИЧЕСКИЙ
       УНИВЕРСИТЕТ ИМЕНИ Н. Э. БАУМАНА
       (НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ УНИВЕРСИТЕТ)»
      \par}

      \vspace{1.5\baselineskip}

      {\bmstusob@mainfont
       \fontsize{14}{21}\selectfont
       #1
      \par}

      \vspace{0.5\baselineskip}

      {\bmstusob@mainfont
       \fontsize{14}{21}\selectfont
       #2
      \par}

      \vfill

      {\bmstusob@mainfont
       \fontsize{14}{21}\selectfont
       \bfseries
       ОТЧЁТ
      \par}

      \vspace{0.5\baselineskip}

      {\bmstusob@mainfont
       \fontsize{14}{21}\selectfont
       #3
      \par}

      \vspace{1.5\baselineskip}

      \begin{tabular}{p{0.42\textwidth}p{0.42\textwidth}}
        Дисциплина: & #4 \\[0.7\baselineskip]
        Тема: & #5 \\[0.7\baselineskip]
        Вариант: & #6
      \end{tabular}

      \vfill

      \begin{flushright}
        {\bmstusob@mainfont
         \fontsize{14}{21}\selectfont
         \begin{tabular}{ll}
           Студент: & #7 \\[0.7\baselineskip]
           Преподаватель: & #8
         \end{tabular}
        }
      \end{flushright}

      \vfill

      {\bmstusob@mainfont
       \fontsize{14}{21}\selectfont
       Москва~--- \the\year
      \par}

    \end{center}
  \end{titlepage}
}

\makeatother
\endinput