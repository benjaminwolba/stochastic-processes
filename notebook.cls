%-------------------------------------------------------------------------
%	Standard Preamble for Notebooks
%-------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notebook}

\LoadClass[
12pt,																		% font size		
a4paper,																	% page layout
DIV=calc,																	% calculate type area: words per line
BCOR15mm,		  															% correction for binding
twosides,		  															% two sides
headinclude, 																% include the header line to compute the type area
toc=bibliography, 															% add references to table of contents
captions=tableheading, 														% table heading above the table 
]{scrbook}
\setlength \parindent{0pt} \parskip 12pt

%------------------------------------------------
%	Encoding, Font, Language
%------------------------------------------------

\RequirePackage[utf8]{inputenc}												% converts input to latex-language 
\RequirePackage[T1]{fontenc}												% font
\RequirePackage[english]{babel}												% language package
\RequirePackage{cmap} 														% allows to copy text from PDF

%------------------------------------------------
%	Page Layout
%------------------------------------------------

\RequirePackage{geometry}													% page geometry
\geometry{left=2.5cm,right=2.5cm, top=3.5cm, bottom=3.5cm}					% specify margin
\renewcommand*{\chapterheadstartvskip}{\vspace*{0.0\baselineskip}}      	% adjust space to chapters caption

\RequirePackage[absolute,overlay]{textpos} 									% text positioning
\RequirePackage{setspace} 													% controll space between lines

\RequirePackage{scrpage2} 													% header and footer
\pagestyle{scrheadings} \clearscrheadfoot 
\ofoot{\pagemark} 															% header: chapter name inside, page number outside

%------------------------------------------------
%	Images, PDF and tables
%------------------------------------------------

\RequirePackage{graphicx}													% include graphics
\RequirePackage[dvipsnames]{xcolor}											% color package, dvipsnames provides more colors

% Document Colors
\definecolor{deepblue}{rgb}{0,0,0.5}
\definecolor{deepred}{rgb}{0.6,0,0}
\definecolor{deepgreen}{rgb}{0,0.5,0}
\definecolor{bluebase}{RGB}{57,127,202}
\definecolor{bluelight}{RGB}{156,213,238}
\definecolor{blueback}{RGB}{230,245,255}

\usepackage{tocloft}

\renewcommand{\cfttoctitlefont}{\sffamily\huge\bfseries\color{bluebase}}

