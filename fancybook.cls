\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancybook}[06-08-2024 V1.0 fancybook Class]
% /* -------------------------------------------------------------------------- */
% /* -------------------------------------------------------------------------- */
% /*                                    切换文类                                    */
% /* -------------------------------------------------------------------------- */
\DeclareKeys{% = \DeclareKeys[autoclass]
  lang .choice: ,
  lang/en .code:n = \def\fancybook@class{book} ,
  lang/cn .code:n = \def\fancybook@class{ctexbook} ,
  lang .initial:n = en ,
  unknown .code:n = \fancybook@unknown ,
}

\ExplSyntaxOn
\clist_new:N \fancybook@unknownoptions
\cs_new_protected:Npn \fancybook@unknown
  {
    \bool_if:NTF \l__keys_no_value_bool
      { % eg. 12pt, twoside
        \clist_put_right:Nx \fancybook@unknownoptions
          { \l_keys_key_str }
      }
      { % eg. zihao=4, fontset=windows
        \clist_put_right:Nx \fancybook@unknownoptions
          { \l_keys_key_str = { \exp_not:o \l_keys_value_tl } }
      }
  }
\ExplSyntaxOff

\ProcessKeyOptions % = \ProcessKeyOptions[fancybook]
\PassOptionsToClass\fancybook@unknownoptions\fancybook@class
%% 如果不需要过滤上面定义的 lang 等键，可以直接使用
%% \PassOptionsToClass\@raw@classoptionslist\fancybook@class

\LoadClass{\fancybook@class}
% /* ---------------------------------- 切换文类 ---------------------------------- */


% /* -------------------------------------------------------------------------- */
% /*                           判断 A4 paper程序                          */
% /* -------------------------------------------------------------------------- */
\ExplSyntaxOn
\cs_new:Npn \ifaivpaper@TF 
  { 
    \bool_lazy_and:nnTF 
      { \dim_compare_p:nNn { 297mm } = { \paperheight } } % 不能是 29.7cm
      { \dim_compare_p:nNn { 210mm } = { \paperwidth  } }
  }
\ExplSyntaxOff
% \ifaivpaper@TF{a4paper内容}{not a4paper内容} % 这个用在想要判断a4paper的地方
% /* -------------------------------------------------------------------------- */
% /*                           判断 A4 paper程序                          */
% /* -------------------------------------------------------------------------- */

