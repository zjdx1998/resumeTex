\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rsmclass}[2022/01/06 class file for constructing a resume]
%% Reference
%% https://ctan.org/pkg/clsguide
%% https://www.overleaf.com/learn/latex/Writing_your_own_class

%%%%
%
% Process options and load class article:
%---
\let\@optionsToInput=\@empty
\DeclareOption*{
  \IfFileExists{rsmclass\CurrentOption.clo}%
    {\edef\@optionToInput{rsmclass\CurrentOption.clo}}%
    {\PassOptionsToClass{\CurrentOption}{article}}
}
\ProcessOptions
\LoadClass{article}
\RequirePackage[left=0.2in,top=0.2in,right=0.2in,bottom=0.2in]{geometry}
\RequirePackage{calc}
\setlength{\parindent}{0pt}

\newif\ifname\namefalse
\newif\ifaddress\addressfalse
\newif\ifhome\homefalse
\newif\ifoffice\officefalse
\newif\ifemail\emailfalse
\newif\iffax\faxfalse
\newif\ifemployer\employerfalse
\newif\ifposition\positionfalse
\newif\ifmyurl\myurlfalse
\newif\ifmylin\mylinfalse
\newif\ifmygithub\mygithubfalse

\newcommand{\position}[1]{\def\@position{#1}\positiontrue}
\newcommand{\name}[1]{\renewcommand{\@author}{#1}
        \pagestyle{myheadings}\markright{\protect\small\@author\ $\bullet$
          \ifposition\@position\else Curriculum Vitæ\fi}\nametrue}
\newcommand{\employer}[1]{\def\@employer{#1}\employertrue}
\newcommand{\address}[1]{\def\@address{#1}\addresstrue}
\newcommand{\home}[1]{\def\@home{#1}\hometrue}
\newcommand{\office}[1]{\def\@office{#1}\officetrue}
\newcommand{\email}[1]{\def\@email{#1}\emailtrue}
\newcommand{\fax}[1]{\def\@fax{#1}\faxtrue}
\newcommand{\mylin}[1]{\def\@mylin{#1}\mylintrue}
\newcommand{\myurl}[2]{\def\@myurldes{#1}\def\@myurl{#2}\myurltrue}
\newcommand{\mygithub}[1]{\def\@mygithub{#1}\mygithubtrue}

%
% title commands
%
%\title{Curriculum Vitae}
\newcommand{\makeheader}{%
    \begin{center}
    {\LARGE\textbf{\@author}}

    \hrulefill 
    
    {\normalsize \ifposition\@position \\ \fi}
    {$\quad\bullet\quad$Mobile: \@home $\quad\bullet\quad$ Email: \@email $\quad\bullet\quad$\small \ifaddress\@address\fi   \\ 
      \ifmyurl$\quad\bullet\quad$ \@myurldes: \underline{\url{\@myurl}}\fi
      \ifmygithub$\quad\bullet\quad$ GitHub: \underline{\url{\@mygithub}}\fi\\
      \ifmylin$\quad\bullet\quad$ Linkedin: \underline{\url{\@mylin}}\fi
    }
    \end{center}
    \thispagestyle{empty}
    \gdef\@author{}\gdef\@position{}
    \vspace{0pt}
}

%
% Define new sections
%
\newcommand{\defsection}[1]{%
    \medskip
    \newenvironment{#1}{%
        {\large\
        	{#1}}
        
        \hrulefill
        }
        {
        %\medskip
        %\medskip
        }
}


%
% education
% 
\newenvironment{education}{%
        {\large\textbf{Education}}
        
        \hrulefill
        \begin{itemize}
        \newenvironment{degree}{%
            \newif\ifthesis\thesisfalse%
            \newif\ifgpa\gpafalse%
            \newif\ifeng\engfalse%
            \newif\ifother\otherfalse%
            \newif\ifadvisor\advisorfalse%
            \newif\ifcourses\coursesfalse%
            \newcommand{\type}[1]{\def\@type{####1}}
            \renewcommand{\year}[1]{\def\@year{####1}}
            \newcommand{\school}[1]{\def\@school{####1}}
            \newcommand{\gpa}[1]{\def\@gpa{####1}\gpatrue}
            \newcommand{\eng}[2]{\def\@engname{####1}\def\@engscore{####2}\engtrue}
            \newcommand{\thesis}[1]{\def\@thesis{####1}\thesistrue}
            \newcommand{\advisor}[1]{\def\@advisor{####1}\advisortrue}
            \newcommand{\other}[1]{\def\@other{####1}\othertrue}
        	\newcommand{\courses}[1]{\def\@courses{####1}\coursestrue}
        }
        {\item[] \@school \hfill\@year \\%
          \@type
          \ifthesis Thesis:\ \textit{\@thesis}.\\\fi%
          \ifadvisor Advisor: \@advisor.\\\fi%
          \ifgpa \hfill GPA: \@gpa\quad\fi%
          \ifeng \hfill \@engname: \@engscore\fi
          \ifcourses\\ Courses: \@courses\fi%
        }
    }
    {
    \end{itemize}
    %\medskip%
    }
        

%
% grants and awards
% 
\newenvironment{awards}{%
        {\large\textbf{Achievements}}
        
        \hrulefill
        \begin{itemize}
        \newenvironment{award}{%
            \newif\ifduration\durationfalse%
            \newif\ifamount\amountfalse%
            \newif\ifstartdate\startdatefalse%
            \newif\ifcollaborators\collaboratorsfalse%
            \newif\ifidnumber\idnumberfalse%
            \renewcommand{\title}[1]{\def\@title{####1}}
            \newcommand{\idnumber}[1]{\def\@idnumber{####1}\idnumbertrue}
            \newcommand{\role}[1]{\def\@role{####1}}
            \newcommand{\duration}[1]{\def\@duration{####1}\durationtrue}
            \newcommand{\amount}[1]{\def\@amount{####1}\amounttrue}
            \newcommand{\collaborators}[1]{\def\@collaborators{####1}\collaboratorstrue}
            \newcommand{\startdate}[1]{\def\@startdate{####1}\startdatetrue}
        }
        {\item[] \@title\quad \ifidnumber(\@idnumber)  \fi \hfill \@role\quad  %
            \ifstartdate\hfill\textit{\@startdate}\fi%
            \ifcollaborators Collaboration with \@collaborators.\fi%
            \ifduration Duration: \@duration\quad\fi%
            \ifamount Amount: \@amount\quad\fi%
        }
    }
    {
    \end{itemize}
    %\smallskip
    }
    
%
% experience section
%
\newenvironment{experience}[1]{%
        {\large\textbf{#1}}
        
        \hrulefill
        \begin{itemize}
        \newenvironment{job}{%
            \newif\ifdescription\descriptionfalse%
            \newif\ifmylogo\mylogofalse%
            \newif\iflocation\locationfalse%
            \newif\iftechstack\techstackfalse%
            \newcommand{\when}[1]{\def\@when{####1}}    	
            \newcommand{\mylogo}[2]{\def\@mylogo{####1}\def\@mylogosize{####2}\mylogotrue}
            \renewcommand{\employer}[1]{\def\@employer{####1}}
            \renewcommand{\position}[1]{\def\@position{####1}}
            \newcommand{\location}[1]{\def\@location{####1}\locationtrue}
            \renewcommand{\description}[1]{\def\@description{####1}\descriptiontrue}
            \newcommand{\techstack}[1]{\def\@techstack{####1}\techstacktrue}
        }
        {\item[] \ifmylogo \includegraphics[width=\@mylogosize\textwidth]{\@mylogo}\quad\fi\textbf{\@employer} \iftechstack\,| \textit{\@techstack}\fi\hfill\textit{\@when}\\
              \iflocation\textit{\@position}\hfill\textit{\@location}\fi
              \ifdescription \@description\fi%
              \smallskip  
        }	
    }
    {
    \end{itemize}
    }

%
% skills section
%
\newenvironment{skills}{%
        {\large\textbf{Technical Skills}}%
        
        \hrulefill
        \newenvironment{skill}{%
            \renewcommand{\description}[1]{\def\@description{####1}}
            \newcommand{\level}[1]{\def\@level{####1}}
        }
        {\makebox[1in][l]{\hfill}%
            \makebox[3in][l]{\@description}%
            \makebox[1in][l]{\@level}%
        }
    }
    {
    % \medskip
    }