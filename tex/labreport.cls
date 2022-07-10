%----------------------------------------------------------------------------------------
%	CLASS DEFINITION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{labreport}[2021-12-26 Daniel Jakob Lab Report Class File v2.0] % Class information printed in the log during every compilation

% \DeclareOption{OPONE}{ % Declare a class option to set a new command with the option value (used as a toggle later)
%    \newcommand{\classtoggle}{OPONE}
% }

% \DeclareOption{OPTWO}{ % Declare a class option to set a new command with the option value (used as a toggle later)
%    \newcommand{\classtoggle}{OPTWO}
% }

\ProcessOptions\relax % Process class options

\LoadClass[a4paper,11pt]{article} % Load the primary class with set options

%\@ifundefined{classtoggle} % Check that the \classtoggle has been defined, i.e. one of the two required class options above has been specified
%{\ClassError{example}{You have not used one of the required options}{You must specify one of the class options defined in the template file.}} % If one of the options has not been specified, quit with an error to that effect
{} % Otherwise do nothing

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\usepackage{ifthen} % Required for if statements to check the value of the \classtoggle command

%----------------------------------------------------------------------------------------
%	FURTHER DOCUMENT LAYOUT SPECIFICATIONS
%----------------------------------------------------------------------------------------

% Example of using the option passed to the class for changing the layout of the document by modifying margin sizes
%\ifthenelse{\equal{\classtoggle}{OPONE}} % If the OPONE option was passed to the class
%{\usepackage[top=1in, bottom=1in, left=1in, right=1in]{geometry}} % Define the margins as 1 inch on all sides
{} % Otherwise do nothing
%\ifthenelse{\equal{\classtoggle}{OPTWO}} % If the OPTWO option was passed to the class
%{\usepackage[top=2in, bottom=2in, left=2in, right=2in]{geometry}} % Define the margins as 2 inches on all sides
{} % Otherwise do nothing

\RequirePackage{etoolbox} % required for \AtEndPreamble

\usepackage[dvipsnames,table,xcdraw]{xcolor} % colour
 

