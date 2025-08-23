% ColorMath 高中数学讲义模板
% 版本：v1.1.1
% 作者：LeyuDame
% 日期：2025-08-23

\ProvidesClass{ColorMath}[2025/08/23 v1.1.1 ColorMath Template]

%%% 定义布尔变量和默认值
\newif\ifcolormathbox\colormathboxfalse    % 默认关闭彩色框
\newif\ifcolormathminimal\colormathminimalfalse  % 默认关闭极简模式

%%% 处理类选项
\DeclareOption{colorbox}{\colormathboxtrue}      % 启用彩色框
\DeclareOption{nocolorbox}{\colormathboxfalse}   % 关闭彩色框
\DeclareOption{minimal}{\colormathminimaltrue\colormathboxfalse}  % 极简模式
\DeclareOption{fancy}{\colormathboxtrue}         % 花哨模式（彩色框）

% 传递其他选项给 ctexart
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

\LoadClass[zihao=5,oneside]{ctexart}
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
\RequirePackage{xcolor}
\RequirePackage{bookmark}
\RequirePackage{upgreek}
\RequirePackage{mathrsfs}
\RequirePackage{commath}
\RequirePackage{multirow}

\pgfplotsset{compat=1.18}
\geometry{a4paper, scale=0.8}

\setcounter{tocdepth}{2}

% 目录两栏排版
\usepackage{multicol}
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
    \begin{multicols}{2}
        \oldtableofcontents
    \end{multicols}%
}

% 彩色定理环境依赖
\RequirePackage{xcolor}
\ifcolormathbox
    \RequirePackage[framemethod=TikZ]{mdframed}
\fi
\RequirePackage{thmtools}

% 颜色定义
\definecolor{PinkRed}{RGB}{251,46,179}    % 原理性环境用红色
\definecolor{BNUBlue}{RGB}{8,70,139}    % 例题/问题用蓝色
\definecolor{THUPurple}{RGB}{128,36,135}   % 练习用紫色
\definecolor{SYUSGreen}{RGB}{11,88,43}   % 定义用绿色
\definecolor{Orange}{RGB}{151,63,5} % 推论用橙色

\hypersetup{
    colorlinks=true,
    linkcolor=PinkRed,
    urlcolor=PinkRed,
    citecolor=PinkRed
}

% 定理环境样式定义
\ifcolormathbox
    % 彩色框模式
    % 红色：定理、公式、命题、引理、性质
    \mdfdefinestyle{mdredbox}{%
        skipabove=8pt,
        skipbelow=0pt,
        linewidth=1pt,
        rightline=false,
        leftline=true,
        topline=false,
        bottomline=false,
        linecolor=PinkRed,
        backgroundcolor=PinkRed!5,
    }
    \declaretheoremstyle[
        headfont=\bfseries\sffamily\color{PinkRed!70!black},
        bodyfont=\normalfont,
        spaceabove=2pt,
        spacebelow=1pt,
        mdframed={style=mdredbox},
        headpunct={},
        postheadspace={1em},
        headformat={\NAME\ \NUMBER\NOTE},
    ]{thmredbox}

    % 蓝色：例题、问题
    \mdfdefinestyle{mdbluebox}{%
        skipabove=8pt,
        skipbelow=0pt,
        linewidth=1pt,
        rightline=false,
        leftline=true,
        topline=false,
        bottomline=false,
        linecolor=BNUBlue,
        backgroundcolor=BNUBlue!5,
    }
    \declaretheoremstyle[
        headfont=\bfseries\sffamily\color{BNUBlue!70!black},
        bodyfont=\normalfont,
        spaceabove=2pt,
        spacebelow=1pt,
        mdframed={style=mdbluebox},
        headpunct={},
        postheadspace={1em},
        headformat={\NAME\ \NUMBER\NOTE},
    ]{thmbluebox}

    % 紫色：练习
    \mdfdefinestyle{mdpurplebox}{%
        skipabove=8pt,
        skipbelow=0pt,
        linewidth=1pt,
        rightline=false,
        leftline=true,
        topline=false,
        bottomline=false,
        linecolor=THUPurple,
        backgroundcolor=THUPurple!5,
    }
    \declaretheoremstyle[
        headfont=\bfseries\sffamily\color{THUPurple!70!black},
        bodyfont=\normalfont,
        spaceabove=2pt,
        spacebelow=1pt,
        mdframed={style=mdpurplebox},
        headpunct={},
        postheadspace={1em},
        headformat={\NAME\ \NUMBER\NOTE},
    ]{thmpurplebox}

    % 橙色：推论
    \mdfdefinestyle{mdorangebox}{%
        skipabove=8pt,
        skipbelow=0pt,
        linewidth=1pt,
        rightline=false,
        leftline=true,
        topline=false,
        bottomline=false,
        linecolor=Orange,
        backgroundcolor=Orange!5,
    }
    \declaretheoremstyle[
        headfont=\bfseries\sffamily\color{Orange!70!black},
        bodyfont=\normalfont,
        spaceabove=2pt,
        spacebelow=1pt,
        mdframed={style=mdorangebox},
        headpunct={},
        postheadspace={1em},
        headformat={\NAME\ \NUMBER\NOTE},
    ]{thmorangebox}

    % 绿色：定义
    \mdfdefinestyle{mdgreenbox}{%
        skipabove=8pt,
        skipbelow=0pt,
        linewidth=1pt,
        rightline=false,
        leftline=true,
        topline=false,
        bottomline=false,
        linecolor=SYUSGreen,
        backgroundcolor=SYUSGreen!5,
    }
    \declaretheoremstyle[
        headfont=\bfseries\sffamily\color{SYUSGreen!70!black},
        bodyfont=\normalfont,
        spaceabove=2pt,
        spacebelow=1pt,
        mdframed={style=mdgreenbox},
        headpunct={},
        postheadspace={1em},
        headformat={\NAME\ \NUMBER\NOTE},
    ]{thmgreenbox}
