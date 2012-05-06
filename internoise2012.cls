% internoise2012.cls
% LaTeX Document Class for InterNoise 2012 Proceedings papers
% Copyright 2012 by Cameron Fackler, facklc@rpi.edu

\ProvidesClass{internoise2012}[2012/04/16 Version 1.0 InterNoise 2012
Proceedings]
\NeedsTeXFormat{LaTeX2e}

% pass through options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

% we're based on the regular LaTeX article class
\LoadClass[12pt,letterpaper]{article}

% set up page layout
\RequirePackage[top=1in,bmargin=0.75in,lmargin=1in,rmargin=1in]{geometry}

% use Times lookalike
\RequirePackage{times}

% indent paragraphs by 0.3"
\setlength\parindent{0.3in}

% use 12-point font for main text
% interline spacing is slightly smaller than default to better match
% the example formatting
\renewcommand\normalsize{%
  \@setfontsize\normalsize\@xiipt{14}
  \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\normalsize

% 16-point for title
\renewcommand\large{\@setfontsize\large\@xivpt{18}}

% section numbering only defined 2 levels deep
\setcounter{secnumdepth}{2}

% section headings 12-pt, bold, all caps
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {1em}{1em}{\normalsize\bf\MakeUppercase}}
% subsection headings 12-pt bold
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {1em}{1em}{\normalsize\bf}}

% "tab" to 0.3" following section number
\renewcommand*{\@seccntformat}[1]{\hb@xt@0.3in{\csname the#1\endcsname}}

% for header graphic
\RequirePackage{graphicx}

% get rid of page numbers by defining plain pagestyle to be empty
% done this way since titling package insists on using "plain"
\let\ps@plain\ps@empty
\pagestyle{empty}

% allow for nicer author definitions
\RequirePackage[blocks]{authblk}
\renewcommand{\Authsep}{\\}
\renewcommand{\Authand}{\\}
\renewcommand{\Authands}{\\}
\setlength{\affilsep}{0em}

% left align all front matter
\RequirePackage{titling}
% titling package automatically inserts space before title, get rid of this
\setlength{\droptitle}{-4em}
\renewcommand\maketitlehooka{%
  \begin{center}\includegraphics[width=2in]{InterNoise2012Logo}\end{center}}
\pretitle{\Large\bfseries}
\posttitle{\par \vskip 1em}
\preauthor{%
  \begin{flushleft}%
  \begin{tabular}[t]{@{}l}%
}
\postauthor{%
  \end{tabular}%
  \end{flushleft}%
}
% all author blocks should be on new line and left-aligned
\renewcommand*\and{%
\end{tabular}\\%
\vskip 1em
\begin{tabular}[t]{@{}l}}

% no date on paper
\date{}
\predate{}
\postdate{\vskip -1em}

% get alphabetic footnote markers, with ')' separation
\thanksmarkseries{alph}
\thanksheadextra{\,}{)}
\thanksfootextra{}{)\,}

% bold abstract text, same margins as body text
\renewenvironment{abstract}%
{\normalsize\bfseries\noindent\ignorespaces}%
{\normalfont\normalsize}%

% force indenting first paragraph of every section
\RequirePackage{indentfirst}

% move tables and figures to end of document
\RequirePackage[nolists,nomarkers,tablesfirst]{endfloat}
\renewcommand\efloatseparator{\par}
% force any last floats to be at top of page
\setlength{\@fptop}{0pt}

% TODO: submit this change upstream to endfloat package
% do not start a new page before outputting tables and figures
\renewcommand\processfigures{%
 \expandafter\ifnum \csname @ef@fffopen\endcsname>0
  \immediate\closeout\efloat@postfff \ef@setct{fff}{0}
  \markboth{\uppercase{\figuresection}}{\uppercase{\figuresection}}
  \processfigures@hook \@input{\jobname.fff}
 \fi}
\renewcommand\processtables{%
  \expandafter\ifnum \csname @ef@tttopen\endcsname>0
  \immediate\closeout\efloat@postttt \ef@setct{ttt}{0}
  \markboth{\uppercase{\tablesection}}{\uppercase{\tablesection}}
  \processtables@hook \@input{\jobname.ttt}
 \fi}

% This is a nasty hack. However, the endfloat package calls \onecolumn
% before outputting tables and figures, forcing them to start on a new
% page. The paper guidelines forbid this...hence the hack.
\renewcommand\onecolumn{}

% make table and figure captions follow sample formatting
\RequirePackage{caption}
% captions are 12-pt italic, left aligned
\captionsetup{format=hang,labelsep=endash,singlelinecheck=false,
  justification=justified,font={normalsize,it}}
% change figure label to "Fig." as in example
\captionsetup[figure]{name=Fig.}

% require natbib for reference handling
\RequirePackage[sort&compress,super,comma]{natbib}
% get a section number for references
\renewcommand\bibsection{\section{References}}
\bibliographystyle{jasanum}
% redefine number format in reference list
\renewcommand\bibnumfmt[1]{#1.}
