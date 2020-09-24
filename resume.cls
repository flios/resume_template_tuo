\ProvidesClass{resume}[Resume Class]

% \LoadClass[a4paper]{article} % Font size and paper type
\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{enumitem}
\usepackage{mathptmx}
\usepackage{pgffor}
\usepackage{import}

\pagestyle{empty} % Suppress page numbers

\newcommand{\addressSep}{$\cdot$} % Set default address separator to a diamond


\newcommand{\name}[1]{
  \centerline{\namesize\bf #1}
  \nameskip
}

\newcommand{\address}[1]{
  {
    \renewcommand{\\}{\addressSep }
    \centerline{#1}
    \addressskip
  }
}

\newenvironment{rSummery}{
  \sectionskip
  \hrule
  \begin{itemize}[label=$\triangleright$]{}
}{
  \end{itemize}
}

\newenvironment{rSection}[1]{
  \sectionskip
  \MakeUppercase{\bf #1} 
  \sectionlineskip
  \hrule % Horizontal line
  \begin{itemize}[label=\null,leftmargin=*,itemsep=-0.5em]{}
}{
  \end{itemize}
}

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
  {\bf #1} \hfill{\em #2}% Bold company name and date on the right
  \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
    \\
    {\em #3} \hfill {\em #4} % Italic job title and location
  }
  \begin{itemize}[label=$\bullet$,topsep=-0.5em,noitemsep]{}
}{
  \end{itemize}
}

\newenvironment{rProject}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
  {#1}
  \ifthenelse{\equal{#2}{}}{}{\hfill {\em #2}}% Bold company name and date on the right
  \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
    \\
    {\em #3} \hfill {\em #4} % Italic job title and location
  }
  \begin{itemize}[label=$\bullet$,topsep=-0.5em,noitemsep,itemsep=0em]{}
}{
  \end{itemize}
}



% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\newcommand{\namesize}{\Large} % Size of the name at the top of the document
\newcommand{\addressskip}{\smallskip} % The space between the two address (or phone/email) lines
\newcommand{\sectionlineskip}{\medskip} % The space above the horizontal line for each section
\newcommand{\nameskip}{\medskip} % The space after your name at the top
\newcommand{\sectionskip}{\smallskip} % The space after the heading section
