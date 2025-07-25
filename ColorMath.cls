% ColorMath 高中数学讲义模板
% 版本：v1.0.0
% 日期：2025-07-15

\ProvidesClass{ColorMath}[2025/07/15 v1.0.0 ColorMath Template]
\LoadClass[zihao=-4,oneside]{ctexbook}
%\LoadClass[oneside]{ctexbook}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{geometry}
\RequirePackage{comment}
\RequirePackage{graphicx}
\RequirePackage{pgfplots}
\RequirePackage{caption}
\RequirePackage{etoolbox}
\RequirePackage[colorlinks]{hyperref}
\RequirePackage{bookmark}
\RequirePackage{upgreek}
\RequirePackage{mathrsfs}
\RequirePackage{commath}

\pgfplotsset{compat=1.18}
%\geometry{a4paper, left=4.5cm, right=4.5cm, top=4cm, bottom=4cm}
%\geometry{a4paper, left=4cm, right=4cm, top=3cm, bottom=3cm}
\geometry{a4paper, left=2.5cm, right=2.5cm, top=1.5cm, bottom=1.5cm}

\setcounter{tocdepth}{1}

\theoremstyle{definition}
\newtheorem{question}{问题}[section]
\newtheorem{example}{例}[section]
\newtheorem{exercise}{练习}[section]
\newtheorem{formula}{公式}[section]
\newtheorem{definition}{定义}[section]
\newtheorem{theorem}{定理}[section]
\newtheorem{lemma}{引理}[section]
\newtheorem{corollary}{推论}[section]
\newtheorem{proposition}{命题}[section]
\newtheorem{property}{性质}[section]
\newtheorem*{solution}{解}

\theoremstyle{plain}
\newtheorem*{note}{注记}
\newtheorem*{analysis}{分析}

%\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{\bf 证明}
\newcommand{\pll}{\kern 0.56em/\kern -0.8em /\kern 0.56em}

\def\equationautorefname{式}
\def\footnoteautorefname{脚注}
\def\itemautorefname{项}
\def\figureautorefname{图}
\def\tableautorefname{表}
\def\partautorefname{篇}
\def\appendixautorefname{附录}
\def\chapterautorefname{章}
\def\sectionautorefname{节}
\def\paragraphautorefname{段落}
\def\subparagraphautorefname{子段落}
\def\FancyVerbLineautorefname{行}
\def\theoremautorefname{定理}
\def\exampleautorefname{例}
\def\questionautorefname{问题}
\def\exerciseautorefname{练习}
\def\formulaautorefname{公式}
\def\definitionautorefname{定义}
\def\lemmaautorefname{引理}
\def\propertyautorefname{性质}
% 对于没有编号的环境，如 solution，通常不需要定义 \autoref 名称

\def\pgfsysdriver{pgfsys-dvipdfm.def}
\usetikzlibrary{shapes.geometric}

%定义平行且等于符号
\newcommand\pxqdy{%
    \mathrel{\text{%
            \tikz[baseline,line width=0.05ex,line cap=round]
            \draw (0,0) -- (.7em,0)
            (0,.45ex) -- (.7em,.45ex)
            (.25em,.55ex) -- (.35em,1.6ex)
            (.45em,.55ex) -- (.55em,1.6ex);}}}

%定义平行四边形符号
\newcommand\pxsbx{%
    \mathord{\text{%
            \tikz[baseline,line width=0.05ex,line join=round]
            \draw (0,.1ex) -- (.8em,.1ex) -- (1em,1.6ex) -- (.2em,1.6ex) -- cycle;}}}

%定义弧段符号
\newcommand{\arc}[1]{\overset{\frown}{#1}}

% 定义新的命令来自动应用 \displaystyle
\newcommand{\dsum}{\displaystyle\sum}
\newcommand{\dprod}{\displaystyle\prod}

\title{\textsc{ColorMath}: 一份简单的高中数学讲义模版}
\author{LeyuDame}
\date{\today}