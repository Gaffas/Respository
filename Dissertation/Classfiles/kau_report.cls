%-----------------------------------------------------------------------------
% KAU_REPORT.STY	Primary style for Bachelor Reports
%
% USAGE:  (LaTeX2e)    \documentclass[options]{kau_report}
%
% Modifies the {article} style, so that the title page and chapters
% are handled according to the KAU regulations
%-----------------------------------------------------------------------------
% 
% A number of useful macros are defined for use in this style.  The
% title page of a report contains several standard phrases with possibly
% ``variable'' information, such as the macro below which specify the
% publication number.
%
% \pubnum{}					        Publication number
%
% The usual LaTeX macros ``\author,'' ``\title,'' and ``\date'' work as
% defined in the LaTeX manual.  The argument to \date should be the date
% on which the candidate's final examination (defense) is scheduled.
%
% The publication number will be typeset in the upper right corner
% of the title page.
%
% The command ``\makekautitle'' will generate a title page formatted according
% to the Kau instructions, and including all of the information defined
% by the macros above.  The ``\makekautitle'' command should be used
% in place of the standard version, ``\maketitle''.
%
% The command ``\extrachapter'' will generate an unnumbered chapter heading,
% similar to the LaTeX ``\chapter*'' command.  In addition, ``\extrachapter''
% will produce an entry in the Table of Contents.  This command can be
% used in the {abstract} and {acknowledgements} environments, listed
% below, if desired.
%
% The initial portion of the report document, typically the approval page,
% abstract, and tables of contents, figures, and tables, are numbered in
% roman numerals, while the body of the report is numbered in arabic.  The
% {frontmatter} environment handles these page numbering conventions.  The
% author should place
%
%	\begin{frontmatter}
%	...(abstract, contents, etc.)
%	\end{frontmatter}
%
% immediately following the \makekautitle command.  The first entry in the
% {frontmatter} environment should generally be ``\approved.''  This
% command generates a spearate approval page.
%
% The abstract is produced with the {abstract} environment, which generates
% an unnumbered chapter without entry in the table of contents.  The author
% should use
%
%	\begin{abstract}
%	...(body of abstract goes here)
%	\end{abstract}
%
% within the {frontmatter} environment.
%
% An acknowledgements page is produced in the same way as the abstract, with
% the {acknowledgements} environment.
%
%
% 950201  Michael H. Kelsey    Adapted from original of unknown source.
% 990210  Anna Brunstrom       Adapted to KAU requirements
% 990420  Anna Brunstrom       Copyright page added + some minor updates
%-----------------------------------------------------------------------------

%%%
%%% Pre-define commands required for option-processing
%%%


  \NeedsTeXFormat{LaTeX2e}[1994/06/01]
  \ProvidesClass{Classfiles/kau_report}[1998/06/29 KAU Report class]
%
% Define actions for style options
%
%
  \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
  \ProcessOptions*			%% Process remaining options locally
  \LoadClass[a4paper]{article}		%% Standard REPORT format
  \RequirePackage{setspace}		%% Load package for double-spacing

%
%%%
%%% Override standard REPORT format for kau report layout requirements
%%%
%
\setstretch{1.5}			%% ``Double-spaced'' text

% Generate a blank page without page markers when needed
%
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}

% Set up listoffigures and listoftables commands to start on new page
%
\renewcommand\listoffigures{%
    \clearpage
    \section*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    }

\renewcommand\listoftables{%
    \clearpage
    \section*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    }

% Set up the margins
%
%\usepackage{a4wide}
\ifcase \@ptsize
    % mods for 10 pt
    \oddsidemargin  0.15 in     %   Left margin on odd-numbered pages.
    \evensidemargin 0.35 in     %   Left margin on even-numbered pages.
    \marginparwidth 1 in        %   Width of marginal notes.
    \oddsidemargin 0.25 in      %   Note that \oddsidemargin = \evensidemargin
    \evensidemargin 0.25 in
    \marginparwidth 0.75 in
    \textwidth 5.875 in % Width of text line.
\or % mods for 11 pt
    \oddsidemargin 0.1 in      %   Left margin on odd-numbered pages.
    \evensidemargin 0.15 in    %   Left margin on even-numbered pages.
    \marginparwidth 1 in       %   Width of marginal notes.
    \oddsidemargin 0.125 in    %   Note that \oddsidemargin = \evensidemargin
    \evensidemargin 0.125 in
    \marginparwidth 0.75 in
    \textwidth 6.125 in % Width of text line.
\or % mods for 12 pt
    \oddsidemargin -10 pt      %   Left margin on odd-numbered pages.
    \evensidemargin 10 pt      %   Left margin on even-numbered pages.
    \marginparwidth 1 in       %   Width of marginal notes.
%    \oddsidemargin 0 in      %   Note that \oddsidemargin = \evensidemargin
%    \evensidemargin 0 in
    \oddsidemargin -0.15 cm      %   Note that \oddsidemargin = \evensidemargin
    \evensidemargin -0.15cm
    \marginparwidth 0.75 in
    \textwidth 6.375 true in % Width of text line.