\newcommand*{\modulecode}[1]{\def\@modulecode{#1}}
\newcommand*{\modulename}[1]{\def\@modulename{#1}}
\newcommand*{\stage}[1]{\def\@stage{#1}}
\newcommand*{\major}[1]{\def\@major{#1}}
\newcommand*{\institution}[1]{\def\@institution{#1}}
\newcommand*{\studentnumber}[1]{\def\@studentnumber{#1}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\familyname}[1]{\def\@familyname{#1}}
\newcommand*{\reporttitle}[1]{\def\@reporttitle{#1}}
\newcommand*{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand*{\modulecoord}[1]{\def\@modulecoord{#1}}
\newcommand*{\labta}[1]{\def\@labta{#1}}


\title{\textls[100]{Stage \@stage ,~\@major, \@institution\\\@modulecode\\\@modulename\\\@reporttitle\\\@subtitle}} % Title

\author{\@firstname~\textls[30]{\scshape{\@familyname}}\\\@studentnumber} % Author name

\RequirePackage{fancyhdr} % To edit and change page headers and page numbering
\fancypagestyle{myheadings}{ % Header and footer styles
    \setlength{\headheight}{13.6pt}
    \fancyhf{}
    \lhead{\small{\@firstname~\@familyname}}\chead{\small{\@modulecode}}\rhead{\small{\@studentnumber}}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0.4pt}
    \lfoot{\small{\@reporttitle}}\cfoot{\small{\@subtitle}}\rfoot{\small{\thepage}}
}
\fancypagestyle{assessmentform}{
    \setlength{\headheight}{23.05pt}
    \rhead{\footnotesize{\textit{UCD Adult Education Centre\\Assessment Submission Form}}}
    \renewcommand{\headrulewidth}{0pt}
    \cfoot{}
}

\AtEndPreamble{
\usepackage{csquotes}
\RequirePackage{caption} % Fixes issue with links to images. Should be put last
\RequirePackage{hyperref} % Make references, cites, hyperlinks and ToC clickable
% Link colours 
\usepackage[capitalise, nameinlink]{cleveref}
\newcommand\myshade{85}
\colorlet{mylinkcolor}{violet}
\colorlet{mycitecolor}{YellowOrange}
\colorlet{myurlcolor}{Aquamarine}
\hypersetup{
    pdftitle={\@modulecode~\@modulename~--~\@reporttitle~--~\@firstname~\@familyname~(\@studentnumber)},%Set up PDF title and author
    bookmarksnumbered,
    breaklinks = true,
    pdfpagemode = UseOutlines,
    pdfauthor={\@firstname~\@familyname~(\@studentnumber)},
    linktoc=all, % Make title heading clickable as well as page number in ToC
    pdfsubject={\@modulecode~--~\@reporttitle},
    linkcolor  = mylinkcolor!\myshade!black,
    citecolor  = mycitecolor!\myshade!black,
    urlcolor   = myurlcolor!\myshade!black,
    filecolor  = magenta,
    colorlinks = true,
}
\usepackage[capitalise, nameinlink]{cleveref}
\Crefname{equation}{Eq.}{Eqs.}
\Crefname{table}{Tbl.}{Tbls.}
\Crefname{listing}{List.}{Lists.}
\Crefname{section}{Sec.}{Secs.}
\Crefname{subsection}{Subsec.}{Subsecs.}
\Crefname{subsubsection}{Subsubsec.}{Subsubsecs.}
\Crefformat{appendix}{#2Appx. #1#3}
\Crefrangeformat{appendix}{#3Appxs. #1#4 to #5#2#6}
\Crefmultiformat{appendix}{#2Appxs. #1#3}{ and #2#1#3}{, #2#1#3}{ and #2#1#3}
\Crefrangemultiformat{appendix}{#3Appxs. #1#4 to #5#2#6}{ and #3#1#4 to #5#2#6}{, #3#1#4 to #5#2#6}{ and #3#1#4 to #5#2#6}
\Crefname{algorithm}{Alg.}{Algs.}
%\Crefname{FancyVerbLine}{Ln.}{Lns.}
\Crefname{subfigure}{Fig.}{Figs.}
\creflabelformat{equation}{#2\textup{#1}#3}
}

\usepackage[printonlyused,smaller]{acronym} % nice macros for handling all acronyms in the thesis

\RequirePackage{siunitx} % Provides the \SI{}{} and \si{} commands for typesetting SI units
\sisetup{tight-spacing=true}
\RequirePackage{graphicx} % Required for the inclusion of images
\graphicspath{{images/}}
\RequirePackage[citestyle=numeric, %authoryear, % numeric,
                bibstyle=numeric, % authoryear,  % numeric,
                backend=biber,sorting=nyt,natbib,%maxcitenames=1,
                language=british, 
%backref=true,
]{biblatex} % Citing and bibliography style
% \DefineBibliographyStrings{english}{%
% 		backrefpage = {page},% originally "cited on page"
% 		backrefpages = {pages},% originally "cited on pages"
% 	}
\setlength\bibitemsep{1.5\itemsep} % Increases space between bibliography entries
\addbibresource{bibliography/bibliography.bib} % Locates the .bib file where references are stored
\RequirePackage{mathtools} % Required for some maths elements 
\usepackage{amsmath,amsthm,amssymb}
\RequirePackage{float} % Allows for [H] positioning argument to precisely place figures
\RequirePackage[left=1.5in,right=1.5in,top=1.25in,bottom=1.5in]{geometry} % Sets page margins, showframe
\RequirePackage{url} % allows websites to be referenced
\RequirePackage[english]{babel} % English settings and conventions
\RequirePackage[bottom]{footmisc} % Forces footnote to bottom of page
\RequirePackage[nottoc,notlot,notlof,numbib]{tocbibind} % Puts references in table of contents
\setlength\parindent{0pt} % Removes all indentation from paragraphs
\usepackage[british,irish]{datetime2} % Edit \today date display
\DTMlangsetup[en-GB]{ord=raise}
\RequirePackage{pdfpages} % to include pdf pages \includepdf[pages={1}]{XXX.pdf}
\RequirePackage[protrusion=true,expansion=true,final,tracking]{microtype} % allows for better letter and word spacing resulting in better typesetting
\RequirePackage{booktabs} % nicer looking tables 
\usepackage{float} % Precise placement of floats 
\frenchspacing % replaces 2 letter spacing after cross-reference abbreviation and before no. w/ 1 space
\usepackage{xfrac} % for "slanted" fractions
\usepackage{parskip} % to control how paragraphs are spaced
\usepackage{multirow} % to have multirow cells in tables
\usepackage[htt]{hyphenat}
\usepackage[export]{adjustbox}

\usepackage[labelformat=simple]{subcaption}


\usepackage[intoc]{nomencl}
\makenomenclature
\usepackage{ifthen}
\renewcommand{\nomgroup}[1]{%
\ifthenelse{\equal{#1}{S}}{\item[\textbf{Symbols}]}{%
\ifthenelse{\equal{#1}{A}}{\item[\textbf{Physics Constants}]}{%
\ifthenelse{\equal{#1}{U}}{\item[\textbf{Sub- and Superscripts}]}{}}}
}

\newcommand{\nomunit}[1]{%
\renewcommand{\nomentryend}{\hspace*{\fill}#1}}



\setlength{\textfloatsep}{11pt plus 1.0pt minus 2.0pt} 
\setlength{\intextsep}{12pt plus 1.0pt minus 2.0pt} 


% To declare how names are rendered and sorted in bibliography and cites 
\DeclareDelimFormat{finalnamedelim}{\addspace\&\space}
\DeclareNameAlias{sortname}{family-given}
\DeclareNameAlias{default}{family-given}

% Need to use MATLAB2TikZ %%% 
\usepackage{pgfplots}
%\pgfkeys{/pgf/plot/gnuplot call={cd .aux && gnuplot}}
\pgfplotsset{compat=1.17}
\usetikzlibrary{plotmarks}
\usetikzlibrary{arrows.meta}
\usepgfplotslibrary{patchplots}
\usepackage{grffile}
\usetikzlibrary{arrows,calc,intersections,positioning,angles, quotes}
\usepackage{tikz-3dplot}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \usepackage{pgfplotstable}
% \pgfplotstableset{% global config, for example in the preamble
% empty cells with={--}, % replace empty cells with '--'
% every head row/.style={before row=\toprule,after row=\midrule},
% every last row/.style={after row=\bottomrule}
% }

\usepackage[titletoc]{appendix}

\newcommand*\circled[1]{\tikz[baseline={([yshift=-0.25ex]char.base)}]{
            \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
%\usepackage{fontspec}

%\usepackage[charter]{newtxmath}
%\usepackage[scaled=.9]{XCharter}

%\usepackage[T1]{fontenc}
% \usepackage{newtxtext,newtxmath}

\usepackage[notext]{stix} % math font
\usepackage{step} % step font

%\defaultfontfeatures{Ligatures=TeX}

\RequirePackage[cachedir=.minted,outputdir=.aux]{minted} % code listing package 
\setminted{ % style setup for minted 
    fontsize=\footnotesize,   
    baselinestretch=0.8, 
    linenos=true,
    autogobble,
    breaklines,
    escapeinside=££
}
%\usemintedstyle{pastie}


\renewcommand{\vec}[1]{\boldsymbol{\mathbf{#1}}}

\newcommand{\eqname}[1]{\tag{#1}}% Tag equation with name

% use \inlinecode{LANGUAGE}{CODE SNIPPET} to display code with colour. 
\newcommand{\inlinecode}[2]{\mintinline[breaklines,escapeinside=££,fontsize=\small]{#1}{#2}} 

\newenvironment{longlisting}{\captionsetup{type=listing}}{} % allows for multipage and page-breaking of code listings
\AfterEndEnvironment{longlisting}{\hspace{-.5em}}
\RequirePackage[ruled,vlined]{algorithm2e} % algorithm package 

% fixes issue with cross reference to algorithm not going to the actual top of the caption
\let\old@algocf@pre@ruled\@algocf@pre@ruled
\renewcommand{\@algocf@pre@ruled}{%
  \Hy@raisedlink{\hyper@anchorstart{algocf.\thealgocf}\hyper@anchorend}%
  \old@algocf@pre@ruled}

%\renewcommand\p@table{Tab.~\@} % changes how cross referenced tables are displayed
%\renewcommand\p@figure{Fig.~\@} % changes how cross referenced figures are displayed
%\renewcommand\p@section{Sec.~\@} % changes how cross referenced sections are displayed
%\renewcommand\p@subsection{Subsec.~\@} % changes how cross referenced sub-sections are displayed
%\renewcommand\p@subsubsection{Subsubsec.~\@} % changes how cross referenced sub-sections are displayed
%\renewcommand\p@listing{List.~\@} % changes how cross referenced code listings are displayed
%\renewcommand\p@equation{Eq.~\@} % changes how cross referenced equations are displayed
%\renewcommand\p@algocf{Alg.~\@} % changes how cross referenced algorithms are displayed
\renewcommand\p@FancyVerbLine{Ln.~\@} % changes how cross referenced lines of code are displayed
%\renewcommand\p@subfigure{Fig.~\thefigure} % for subfigures 

\renewcommand\thesubfigure{(\alph{subfigure})} % puts subfigure in round brackets

\renewcommand{\thefootnote}{\alph{footnote}} % footnotes a, b, c, etc. 

\newcommand{\rbk}[1]{\left(#1\right)} % round brackets (parentheses)
\newcommand{\cbk}[1]{\left\{#1\right\}} % curly brackets {braces}
\newcommand{\sbk}[1]{\left[#1\right]} % square brackets [brackets]
\newcommand{\abs}[1]{\left|#1\right|} % absolute value |x|
\newcommand{\norm}[1]{\left\|#1\right\|} % norm ||x||
\newcommand{\fact}[1]{#1!} % factorial x!
\newcommand{\dx}{\mathrm{d}} % upright 'd' for differential
\newcommand\myeq{\mathrel{\overset{\makebox[0pt]{\mbox{\normalfont\tiny\sffamily def}}}{=}}} % use \myeq for equals sign with "def" over it 
\providecommand{\myceil}[1]{$\left \lceil #1 \right \rceil$}
\newcommand{\myfloor}[1]{\left\lfloor #1 \right\rfloor}



%\DeclareFieldFormat{year}{\mkbibparens{#1}} % puts year in brackets
\DeclareFieldFormat[software]{entrysubtype}{\mkbibbrackets{#1}} %puts software in square bracket
\DeclareFieldFormat[software]{version}{\mkbibparens{Version #1}} %puts software version in round bracket
\DeclareBibliographyDriver{software}{%  
    \printnames{author}%
    \newunit\newblock
    \printfield{year}%
    \newunit\newblock
    \printfield{title}%
    \setunit*{\addnbspace}
    \printfield{version}
    \printfield{entrysubtype}
    \newunit\newblock
    \printlist{location}%
    : \printlist{publisher}
    \newunit\newblock
    \printfield{url}
    \finentry
}

% for longer bar, but shoter than overline --------------------
\newsavebox\myboxA
\newsavebox\myboxB
\newlength\mylenA

\newcommand*\xoverline[2][0.75]{%
    \sbox{\myboxA}{$\m@th#2$}%
    \setbox\myboxB\null% Phantom box
    \ht\myboxB=\ht\myboxA%
    \dp\myboxB=\dp\myboxA%
    \wd\myboxB=#1\wd\myboxA% Scale phantom
    \sbox\myboxB{$\m@th\overline{\copy\myboxB}$}%  xoverlined phantom
    \setlength\mylenA{\the\wd\myboxA}%   calc width diff
    \addtolength\mylenA{-\the\wd\myboxB}%
    \ifdim\wd\myboxB<\wd\myboxA%
       \rlap{\hskip 0.5\mylenA\usebox\myboxB}{\usebox\myboxA}%
    \else
        \hskip -0.5\mylenA\rlap{\usebox\myboxA}{\hskip 0.5\mylenA\usebox\myboxB}%
    \fi}
% ---------------------------------------------------------------

% For typesetting degree angles (not radians) w/ units after
\NewDocumentCommand{\angsi}{omom}{%
    \mbox{\ang[#1]{#2}\,\si[#3]{#4}}%
}
\DeclareSIUnit\atm{atm} % atmosphere units

\newcommand{\atan}{\tan^{-1}} % inverse tan and sine functions
\newcommand{\asin}{\sin^{-1}}
\newcommand{\acos}{\cos^{-1}}

%% includewidthfigure:
%% \includescalefigure{\label{fig:XX}}{caption}{width}{filename}
%% - includes a figure with a given label, a short caption for the table of contents and a longer caption that describes the figure in some detail and a scale factor 'scale'
\newcommand{\includewidthfigure}[4]{
\begin{figure}[htpb]
\centering
\includegraphics[width=#3\linewidth]{#4}
\captionsetup{width=.8\linewidth} 
\caption{#2}#1
\end{figure}}

% Equation conditionals setup
\usepackage{array,tabularx,calc}

\newlength{\conditionwd}
\newenvironment{conditions}[1][where:]
  {%
   #1\tabularx{\textwidth-\widthof{#1}}[t]{
     >{$}r<{$} @{${}={}$} X@{}
   }%
  }
  {\endtabularx\\[\belowdisplayskip]}

% puts a little "closing tick" on radicals 
\usepackage{letltxmacro}
\makeatletter
\let\oldr@@t\r@@t
\def\r@@t#1#2{%
\setbox0=\hbox{$\oldr@@t#1{#2\,}$}\dimen0=\ht0
\advance\dimen0-0.2\ht0
\setbox2=\hbox{\vrule height\ht0 depth -\dimen0}%
{\box0\lower0.8pt\box2}}
\LetLtxMacro{\oldsqrt}{\sqrt}
\renewcommand*{\sqrt}[2][\ ]{\oldsqrt[#1]{#2}}
\makeatother

% MAKE NUMERIC IN-TEXT CITATION BRACKETS ALSO COLOURED
\DeclareCiteCommand{\cite}[\color{mycitecolor!\myshade!black}\mkbibbrackets]% <--- this is new
  {\usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
   \usebibmacro{cite}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

% % Fixes issue where only the year was a clickable link in citation 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \DeclareCiteCommand{\cite}
%   {\usebibmacro{prenote}}
%   {\usebibmacro{citeindex}%
%    \printtext[bibhyperref]{\usebibmacro{cite}}}
%   {\multicitedelim}
%   {\usebibmacro{postnote}}

% \DeclareCiteCommand*{\cite}
%   {\usebibmacro{prenote}}
%   {\usebibmacro{citeindex}%
%    \printtext[bibhyperref]{\usebibmacro{citeyear}}}
%   {\multicitedelim}
%   {\usebibmacro{postnote}}

% \DeclareCiteCommand{\parencite}[\mkbibparens]
%   {\usebibmacro{prenote}}
%   {\usebibmacro{citeindex}%
%     \printtext[bibhyperref]{\usebibmacro{cite}}}
%   {\multicitedelim}
%   {\usebibmacro{postnote}}

% \DeclareCiteCommand*{\parencite}[\mkbibparens]
%   {\usebibmacro{prenote}}
%   {\usebibmacro{citeindex}%
%     \printtext[bibhyperref]{\usebibmacro{citeyear}}}
%   {\multicitedelim}
%   {\usebibmacro{postnote}}

% \DeclareCiteCommand{\footcite}[\mkbibfootnote]
%   {\usebibmacro{prenote}}
%   {\usebibmacro{citeindex}%
%   \printtext[bibhyperref]{ \usebibmacro{cite}}}
%   {\multicitedelim}
%   {\usebibmacro{postnote}}

% \DeclareCiteCommand{\footcitetext}[\mkbibfootnotetext]
%   {\usebibmacro{prenote}}
%   {\usebibmacro{citeindex}%
%    \printtext[bibhyperref]{\usebibmacro{cite}}}
%   {\multicitedelim}
%   {\usebibmacro{postnote}}

% \DeclareCiteCommand{\textcite}
%   {\boolfalse{cbx:parens}}
%   {\usebibmacro{citeindex}%
%    \printtext[bibhyperref]{\usebibmacro{textcite}}}
%   {\ifbool{cbx:parens}
%      {\bibcloseparen\global\boolfalse{cbx:parens}}
%      {}%
%    \multicitedelim}
%   {\usebibmacro{textcite:postnote}}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %----------------------------------------------------------------------------------------

\endinput