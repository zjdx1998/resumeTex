# resumeTex
A resume tex template for CS students who are looking for sde positions.

Preview: [resume.pdf](./resume.pdf)

## Usage

* required compiler: `xelatex`

* Overleaf usage: 

  * New blank project, then upload both `resume.tex` and `rsmclass.cls`.

    Or

  * Fork this project into your github. Select *"Import from GitHub"* when click the green New Project button in overleaf portal, then choose the repo you just forked. 

## Style

### Education

```tex
\begin{education}

\begin{degree}
	\type{M.S. Computer Science}
	\school{\textbf{Northeastern University}} 
	\gpa{4.0}
	\eng{City}{Seattle, WA, USA} % you can write your english score here. e.g. \eng{GRE}{339}
	\year{\textit{September 2021 -- May 2023}}
	\thesis{your thesis} % ignored by course master students
	\advisor{your advisor} % ignored by course master students
	\courses{your courses}	
\end{degree}
\end{education}
```

### Experience

```tex
\begin{experience}{Work Experience}
	\begin{job}
		\employer{\large{Google}}
		\mylogo{google.png}{0.1} % can place online resource here, can be scaled between 0.f~1.f
		\location{Mountain View, California}
		\position{Software Engineer Intern}
		\description{\\Incoming SDE intern.} % \\ can't be ignored
		\when{September 2022 -- December 2022}
	\end{job}
\end{experience}
```

### Projects

```tex
\begin{experience}{Selected Projects}
	\begin{job}
	\employer{Project Name}
	\position{Your position}
	\description{Description on your projects:	
	\setitemize{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt,leftmargin=20pt} % can't be ignored, you can adjust above parameters at your will.
	\begin{itemize}
		\item[$\bullet$] Frontend: Watch Movies
		\item[$\bullet$] Backend: Play Games
	\end{itemize}
	}
	\techstack{Javascript, Koa.js, DotA2, LOL}
	\when{August 2019 -- September 2019}
	\end{job}
\end{experience}
```

### Achievements

```tex
\begin{awards}
	\begin{award}
		\title{BCM International Collegiate Laughing Contest}  
		\role{\href{your certificate}{\textit{\underline{\textbf{Gold Medal}}}}}\startdate{November 2021}
	\end{award}
\end{awards}
```

### Skills

```tex
\begin{skills}
	\begin{itemize} 
		\item[] \textbf{Programming Languages}:\hfill PHP is the best language in the world.
		\item[] \textbf{Fullstack}:\hfill DotA2, LOL | CSGO, PUBG
	\end{itemize}
\end{skills}
```



## Others

You can customize your own style by modifying `rsmclass.cls` file

Here are some potential useful style:

```tex
Publications
\newenvironment{publications}{%
    {
    		\large\textbf{Publications}}%
    		%\vspace{-23pt}% move the first subtype up even with PUBLICATIONS

    		\medskip
        \newenvironment{journalarticles}{%
            \makebox[\textwidth][l]{\textbf{Refereed Journal Articles}}%
            \begin{enumerate}%
            \newenvironment{paper}{%
                \newif\ifjournal\journalfalse%
                \newif\ifvolume\volumefalse%
                \newif\ifnumber\numberfalse%
                \newif\ifmisc\miscfalse%
                \newif\ifpage\pagefalse%
                \newif\ifmonth\monthfalse%
                \renewcommand{\title}[1]{\def\@title{########1}}
                \renewcommand{\author}[1]{\def\@author{########1}}
                \newcommand{\journal}[1]{\def\@journal{########1}\journaltrue}
                \newcommand{\vol}[1]{\def\@vol{########1}\volumetrue}
                \newcommand{\num}[1]{\def\@num{########1}\numbertrue}
                \newcommand{\misc}[1]{\def\@misc{########1}\misctrue}
                \newcommand{\pages}[1]{\def\@pages{########1}\pagetrue}
                \renewcommand{\month}[1]{\def\@month{########1}\monthtrue}
                \renewcommand{\year}[1]{\def\@year{########1}}}
                {%\makebox[1in][l]{\hfill}\parbox[t]{\textwidth-1in}{%
                    \item \@author.  \@title. \ifjournal\textit{\@journal}. \fi\ifvolume\@vol\ifnumber(\@num)\ifpage,\ %
                    pp.\ \@pages\fi. \fi\fi\ifmonth\@month, \fi\@year.  \ifmisc\@misc.\fi%}

                \smallskip
            }
        }
        {
        \end{enumerate}
        \medskip
        }
```



## Reference

* https://ctan.org/pkg/clsguide
* https://ctan.org/tex-archive/macros/latex/contrib/vita (https://mirror.las.iastate.edu/tex-archive/macros/latex/contrib/vita/vita.cls)
* https://www.overleaf.com/learn/latex/Writing_your_own_class