\fi

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries
                                   \setcounter{table}{0}
                                   \setcounter{figure}{0}
                                   \setcounter{equation}{0}}}

% We want roman page numbers in the frontmatter, and arabic afterward.
% use \begin{frontmatter} ... \end{frontmatter} to do this.
%
\newenvironment{frontmatter}%
{\pagenumbering{roman}}{\clearemptydoublepage\pagenumbering{arabic}}

\def\pubnum{\gdef\@pubnum}
\pubnum{}						% No publication number

\def\swepubnum{\gdef\@swepubnum}
\swepubnum{}	

\def\ackname{\gdef\@ackname}
\ackname{}	

\def\swetitle{\gdef\@swetitle}
\swetitle{}

\usepackage{graphicx}


%
% The titlepage must conform to KAU requirements
% We specify a new command to make the title

\newcommand{\makekautitle}{%
\ackname{Acknowledgements}
\enlargethispage{5cm}
\voffset = -2.5cm
\thispagestyle{empty}
   \centerline{\includegraphics[width=30mm]{Classfiles/kaueng}}
   \begin{center}
      Computer Science

      \vspace*{1.2cm}

      \hrule

      \vspace*{\stretch{1}}

     {\Large\bf \@author}

      \vspace*{\stretch{1}}

      {\LARGE\bf \@title\par}
      \vspace*{\stretch{2.4}}

     \hrule
     \vspace*{0.5cm}

     Degree Project for Master of Science in Engineering, Computer Engineering \\ \@pubnum
   \end{center}
   \pagebreak
   \voffset = 0cm
}


\newcommand{\makeswekautitle}{%
\ackname{Acknowledgements}
\enlargethispage{5cm}
\voffset = -2.5cm
\thispagestyle{empty}
   \centerline{\includegraphics[width=30mm]{Classfiles/kau}}
   \begin{center}
      Datavetenskap

      \vspace*{1.2cm}

      \hrule

      \vspace*{\stretch{1}}

     {\Large\bf \@author}

      \vspace*{\stretch{1}}

      {\LARGE\bf \@swetitle\par}
      \vspace*{\stretch{2.2}}

     \hrule
     \vspace*{0.5cm}

     Examensarbete f{\H o}r Civilingenj{\H o}rsexamen i Datateknik \\ \@swepubnum
   \end{center}
   \pagebreak
   \voffset = 0cm
}

%
% The copyright page is created with the copyrightpage command.

\newcommand{\copyrightpage}{%
%\enlargethispage{5cm}
\voffset = 2.5cm
\clearemptydoublepage
\thispagestyle{empty}
   \begin{center}

      \vspace*{\stretch{3}}

      {\LARGE\bf \@title\par}

      \vspace*{\stretch{1}}

     {\Large\bf \@author}

      \vspace*{\stretch{6}}

      \copyright $\,$ \the\year $\,$ The author(s) and Karlstad University

   \end{center}
   \pagebreak
   \voffset = 0cm
}



\newcommand{\swecopyrightpage}{%
%\enlargethispage{5cm}
\voffset = 2.5cm
\clearemptydoublepage
\thispagestyle{empty}
   \begin{center}

      \vspace*{\stretch{3}}

      {\LARGE\bf \@title\par}

      \vspace*{\stretch{1}}

     {\Large\bf \@author}

      \vspace*{\stretch{6}}

      \copyright $\,$ \the\year $\,$ F\"{o}rfattarna och Karlstads Universitet

   \end{center}
   \pagebreak
   \voffset = 0cm
}


% The approval page is created with the approved command.
% First we set up some macros and commands to use when creating
% the page.
%

\def\advisor{\gdef\@advisor}
\advisor{}	
\def\examiner{\gdef\@examiner}
\examiner{}	