\makeatletter 
%colorear la tabla de contenidos, extraído de http://tex.stackexchange.com/questions/7526/toc-section-subsection-coloring/56368#56368
\let\stdl@section\l@section
\renewcommand*{\l@section}[2]{%
	\stdl@section{\textcolor{bluebase}{#1}}{\textcolor{bluebase}{#2}}}

\let\stdl@chapter\l@chapter
\renewcommand*{\l@chapter}[2]{%
	\stdl@chapter{\textcolor{bluebase}{#1}}{\textcolor{bluebase}{#2}}}
\makeatother

\RequirePackage{titlesec}

% \titleformat{?Überschriftenklasse?}[Absatzformatierung?]{?Textformatierung?} {?Nummerierung?}{?Abstand zwischen Nummerierung und Überschriftentext?}{?Code vor der Überschrift?}[?Code nach der Überschrift?]
\titleformat{\chapter}[hang]{\huge\bfseries\sffamily\color{bluebase}}{\thechapter\quad}{-1.3ex}{}
\titleformat{\section}[hang]{\Large\bfseries\sffamily\color{bluebase}}{\thesection\quad}{-1.2ex}{}
\titleformat{\subsection}[hang]{\large\bfseries\sffamily\color{bluebase}}{\thesubsection\quad}{-1.2ex}{}
\titleformat{\subsubsection}[hang]{\large\bfseries\sffamily\color{bluebase}}{\thesubsubsection\quad}{-1.2ex}{}
\titleformat{\paragraph}[hang]{\large\bfseries\sffamily\color{bluebase}}{\theparagraph\quad}{-1.2ex}{}

% \titlespacing{?Überschriftenklasse?}{?Linker Einzug?}{?Platz oberhalb?}{?Platz unterhalb?}[?rechter Einzug?]
\titlespacing{\chapter}{0pt}{0pt}{6pt}
\titlespacing{\section}{0pt}{6pt}{6pt}
\titlespacing{\subsection}{0pt}{6pt}{6pt}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}
\titlespacing{\paragraph}{0pt}{6pt}{6pt}

\RequirePackage{pdfpages} 													% enables the integration of PDFs to the Latex document

\RequirePackage{pgf,tikz} 													% for drawing graphics
\RequirePackage{circuitikz}													% elektrische Netzwerke zeichnen
\usetikzlibrary{shapes.geometric, shapes.callouts, arrows, mindmap, positioning} 

\RequirePackage[framemethod=default]{mdframed}								% create breakable frame for definitions, theorems etc.
\mdfdefinestyle{default}{%
	topline=false, bottomline=false, rightline=false,%
	linecolor= bluelight, linewidth=3pt,%
	leftmargin=1cm, rightmargin=1cm,%
	frametitleaboveskip=10pt
}

% https://texblog.org/2015/09/30/fancy-boxes-for-theorem-lemma-and-proof-with-mdframed/

% \newenvironment{name}[args]{begin_def}{end_def}

\newenvironment{theorem}[1][]{%
	\mdfsetup{topline=false, bottomline=false, rightline=false,%
		linecolor= bluelight, linewidth=3pt,%
		frametitleaboveskip=10pt,
		frametitle={%
			\color{bluebase} \strut #1
		}
	}
	\begin{mdframed}[] \relax%
		}{\end{mdframed}}

\newenvironment{remark}[1][]{%
	\mdfsetup{innertopmargin=10pt,innerbottommargin=12pt,linecolor=blueback,%
		linewidth=2pt,topline=true,backgroundcolor=blueback,%
		frametitleaboveskip=10pt,
		frametitle={%
			\strut #1
		}
	}
	\begin{mdframed}[]%
	}{\end{mdframed}}
	
\newenvironment{highlight}[1][]{%
	\mdfsetup{innertopmargin=10pt,innerbottommargin=12pt,linecolor=red!10,%
		linewidth=2pt,topline=true,backgroundcolor=red!10,%
		frametitleaboveskip=10pt,
		frametitle={%
			\strut #1
			}
	}
	\begin{mdframed}[]%
	}{\end{mdframed}}

\RequirePackage{rotating} 													% let objects rotate
\RequirePackage{float}														% floating environments
\RequirePackage[section]{placeins} % control float placement

\RequirePackage[margin=8mm,font=small,labelfont=bf,format=plain]{caption}	% set captions
\RequirePackage[margin=8mm,font=small,labelfont=bf,format=plain]{subcaption}

\RequirePackage{tabularx}													% tables
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}} 					% flush left with width
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}} 					% centered with width
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}} 					% flush right with width
\setlength{\tabcolsep}{5mm}
\renewcommand{\arraystretch}{2}

\RequirePackage{multicol, multirow}											% many colums / rows

\RequirePackage{enumitem} 													% adjust enumerate / itemize

%------------------------------------------------
%	Mathematics and Science
%------------------------------------------------

\RequirePackage{mathtools}
\RequirePackage{amsmath,amsfonts,amssymb}									% math packages
\RequirePackage{dsfont}														% font package for sets
\newcommand{\C}{\mathds{C}} 												% command for body of complex numbers
\newcommand{\R}{\mathds{R}} 												% command for body of real numbers
\newcommand{\Z}{\mathds{Z}} 												% command for body of integer numbers
\newcommand{\N}{\mathds{N}} 												% command for body of natural numbers

\usepackage{physics}														% typesetting equations for physics 
\newcommand{\nab}{\vec{\nabla}}
\newcommand{\1}{\hat{1}}