\else
    % 普通模式（无彩色框）
    \ifcolormathminimal
        % 极简模式
        \declaretheoremstyle[
            headfont=\bfseries,
            bodyfont=\normalfont,
            spaceabove=6pt,
            spacebelow=6pt,
            headpunct={.},
            postheadspace={1em},
        ]{thmplain}
    \else
        % 标准模式（有颜色但无框）
        \declaretheoremstyle[
            headfont=\bfseries,
            bodyfont=\normalfont,
            spaceabove=6pt,
            spacebelow=6pt,
            headpunct={},
            postheadspace={1em},
            headformat={\NAME\ \NUMBER\NOTE},
        ]{thmplain}
    \fi
    % 所有环境都使用同一个样式
    \let\thmredbox\thmplain
    \let\thmbluebox\thmplain
    \let\thmpurplebox\thmplain
    \let\thmorangebox\thmplain
    \let\thmgreenbox\thmplain
\fi

% 定理环境声明
\declaretheorem[style=thmredbox,name=定理,numberwithin=section]{theorem}
\declaretheorem[style=thmredbox,name=公式,sibling=theorem]{formula}
\declaretheorem[style=thmredbox,name=命题,sibling=theorem]{proposition}
\declaretheorem[style=thmredbox,name=引理,sibling=theorem]{lemma}
\declaretheorem[style=thmredbox,name=性质,sibling=theorem]{property}
\declaretheorem[style=thmbluebox,name=例,numberwithin=section]{example}
\declaretheorem[style=thmbluebox,name=题目,sibling=example]{question}
\declaretheorem[style=thmpurplebox,name=练习,numberwithin=section]{exercise}
\declaretheorem[style=thmorangebox,name=推论,sibling=theorem]{corollary}
\declaretheorem[style=thmgreenbox,name=定义,numberwithin=section]{definition}

% 其它定理环境保持原样
\theoremstyle{definition}
\newtheorem*{solution}{解}

\theoremstyle{plain}
\newtheorem*{note}{注记}
\newtheorem*{analysis}{分析}
\newtheorem*{hint}{提示}

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
\def\sectionautorefname{讲}
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
\newcommand{\dsum}{\displaystyle\sum} % 定义求和符号
\newcommand{\dprod}{\displaystyle\prod} % 定义连乘符号

\newenvironment{centertikzpicture}
{\begin{center}\begin{tikzpicture}}
            {\end{tikzpicture}\end{center}}

\AtBeginEnvironment{question}{\setcounter{figure}{\value{question}}}

\renewcommand{\thefigure}{\thesection-\arabic{figure}}
\counterwithin{figure}{section}


% 让 section, subsection 等标题左对齐
\ctexset{
    section = {
      format = \raggedright\zihao{-3}\bfseries,
      name = {第,讲},
      aftername = \hspace{0.5em},
      number = \chinese{section},
      beforeskip = 1.2em,
      afterskip = 1em,
     },
    subsection = {
            format = \raggedright\zihao{-4}\bfseries,
            %name = {},
            aftername = \hspace{0.5em},
            %number = \arabic{subsection},
            beforeskip = 1em,
            afterskip = 0.8em,
        },
    subsubsection = {
            format = \raggedright\zihao{-4}\bfseries,
            name = {,.},
            aftername = \hspace{0.5em},
            number = \Roman{subsubsection},
            beforeskip = 0.8em,
            afterskip = 0.6em,
        }
}

% 定义空白行命令, 用于练习或填空
% 可选参数指定空白行数，默认7行
% 使用示例：\blank[5] 或 \blank
\newcommand{\blank}[1][7]{\vspace{#1\baselineskip}}

\setlength{\columnsep}{0.2cm} % 设置全局间距

\title{\textsc{ColorMath}: 一份简单的高中数学讲义模版}
\author{LeyuDame}
\date{\today}