\usepackage[dvipsnames,svgnames,x11names,table]{xcolor}
\usepackage{cncolours}
\usepackage{pgfornament-han}
\usepackage{tikz}
\usetikzlibrary{calc,shadows,hobby,intersections, decorations.markings, decorations.pathreplacing,spy,arrows,shapes,fadings,trees,mindmap,patterns,shapes.arrows,shapes.symbols,tikzmark,shapes.geometric,graphs, quotes, angles,decorations.pathmorphing,through,shadings,backgrounds,positioning,fit,arrows.meta,shapes.misc,decorations.shapes}
\RequirePackage{pgfplots} %画图 %%页面样式设计核心包 %提供\pgfonlayer命令以及下列图层指令
\pgfplotsset{compat=1.18}
\usepackage{pifont}
\usepackage{stys/beautybook-cover-birkar}
\usepackage{stys/beautybook-bottompage}
\input{stys/symbols}
\usepackage{amsmath,amssymb,amsfonts}
\definecolor{nuanbai}{HTML}{f5f5f5}
\pagecolor{nuanbai}
\usepackage{makeidx}
\usepackage{etoolbox} % 判断函数
\usepackage{paracol}
\usepackage{etoc}
\usepackage{extarrows}
\usepackage{calc}
\usepackage{xkeyval,ifthen}
\usepackage[backgroundcolor=yellow!40!cyan!20,bordercolor=yellow!40!cyan!20,linecolor=DarkCyan]{todonotes}
\usepackage{varwidth}
\usepackage[colorlinks
,linkcolor = magenta,		%%修改此处为你想要的颜色
anchorcolor = magenta,	%%修改此处为你想要的颜色
urlcolor = magenta,		%%修改此处为你想要的颜色
citecolor = magenta,		%%修改此处为你想要的颜色
]{hyperref}
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}%增加编号深度
\usepackage{dashrule}
\newlength\outermarginwidth
\setlength\outermarginwidth{2cm}
\newlength\covershift
\setlength\covershift{5cm}
\makeatletter
% ---------------------------------- 封面信息定义 ---------------------------------- %
\newcommand*\bookseries[1]{\def\@bookseries{#1}}
\newcommand*\subtitle[1]{\def\@subtitle{#1}}
\newcommand*\edition[1]{\def\@edition{#1}}
\newcommand*\presslogo[1]{\def\@presslogo{#1}}
\newcommand*\pressname[1]{\def\@pressname{#1}}
\newcommand*\coverimage[1]{\def\@coverimage{#1}}
% ---------------------------------- 封面信息定义 ---------------------------------- %
\makeatother
\usepackage{indentfirst}
\usepackage{physics}
\usepackage{bropd,bm}

% ----------------------------------- 字体设置 ----------------------------------- %
\defaultfontfeatures{Path=fonts/} % 定义默认的字体存放位置路径
\setCJKmainfont[BoldFont={FZheiti_GBK.TTF},ItalicFont={FZBWKSK.TTF},SlantedFont = {HYShuFang_75W.ttf}]{FZsong_GBK.TTF}
\setCJKsansfont[BoldFont={HYShuFang_75W.ttf},ItalicFont={FZBWKSK.TTF},SlantedFont = {FZkaiti_GBK.TTF}]{FZheiti_GBK.TTF}
\setCJKmonofont{FZfangsong_GBK.TTF}
\newCJKfontfamily[kaishu]\kaishu{FZkaiti_GBK.TTF}
\newCJKfontfamily[shufang]\shufang{HYShuFang_75W.ttf}
% /* ---------------------------------------------------------------------------- */
\setmainfont[
    Path=fonts/times/,
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf
]
{times.ttf}
\renewcommand{\partial}{∂}
\setsansfont[BoldFont=HONORSans-Bold.ttf%, ItalicFont=ItalicFontName, BoldItalicFont=BoldItalicFontName
]{HONORSansCN-Regular.ttf}
\setmonofont[
    Path=fonts/mono/,
    BoldFont=IBMPlexMono-Bold.ttf,
    ItalicFont=IBMPlexMono-Italic.ttf,
    BoldItalicFont=IBMPlexMono-BoldItalic.ttf
]
{IBMPlexMono-Medium.ttf} % /-Regular
% ----------------------------------- 字体设置 ----------------------------------- %
\usepackage[left=2cm,right=2cm,top=.8cm,bottom=3.6cm]{geometry}
\usepackage{xpatch}%修正章节编号
\usepackage[automark]{scrlayer-scrpage}%页面设置宏包,隶属于koma-script文档类
% \setcounter{secnumdepth}{5}%增加编号深度
% \setcounter{tocdepth}{3} %增加目录深度
\usepackage{fontawesome5}
\usepackage{mathrsfs}

\usepackage[most]{tcolorbox}
\tcbuselibrary{breakable, skins,theorems}%TcolorBox Library
\usepackage{tabularx}
\usepackage{tikz-cd}
\usepackage{lastpage}
\usepackage{ninecolors}
\usepackage{colortbl} %彩色表格
\usepackage{tabularray}
\usepackage{pgfornament}
\usepackage{zhnumber}
\usepackage{dashrule}
\usepackage{adjustbox}
\usepackage{enumitem}\setlist{font=\upshape} % 取消所有列表默认距离 nosep,
\usepackage{multicol}
\usepackage{amsthm}
\usepackage{bclogo}
\usepackage{ulem}
\usepackage{graphicx}%修正minipage顶部对齐问题

\definecolor{qing}{HTML}{a88462}
\definecolor{xieqing}{HTML}{88ada6}
\definecolor{hex}{RGB}{217,230,232}

\newcommand{\triangler}[2][teal]{
\begin{tikzpicture}[remember picture]
\def\x{#2}
\filldraw[#1] (-\x,\x) -- (0,0) --(-\x,-\x)--cycle;
\filldraw[#1] (0,\x) -- (\x,0) -- (0,-\x)--cycle;
\filldraw[#1] (\x,\x) -- (2*\x,0) -- (\x,-\x)--cycle;
\end{tikzpicture}
}
\newcommand{\trianglel}[2][teal]{
\begin{tikzpicture}[remember picture]
\def\x{#2}
\filldraw[#1] (\x,\x) -- (0,0) --(\x,-\x)--cycle;
\filldraw[#1] (0,\x) -- (-\x,0) -- (0,-\x)--cycle;
\filldraw[#1] (-\x,\x) -- (-2*\x,0) -- (-\x,-\x)--cycle;
\end{tikzpicture}
}
\usepackage{lastpage}
% 重置\rightmark与\leftmark名称
\renewcommand{\chaptermark}[1]{\markboth{第{\upshape\thechapter} 章~ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{{\upshape\thesection}\ #1}}

\setlength{\headheight}{50pt}
\newlength\headradii
\setlength\headradii{.16\headheight}
\newcommand{\headstyle}{
    \begin{tikzpicture}[remember picture,overlay]
    \ifodd\value{page}
    \path[fill,gray!40]
    ([xshift=-\headheight,yshift=-.9\headheight]current page.north east) -- ([xshift=-.9\headheight-2cm,yshift=-.9\headheight]current page.north east) coordinate (NW) -- ([xshift=-3pt,yshift=-3.5pt]NW) node[above,text=black] (vline) {\color{black}\tikz\draw[line width=1pt] (0,0)--(0,.3\headheight);}--([xshift=-6pt]NW) -- ([xshift=\headheight,yshift=-.9\headheight]current page.north west)|-([xshift=-\headheight,yshift=-\headheight]current page.north east) --cycle;
    % \node[right,font=\upshape] at (vline) {\thepage\ (\pageref{LastPage})};
    \node[above left] at ([shift={(0,-.5\baselineskip)}]vline) {\begin{varwidth}{.9\linewidth}\setlength{\baselineskip}{2.5ex}\trianglel[gray!50]{.45em}\rightmark\end{varwidth}};
    \path[fill,xieqing] ([shift={(-\headheight,-.9\headheight+2*\headradii)}]current page.north east) coordinate (NE) -- ([shift={(-1.5cm,0)}]NE) arc(90:270:\headradii) -- ([shift={(0,-2*\headradii)}]NE)--cycle;
    \fill[xieqing!30] ([shift={(-1.5cm,0)}]NE) coordinate (ul) arc(90:270:\headradii)--++(1cm,0) coordinate (dr) arc(-90:90:\headradii)--cycle;
    \node[font=\bfseries\upshape,text=black](pagenumber) at ($(ul)!0.5!(dr)$) {第 \thechapter\ 章};
        \else % 偶数页
        \path[fill,gray!40]
        ([xshift=\headheight,yshift=-.9\headheight]current page.north west) -- ([xshift=.9\headheight+2cm,yshift=-.9\headheight]current page.north west) coordinate (NW) -- ([xshift=3pt,yshift=-3.5pt]NW) node[above,text=black] (vline) {\color{black}\tikz\draw[line width=1pt] (0,0)--(0,.3\headheight);}--([xshift=6pt]NW) -- ([xshift=-\headheight,yshift=-.9\headheight]current page.north east)|-([xshift=\headheight,,yshift=-\headheight]current page.north west) --cycle;
    % \node[left,font=\upshape] at (vline) {(\pageref{LastPage})\ \thepage};
    \node[above right] at ([shift={(0,-.5\baselineskip)}]vline) {\begin{varwidth}{.9\linewidth}\setlength{\baselineskip}{2.5ex}\leftmark\triangler[gray!50]{.45em}\end{varwidth}};
    \path[fill,xieqing] ([shift={(\headheight,-.9\headheight+2*\headradii)}]current page.north west) coordinate (Nl) -- ([shift={(1.5cm,0)}]Nl) arc(90:-90:\headradii) -- ([shift={(0,-2*\headradii)}]Nl)--cycle;
    \fill[xieqing!30] ([shift={(1.5cm,0)}]Nl) coordinate (ull) arc(90:-90:\headradii)--++(-1cm,0) coordinate (drr) arc(270:90:\headradii)--cycle;
    \node[font=\bfseries\upshape,text=black](pagenumberr) at ($(ull)!0.5!(drr)$) {\thesection\ 节};
    \fi
    \end{tikzpicture}
}
\newcommand{\pageheadstyle}{%
    \begin{tikzpicture}[remember picture,overlay]
    \coordinate (page head odd) at ([shift={(-\headheight,-.8\headheight)}]current page.north east);
    \coordinate (page head even) at ([shift={(\headheight,-.8\headheight)}]current page.north west);
    \ifodd\value{page}
    \node[single arrow ,fill=hex!50,font=\bfseries\upshape,text=black,minimum height=8mm,left]
    (page head information odd) at (page head odd) {\begin{varwidth}{.85\linewidth}\setlength{\baselineskip}{2.5ex}\leftmark\end{varwidth}};
    \else 
    \node[signal ,fill=hex!50,font=\bfseries\upshape,text=black,minimum height=8mm,right]
    (page head information even) at (page head even) {\begin{varwidth}{.85\linewidth}\setlength{\baselineskip}{2.5ex}\rightmark\end{varwidth}};
    \fi    
    \end{tikzpicture}
}
\ihead{}
\ohead{}
\setlength{\headheight}{50pt}
\chead{\headstyle}
%%页脚
\ifoot{}
\cfoot{}
\ofoot{\footSt}
\setlength\footheight{50pt}
\newcommand{\footSt}{
    \begin{tikzpicture}[remember picture,overlay]
        \coordinate (page num odd) at ([shift={(\footheight,.9\footheight)}]current page.south west);
        \coordinate (page num even) at ([shift={(-\footheight,.9\footheight)}]current page.south east);
        \ifodd\value{page}
    \node[circle,fill=gray!30,text=black,font=\upshape,minimum size=6mm] (page numr) at (page num even) {\thepage};
        \draw[line width=1.5pt] (page numr.west)--([xshift=-.2\linewidth]page numr.west) node[font=\slshape,text=black,left] {\begin{varwidth}{.75\linewidth}\setlength{\baselineskip}{2.5ex}\leftmark\end{varwidth}};
        \else 
        \node[circle,fill=gray!30,text=black,font=\upshape,minimum size=6mm] (page numl) at (page num odd) {\thepage};
        \draw[line width=1.5pt] (page numl.east)--([xshift=.2\linewidth]page numl.east) node[font=\slshape,text=black,right] {\begin{varwidth}{.75\linewidth}\setlength{\baselineskip}{2.5ex}\rightmark\end{varwidth}};
        \fi
    \end{tikzpicture}
}
\usepackage[explicit]{titlesec}
\newtheorem*{solution}{\textbf{解答:~}}
\newtheorem{defi}{\textbf{定义}}[section]
\newtheorem{thm}{\textbf{定理}}[section]
\newtheorem{lem}{\textbf{引理}}[section]
\newtheorem{prop}{\textbf{命题}}[section]
\renewcommand{\proofname}{\textbf{证明.}}
\newtheorem{exam}{\textbf{题}}[chapter]
\newtheorem{problem}{\textbf{问题}}[chapter]
\newtheorem{cor}{\textbf{推论}}[chapter]
\newtheorem*{remark}{\textbf{评注}}

\definecolor{thm}{HTML}{8b968d}
\definecolor{def}{HTML}{5c9291}
\definecolor{lem}{HTML}{5b7e91}
\definecolor{deepblue}{HTML}{43676b}

\tcolorboxenvironment{thm}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=thm!20, boxrule=0pt, top=0pt, bottom=2pt, left=2.5mm,right=2.5mm, borderline west={1.2mm}{0mm}{thm}, frame hidden,parbox=false,before upper=\par,before lower=\par}

\tcolorboxenvironment{defi}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=def!20, boxrule=0pt, top=0pt, bottom=2pt, left=2.5mm,right=2.5mm, borderline west={1.2mm}{0mm}{def}, frame hidden,parbox=false,before upper=\par,before lower=\par}

\tcolorboxenvironment{lem}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=lem!20, boxrule=0pt, top=0pt, bottom=2pt, left=2.5mm,right=2.5mm, borderline west={1.2mm}{0mm}{lem}, frame hidden,parbox=false,before upper=\par,before lower=\par}

\tcolorboxenvironment{prop}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=thm!20, boxrule=0pt, top=0pt, bottom=2pt, left=2.5mm,right=2.5mm, borderline west={1.2mm}{0mm}{thm}, frame hidden,parbox=false,before upper=\par,before lower=\par}

\tcolorboxenvironment{exam}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=thm!20, boxrule=0pt, top=0pt, bottom=2pt, left=2.5mm,right=2.5mm, borderline west={1.2mm}{0mm}{thm}, frame hidden,parbox=false,before upper=\par,before lower=\par}

\tcolorboxenvironment{problem}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=thm!20, boxrule=0pt, top=0pt, bottom=2pt, left=2.5mm,right=2.5mm, borderline west={1.2mm}{0mm}{thm}, frame hidden,parbox=false,before upper=\par,before lower=\par}

\tcolorboxenvironment{cor}{enhanced jigsaw, breakable, enlarge left by=-3.5mm, width=\textwidth+3.5mm, colback=lem!20, boxrule=0pt, top=0pt, bottom=2pt, left=2.5mm,right=2.5mm, borderline west={1.2mm}{0mm}{lem}, frame hidden,parbox=false,before upper=\par,before lower=\par}
\newtheorem{Remark}{Remark}[section]
\newcommand*{\circled}[1]{\lower.7ex\hbox{\tikz\draw (0pt, 0pt)%
    circle (.5em) node {\makebox[1em][c]{\small #1}};}}
\newcommand{\exercise}[2][\bcicosaedre]{\bigskip
\begin{tikzpicture}[remember picture,overlay]
\draw[line width=2pt,loosely dotted,teal] (0,0)--node[pos=0.4,rectangle,minimum height=1.5em,font=\sffamily\Large,text=black,fill=black!2,drop shadow={opacity=.3, shadow xshift=0.1cm},anchor=center,
	inner sep=1.5mm,
	anchor=west,] {$#1$  ~ #2} (\linewidth,0);
\end{tikzpicture}\bigskip\smallskip
}
\usepackage{extarrows}
\newenvironment{eq}[1]{\begin{equation}\begin{aligned}#1}{\end{aligned}\end{equation}} %有编号
\newenvironment{eq*}[1]{\begin{equation*}\begin{aligned}#1}{\end{aligned}\end{equation*}} %无编号
\everymath{\displaystyle}

%% --------目录页样式定制
\titleformat{\chapter}{\huge\bfseries\filcenter}{}{1em}{
    \begin{tikzpicture}[remember picture, overlay]%
        \fill[deepblue!18,opacity=.5] (current page.north west) rectangle ++(\paperwidth,-.2\paperheight);
        \node[left,font=\huge\bfseries] (contents name) at ([shift={(0cm,-3cm)}]current page.north east) {\begin{varwidth}{\linewidth}\baselineskip=2ex 第\thechapter\ 章\ #1\end{varwidth}};
        \begin{pgfonlayer}{main}
        \fill[black!30,opacity=.8]([shift={(0,-4.25cm)}]current page.north west) rectangle ++(\paperwidth,-2mm);
        \node[right] (image) at ([shift={(0,-2.5cm)}]current page.north west) {\includegraphics[width=3cm]{figures/hehua.png}};
        \end{pgfonlayer}
        \node[above,font=\normalfont\normalsize] (pagenumber) at ([shift={(0,.8cm)}]current page.south) {\thepage};
        \end{tikzpicture}
    }
\titleformat{name=\chapter,numberless}{\bfseries\huge\filcenter}{}{1em}{
    \begin{tikzpicture}[remember picture, overlay]%
        \fill[deepblue!18,opacity=.5] (current page.north west) rectangle ++(\paperwidth,-.2\paperheight);
        \node[left,font=\huge\bfseries] (contents name) at ([shift={(0cm,-3cm)}]current page.north east) {\begin{varwidth}{.9\linewidth}\baselineskip=2ex #1\end{varwidth}};
        \begin{pgfonlayer}{main}
        \fill[black!30,opacity=.8]([shift={(0,-4.25cm)}]current page.north west) rectangle ++(\paperwidth,-2mm);
        \node[right] (image) at ([shift={(0,-2.2cm)}]current page.north west) {\includegraphics[width=3cm,angle =45]{figures/flower.png}};
        \end{pgfonlayer}
        \node[above,font=\normalfont\normalsize] (pagenumber) at ([shift={(0,.8cm)}]current page.south) {\thepage};
        \end{tikzpicture}
}
\titlespacing{\chapter}{0pt}{0pt}{65pt}
%% ---------
% -------- Part定制
\definecolor{backgroundcolor}{HTML}{dfdfdf}
\definecolor{barcolor}{HTML}{a8a8a8}
% Partcode
\makeatletter
\newcommand*\partabstract[1]{\def\@partabstract{#1}}
\newcommand*\partimage[1]{\def\@partimage{#1}}
\titleformat{\part}
{\normalfont\huge\filcenter}
{}
{20pt}
{\begin{tikzpicture}[remember picture,overlay]
    \def\barwidth{2cm}
        \fill[backgroundcolor]
    (current page.north west) rectangle (current page.south east);
        \fill[barcolor]
    (current page.north east) rectangle ++(-\barwidth,-\paperheight);
        \node[] (hbar) at ($(current page.north)!0.33!(current page.south)$) {
            \begin{tikzpicture}
                \fill[white] 
                (0,0) rectangle ++(\paperwidth,-1cm);
                \fill[backgroundcolor]
                (0,-.25cm) rectangle ++(\paperwidth,-.5cm);
                \fill[barcolor]
                (.67\paperwidth,-.25cm) rectangle ++(4.5cm,-.5cm);
                \fill[barcolor!20!white]
                (.67\paperwidth-1mm,-.25cm) rectangle ++(1mm,-.5cm);
                \fill[barcolor!20!white]
                (.67\paperwidth+4.4cm,-.25cm) rectangle ++(1mm,-.5cm);
            \end{tikzpicture}
        };
        \node[above,font=\sffamily\huge,shift={(.33\linewidth,.5\barwidth)}] (partname) at (hbar) {第\,\zhnumber{\arabic{part}}\,部\,分};
        \node[below,left,font=\bfseries\huge,shift={(.146\linewidth,-1.5*\barwidth)}] (partcontents) at (partname) {\begin{varwidth}{.8\linewidth}\raggedright\baselineskip=2.8ex  #1 \end{varwidth}}; % 标题名称
        \node[below,,font=\kaishu\fontsize{13}{13}\selectfont,shift={(0\linewidth,-1.65*\barwidth)}] at (hbar) {\ifdefvoid{\@partabstract}{}{\begin{varwidth}{.85\linewidth}\baselineskip=3ex \@partabstract\end{varwidth}}}; % 简介文字调整
        \node[above,shift={(-.04\barwidth,-.6\barwidth)},opacity=0.5] at (partname) {\ifdefvoid{\@partimage}{}{\includegraphics[width=6cm]{\@partimage}}}; % 图片位置调整
    \end{tikzpicture}}
\makeatother
\assignpagestyle{\part}{empty}
% /* -------------------------------------------------------------------------- */
% /*                                Section Style                               */
% /* -------------------------------------------------------------------------- */
% \newcommand{\sectionnumstyle}[2]{
% \makebox[0pt][l]{\def\rad{5pt}%
% \def\inrad{3pt}
%     \begin{tikzpicture}[remember picture]
%     \path[fill=#2,drop shadow={opacity=0.3,shadow xshift=0.5mm,shadow yshift=-0.5mm}]node[append after command={
%     % 主体
%     ([shift={(\rad,\rad)}]sec.north west) arc[start angle=90, end angle=180, radius=\rad]  {[rounded corners=\inrad]--(sec.south west)}--([yshift=-3mm]$(sec.south west)!0.5!(sec.south east)$) {[rounded corners=\inrad]--(sec.south east)} -- (sec.north east) arc[start angle=180, end angle=90, radius=\rad]--cycle
%     },
%     text=white,font=\sffamily\large\bfseries,align=center,inner ysep=1.5mm,inner xsep=1mm] (sec) at (0,0) {\thesection};
%     % 阴影
%     \begin{pgfonlayer}{bottom}
%         \fill[#2!30!black!70,opacity=0.8] ([xshift=\rad,yshift=\rad]sec.north east) to[out=0,in=-81,looseness=1.5] ([xshift=1.8*\rad]sec.north east)--(sec.north east) |-cycle;
%     \end{pgfonlayer}
%     \node[text=black,font=\large,below right] (sectitle) at ([shift={(2mm,6.5mm)}]sec.south east) {\begin{varwidth}{.9\linewidth}\setlength\baselineskip{18pt}#1\end{varwidth}};
%     \begin{pgfonlayer}{bottom}
%     \draw[gray,dashed,opacity=0.5] ([xshift=0]sec.north west) --([xshift=4*\rad]sec.north east);
%     \end{pgfonlayer}
%     \end{tikzpicture}}
% }

% \newcommand{\sectionnonumstyle}[2]{
% \makebox[0pt][l]{\def\rad{5pt}%
% \def\inrad{3pt}
%     \begin{tikzpicture}[remember picture]
%     \path[fill=#2,drop shadow={opacity=0.3,shadow xshift=0.5mm,shadow yshift=-0.5mm}]node[append after command={
%     % 主体
%     ([shift={(\rad,\rad)}]sec.north west) arc[start angle=90, end angle=180, radius=\rad]  {[rounded corners=\inrad]--(sec.south west)}--([yshift=-3mm]$(sec.south west)!0.5!(sec.south east)$) {[rounded corners=\inrad]--(sec.south east)} -- (sec.north east) arc[start angle=180, end angle=90, radius=\rad] --cycle
%     },
%     text=white,font=\sffamily\large\bfseries,align=center,inner ysep=0.5mm,inner xsep=1.5mm] (sec) at (0,0) {\Huge\ding{99}};
%     % 阴影
%     \begin{pgfonlayer}{bottom}
%         \fill[#2!30!black!70,opacity=0.8] ([xshift=\rad,yshift=\rad]sec.north east) to[out=0,in=-81,looseness=1.5] ([xshift=1.8*\rad]sec.north east)--(sec.north east) |-cycle;
%     \end{pgfonlayer}
%     \node[text=black,font=\large,below right] (sectitle) at ([shift={(2mm,6.5mm)}]sec.south east) {\begin{varwidth}{.9\linewidth}\setlength\baselineskip{18pt}#1\end{varwidth}};
%     \begin{pgfonlayer}{bottom}
%     \draw[gray,dashed,opacity=0.5] (sec.north west) --([xshift=4*\rad]sec.north east);
%     \end{pgfonlayer}
%     \end{tikzpicture}}
% }
% %% -- Section
% \titleformat{\section}
% {}
% {}
% {-.5em} %左右移动\thesection标签位置
% {\sectionnumstyle{#1}{deepblue}}

% \titleformat{name=\section,numberless}{}{}{-.5em}{\sectionnonumstyle{#1}{deepblue}}
% 
% \titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

% /* -------------------------------------------------------------------------- */
% /*                                Section Style                               */
% /* -------------------------------------------------------------------------- */
\definecolor{huise}{HTML}{dcdfde}
\newcommand{\secondsectionnumstyle}[2]{
\makebox[0pt][l]{\def\rad{3.6pt}
\def\innerroundcorner{6pt}
\def\innerlefthsep{3mm}
\def\innerleftvsep{4mm}
    \begin{tikzpicture}[remember picture]
    \path[fill=#2,drop shadow={opacity=0.3,shadow xshift=0.5mm,shadow yshift=-0.5mm},rounded corners=\innerroundcorner]node[append after command={% 主体
    (sec.north west) -- (sec.south west) --(sec.south east) -- (sec.north east) --cycle
    },
    text=black,font=\sffamily\large\bfseries,align=center,inner ysep=4mm,inner xsep=4.5mm] (sec) at (0,0) {\hspace*{3mm}
    \begin{varwidth}{.9\linewidth}
        \setlength\baselineskip{18pt} {\textcolor{purple}{\Large\thesection}} \\[-.8em]\tikz\draw[black,dotted](0,0)--++(\linewidth,0);\\ #1
    \end{varwidth}
    }; % The contents of the section
     \fill[white] ([shift={(\innerlefthsep,-\innerleftvsep)}]sec.north west) arc[start angle=180, end angle=0, radius=\rad] -- ([shift={(\innerlefthsep+2*\rad,\innerleftvsep)}]sec.south west) arc[start angle=0, end angle=-180, radius=\rad] --cycle; % The horizontal white bar on the left
    \end{tikzpicture}}
}

\newcommand{\secondsectionnonumstyle}[2]{
\makebox[0pt][l]{\def\rad{3.6pt}
\def\innerroundcorner{6pt}
\def\innerlefthsep{3mm}
\def\innerleftvsep{4mm}
    \begin{tikzpicture}[remember picture]
    \path[fill=#2,drop shadow={opacity=0.3,shadow xshift=0.5mm,shadow yshift=-0.5mm},rounded corners=\innerroundcorner]node[append after command={% 主体
    (sec.north west) -- (sec.south west) --(sec.south east) -- (sec.north east) --cycle
    },
    text=black,font=\sffamily\large\bfseries,align=center,inner ysep=4mm,inner xsep=4.5mm] (sec) at (0,0) {\hspace*{3mm}
    \begin{varwidth}{.9\linewidth}
        \setlength\baselineskip{18pt}  #1
    \end{varwidth}
    }; % The contents of the section
     \fill[white] ([shift={(\innerlefthsep,-\innerleftvsep)}]sec.north west) arc[start angle=180, end angle=0, radius=\rad] -- ([shift={(\innerlefthsep+2*\rad,\innerleftvsep)}]sec.south west) arc[start angle=0, end angle=-180, radius=\rad] --cycle; % The horizontal white bar on the left
    \end{tikzpicture}}
}

%% -- Section
\titleformat{\section}
{}
{}
{-1.2em} %左右移动\thesection标签位置
{\secondsectionnumstyle{#1}{huise!70}}

\titleformat{name=\section,numberless}{}{}{-1.2em}{\secondsectionnonumstyle{#1}{huise!70}}
\titlespacing{\section}
{0pt} % left sep
{*3} % before sep % *n (n ex)
{*1.5} % after sep
[0pt] % right sep
%% --------
\usepackage[
backend=biber,
style=numeric-comp,
sorting=nty
]{biblatex}
\addbibresource{ref.bib}
\makeindex
\setlist[itemize]{itemsep=1pt, parsep=1pt} % 对所有itemize环境生效
\setlist[enumerate]{itemsep=1pt, parsep=1pt} % 对所有enumerate环境生效





\endinput