\newcommand {\sigline}[1]
        {\vspace{0.3in} {\makebox[2.5in][l] {\hrulefill} \\}
        {\vspace{-0.15in} #1\\}}


\newlength{\approval}
        \settowidth {\approval}
        {This report is submitted in partial fulfillment 
         of the requirements}


\newcommand{\approved}{
\setcounter{page}{2}
\clearemptydoublepage
\pagestyle{plain}
\begin{center}

\noindent
\begin{minipage}{\approval} {This dissertation is submitted in partial fulfilment 
of the requirements for the Degree Project for Master of Science in Engineering, Computer Engineering. All material in this dissertation which is not my own work
has been identified and no material is included for which a degree has
previously been conferred.}
\end{minipage}

\vspace{1cm}

\sigline{\@author}
\vspace{4cm}
\makebox[\approval][l] {Approved, \@date} \\
\vspace{0.15in}
\sigline{Advisor: \@advisor}
\sigline{Examiner: \@examiner}
\end{center}
\clearemptydoublepage
}

\newcommand{\approvedtwo}[2]{
\setcounter{page}{2}
\clearemptydoublepage
\pagestyle{plain}
\begin{center}

\noindent
\begin{minipage}{\approval} {This report is submitted in partial fulfillment 
of the requirements for the Bachelor's degree in 
Computer Science. All material in this report which is not our own work
has been identified and no material is included for which a degree has
previously been conferred.}
\end{minipage}

\vspace{1cm}

\sigline{#1}
\sigline{#2}
\vspace{3cm}
\makebox[\approval][l] {Approved, \@date} \\
\vspace{0.15in}
\sigline{Advisor: \@advisor}
\sigline{Examiner: \@examiner}
\end{center}
\clearemptydoublepage
}

\newcommand{\approvedthree}[3]{
\setcounter{page}{2}
\clearemptydoublepage
\pagestyle{plain}
\begin{center}

\noindent
\begin{minipage}{\approval} {This report is submitted in partial fulfillment 
of the requirements for the Bachelor's degree in 
Computer Science. All material in this report which is not our own work
has been identified and no material is included for which a degree has
previously been conferred.}
\end{minipage}

\vspace{1cm}

\sigline{#1}
\sigline{#2}
\sigline{#3}
\vspace{2cm}
\makebox[\approval][l] {Approved, \@date} \\
\vspace{0.15in}
\sigline{Advisor: \@advisor}
\sigline{Examiner: \@examiner}
\end{center}
\clearemptydoublepage
}

\newcommand{\sweapproved}{
\setcounter{page}{2}
\clearemptydoublepage
\pagestyle{plain}
\begin{center}

\noindent
\begin{minipage}{\approval} {
Denna rapport \"{a}r skriven som en del av det arbete som kr\"{a}vs
f\"{o}r att erh{\aa}lla en kandidatexamen i datavetenskap. Allt
material i denna rapport, vilket inte \"{a}r mitt eget, 
har blivit tydligt identifierat och inget material \"{a}r inkluderat som
tidigare anv\"{a}nts f\"{o}r erh{\aa}llande av annan examen.}
\end{minipage}

\vspace{1cm}

\sigline{\@author}
\vspace{4cm}
\makebox[\approval][l] {Godk\"{a}nd, \@date} \\
\vspace{0.15in}
\sigline{Handledare: \@advisor}
\sigline{Examinator: \@examiner}
\end{center}
\clearemptydoublepage
}

\newcommand{\sweapprovedtwo}[2]{
\setcounter{page}{2}
\clearemptydoublepage
\pagestyle{plain}
\begin{center}

\noindent
\begin{minipage}{\approval} {
Denna rapport \"{a}r skriven som en del av det arbete som kr\"{a}vs
f\"{o}r att erh{\aa}lla en kandidatexamen i datavetenskap. Allt
material i denna rapport, vilket inte \"{a}r v{\aa}rt eget, 
har blivit tydligt identifierat och inget material \"{a}r inkluderat som
tidigare anv\"{a}nts f\"{o}r erh{\aa}llande av annan examen.}
\end{minipage}

\vspace{1cm}

\sigline{#1}
\sigline{#2}
\vspace{3cm}
\makebox[\approval][l] {Godk\"{a}nd, \@date} \\
\vspace{0.15in}
\sigline{Handledare: \@advisor}
\sigline{Examinator: \@examiner}
\end{center}
\clearemptydoublepage
}

\newcommand{\sweapprovedthree}[3]{
\setcounter{page}{2}
\clearemptydoublepage
\pagestyle{plain}
\begin{center}

\noindent
\begin{minipage}{\approval} {
Denna rapport \"{a}r skriven som en del av det arbete som kr\"{a}vs
f\"{o}r att erh{\aa}lla en kandidatexamen i datavetenskap. Allt
material i denna rapport, vilket inte \"{a}r v{\aa}rt eget, 
har blivit tydligt identifierat och inget material \"{a}r inkluderat som
tidigare anv\"{a}nts f\"{o}r erh{\aa}llande av annan examen.}
\end{minipage}

\vspace{1cm}

\sigline{#1}
\sigline{#2}
\sigline{#3}
\vspace{2cm}
\makebox[\approval][l] {Godk\"{a}nd, \@date} \\
\vspace{0.15in}
\sigline{Handledare: \@advisor}
\sigline{Examinator: \@examiner}
\end{center}
\clearemptydoublepage
}

% Set up the abstract and acknowledgement sections
%
\def\abstract{\section*{\abstractname}}		% \begin{abstract}
\def\endabstract{\clearpage}		% \end{abstract}

\def\acknowledgements{\clearpage\section*{\@ackname}}
\def\endacknowledgements{\clearpage}

% Set up the counters figures etc.
%
\renewcommand{\thetable}{\thesection.\arabic{table}}
\renewcommand{\thefigure}{\thesection.\arabic{figure}}
\renewcommand{\theequation}{\thesection.\arabic{equation}}

% The {thebibliography} environment should put an entry into the Table
% of Contents, just as the {abstract} and {acknowledgements} environments
% do.
%
\let\thesis@thebibliography=\thebibliography

\def\thebibliography#1{
\thesis@thebibliography{#1}%
  \addcontentsline{toc}{section}{\refname}
}
%
\endinput