% https://tex.stackexchange.com/questions/120029/how-to-typeset-a-primed-vector
% use this as \pvec{v}' or \pvec{v}''
\newcommand{\pvec}[1]{\vec{#1}\mkern2mu\vphantom{#1}}

% change definition of div, https://tex.stackexchange.com/questions/175251/how-to-redefine-a-command-using-declaremathoperator
\let\div\relax																
\newcommand{\div}{\vec{\nabla} \cdot}
\newcommand{\rot}{\vec{\nabla} \curl}
\DeclareMathOperator{\sgn}{sgn}												% sgn operator
\DeclareMathOperator*{\SumInt}{%
	\mathchoice%
	{\ooalign{$\displaystyle\sum$\cr\hidewidth$\displaystyle\int$\hidewidth\cr}}
	{\ooalign{\raisebox{.14\height}{\scalebox{.7}{$\textstyle\sum$}}\cr\hidewidth$\textstyle\int$\hidewidth\cr}}
	{\ooalign{\raisebox{.2\height}{\scalebox{.6}{$\scriptstyle\sum$}}\cr$\scriptstyle\int$\cr}}
	{\ooalign{\raisebox{.2\height}{\scalebox{.6}{$\scriptstyle\sum$}}\cr$\scriptstyle\int$\cr}}
}		

\RequirePackage{listings}													% include code

% Default fixed font does not support bold face
\DeclareFixedFont{\ttb}{T1}{txtt}{bx}{n}{12} 								% for bold
\DeclareFixedFont{\ttm}{T1}{txtt}{m}{n}{12}  								% for normal

% Python style for highlighting
\newcommand\codestyle{\lstset{
		language=Python,
		basicstyle=\ttm,
		otherkeywords={self},             									% Add keywords here
		keywordstyle=\ttb\color{deepblue},
		% emph={MyClass,__init__},          								% Custom highlighting
		% emphstyle=\ttb\color{deepred},    								% Custom highlighting style
		stringstyle=\color{deepred},
		commentstyle=\color{deepgreen},
		frame=tb,                         									% Any extra options here
		showstringspaces=false     
	}}
	

% Code environment
\lstnewenvironment{code}[1][]
{
	\codestyle
	\lstset{#1}
}
{}

% Code for external files
\newcommand\externalcode[2][]{{
		\codestyle
		\lstinputlisting[#1]{#2}}}
	
% Code for inline
\newcommand\inlinecode[1]{{\codestyle\lstinline!#1!}}

\RequirePackage{mhchem} 													% chemical formula
\RequirePackage{isotope} 													% quote isotopes and nuclides

\RequirePackage{siunitx}													% set units correctly
\sisetup{separate-uncertainty,  											% quotation of uncertainty: (value \pm MU) unit
		 exponent-product=\cdot} 											% dot instead of cross
		 
\makeatletter																% adjust spacing around equations
\g@addto@macro\normalsize{%
	\setlength\abovedisplayskip{20pt}
  	\setlength\belowdisplayskip{20pt}
  	\setlength\abovedisplayshortskip{20pt}
  	\setlength\belowdisplayshortskip{20pt}}
\makeatother

%------------------------------------------------
%	References
%------------------------------------------------

\RequirePackage[bibstyle=numeric,											% style of references
			citestyle=numeric-comp, 										% style of citations
			sorting=none,													% no sorting
			backend=biber]{biblatex}										% specify backend as biber
			

\DeclareFieldFormat[article]{volume}{\mkbibbold{#1}}
\renewbibmacro{in:}{}

%\RequirePackage{bibgerm} 													% references in German style

%------------------------------------------------
%	Miscellaneous
%------------------------------------------------

\RequirePackage{verbatim} 													% comments in Latex
\RequirePackage[hidelinks]{hyperref} 										% hyperliunks and other things
\RequirePackage{url, breakurl}												% package for URL

\renewcommand{\O}[1]{\mathcal{O}(#1)}										% command for order of
\newcommand{\F}{\mathcal{F}}												% command for Fourier transform

\newcommand{\tabitem}{~~\llap{\textbullet}~~}								% definition \tabitem-command
\setlength\columnsep{15pt}
