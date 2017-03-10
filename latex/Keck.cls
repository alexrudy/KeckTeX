\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{Keck}[2014/02/26 LaTeX styles for Keck Proposals]
%--- CLASS ---
\LoadClass[11pt]{article}

%--- PACKAGES ---
\RequirePackage[hidelinks]{hyperref}

% Mathematics and Symbols
\RequirePackage{amsmath} 
\RequirePackage{amssymb}
\RequirePackage{fontspec} %XeTeX Fonts
\RequirePackage[dvipsnames]{color}

% Paper Geometry
\RequirePackage[top=1in, bottom=1in, left=1in, right=1in]{geometry} 
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[font={small}]{caption}

% Graphics Packages
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{setspace}

% Text Packages
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage[compact]{titlesec}
\RequirePackage{xspace}
\RequirePackage[normalem]{ulem}
\RequirePackage{xltxtra}
\RequirePackage{url}

% Reference Packages
\RequirePackage{natbib}
\RequirePackage{multibib}

% Utilities
\RequirePackage{datetime}
\usdate

%--- LAYOUT COMMANDS ---%
\geometry{letterpaper} %Paper Size
% See p.105 of "TeX Unbound" for suggested values.
% See pp. 199-200 of Lamport's "LaTeX" book for details.
%   General parameters, for ALL pages:
\renewcommand{\topfraction}{0.96}	% max fraction of floats at top
\renewcommand{\bottomfraction}{0.8}	% max fraction of floats at bottom
%   Parameters for TEXT pages (not float pages):
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}  % 2 may work better
\setcounter{dbltopnumber}{2} % for 2-column pages
\renewcommand{\dbltopfraction}{0.9} % fit big float above 2-col. text
\renewcommand{\textfraction}{0.02} % allow minimal text w. figs
%   Parameters for FLOAT pages (not text pages):
\renewcommand{\floatpagefraction}{0.95} % require fuller float pages
% N.B.: floatpagefraction MUST be less than topfraction !!
\renewcommand{\dblfloatpagefraction}{0.7} % require fuller float pages
\setlength{\multicolsep}{0pt}
%--- GRAPHICS COMMANDS ---%
\DeclareGraphicsRule{.tif}{png}{.png}{`convert #1 `dirname #1`/`basename #1 .tif`.png}

%---- XeLaTeX COMMANDS ---%
\setromanfont[Ligatures=TeX]{Palatino}
\setmonofont[Scale=MatchLowercase]{Monaco}

\makeatletter
\newlength\fake@f
\newlength\fake@c
\def\fakesc#1{%
  \begingroup%
  \xdef\fake@name{\csname\curr@fontshape/\f@size\endcsname}%
  \fontsize{\fontdimen8\fake@name}{\baselineskip}\selectfont%
  \uppercase{#1}%
  \endgroup%
}
\makeatother

\newcommand{\gotitle}{}
\newcommand{\gopi}{}
\newcommand{\gocoi}{}
\newcommand{\goauthor}{}
\newcommand{\goproposalnumber}{}
\newcommand{\gorequest}{}
\newcommand{\goinstrument}{}
\newcommand{\gosemester}{}
\newcommand{\golfoot}{}
\newcommand{\gorfoot}{}

%--- HEADER INFORMATION ----         
\pagestyle{fancy}
% \fancyhf{}
\AtBeginDocument{
%Header Content
\lhead{}
\chead{
\newcolumntype{R}{>{\raggedleft}X}
\newcolumntype{C}{>{\centering}X}
\newcolumntype{L}{>{\raggedright}X}
\begin{tabularx}{\textwidth}{LCCR}
   \gopi (PI) & \goproposalnumber & \goinstrument & \gorequest
\end{tabularx}
\begin{centering}
 \emph{\gotitle}
\end{centering}
}
\rhead{}

\fancypagestyle{firstpage}{%
% \fancyhf{} % clear all header and footer fields
\lhead{}
\chead{
\newcolumntype{R}{>{\raggedleft}X}
\newcolumntype{C}{>{\centering}X}
\newcolumntype{L}{>{\raggedright}X}
\begin{tabularx}{\textwidth}{LCCR}
   \gopi (PI) & \goproposalnumber & \goinstrument & \gorequest
\end{tabularx}
\begin{centering}
  \textbf{\uline{\gotitle}}
\end{centering}
}
\rhead{}
\cfoot{\thepage\ of \pageref{LastPage}}
\lfoot{\golfoot}
\rfoot{\gorfoot}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}
}

\fancypagestyle{nohead}{%
% \fancyhf{} % clear all header and footer fields
\lhead{}
\chead{}
\rhead{}
\cfoot{\thepage\ of \pageref{LastPage}}
\lfoot{\golfoot}
\rfoot{\gorfoot}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}

%Footer Content
\cfoot{\thepage\ of \pageref{LastPage}}
\lfoot{\golfoot}
\rfoot{\gorfoot}
% Header
\headheight 40 pt
\headsep 10pt
\renewcommand{\headrulewidth}{0 pt}
\renewcommand{\footrulewidth}{0 pt}

\DeclareOption{edit}{
  \renewcommand{\gorfoot}{\color{red}Typset with \XeLaTeX\ \today\ at \currenttime}
  \renewcommand{\golfoot}{\color{red}DRAFT Prepared by \goauthor}
}
\ProcessOptions

\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt}

\setcitestyle{comma,aysep={}}
\newcites{pub}{Proposer Publications}
\newcites{ref}{References}
\renewcommand{\bibsection}{}
\renewcommand{\bibfont}{\small}
\renewcommand{\bibsep}{0.1em}
\bibliographystyle{Keck-References-Short}
\bibliographystyleref{Keck-References-Short}
\bibliographystylepub{Keck-Publications}

% Formatting Sections, etc.
\titleformat*{\section}{\large\bfseries}
\titleformat*{\subsection}{\normalsize\bfseries}
\titleformat*{\subsubsection}{\normalsize\bfseries}

\titlespacing*{\section}{0pt}{0pt}{0pt}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}
\titlespacing*{\subsubsection}{0pt}{0pt}{0pt}

\endinput
