return {
  -- Document structure
  s({
    trig = "doc",
  }, {
    t({"\\documentclass{article}",
       "\\usepackage[utf8]{inputenc}",
       "\\usepackage[T1]{fontenc}",
       "\\usepackage{lmodern}",
       "\\usepackage{amsmath}",
       "\\usepackage{graphicx}",
       "",
       "\\title{"}),
    i(1, "Your Title"),
    t({"}", 
       "\\author{"}),
    i(2, "Your Name"),
    t({"}", 
       "\\date{\\today}",
       "",
       "\\begin{document}",
       "",
       "\\maketitle",
       "",
       }),
    i(0),
    t({"",
       "",
       "\\end{document}"
      }),
  }),

  -- Section
  s({
    trig = "sec",
  }, {
    t("\\section{"),
    i(1, "Section name"),
    t("}"),
    i(0),
  }),

  -- Subsection
  s({
    trig = "ssec",
  }, {
    t("\\subsection{"),
    i(1, "Subsection name"),
    t("}"),
    i(0),
  }),

  -- Table
  s({
    trig = "tab",
  }, {
    t({"\\begin{table}[h]",
       "\\centering",
       "\\caption{"}),
    i(1, "Table caption"),
    t({"}", 
       "\\label{tab:"}),
    i(2, "label"),
    t({"}", 
       "\\begin{tabular}{"}),
    i(3, "|c|c|c|"),
    t({"}", 
       "\\hline",
       }),
    i(4, "Column 1 & Column 2 & Column 3 \\\\"),
    t({"",
       "\\hline",
       }),
    i(0),
    t({"",
       "\\hline",
       "\\end{tabular}",
       "\\end{table}"
      }),
  }),

  -- Figure
  s({
    trig = "fig",
  }, {
    t({"\\begin{figure}[h]",
       "\\centering",
       "\\includegraphics[width="}),
    i(1, "0.8"),
    t({"\\textwidth]{"}),
    i(2, "filename"),
    t({"}", 
       "\\caption{"}),
    i(3, "Figure caption"),
    t({"}", 
       "\\label{fig:"}),
    i(4, "label"),
    t({"}", 
       "\\end{figure}",
       }),
    i(0),
  }),

  -- Equation
  s({
    trig = "eq",
  }, {
    t({"\\begin{equation}",
       "\\label{eq:"}),
    i(1, "label"),
    t({"}", 
       "    "}),
    i(2, "equation"),
    t({"",
       "\\end{equation}",
       }),
    i(0),
  }),

  -- Align environment
  s({
    trig = "al",
  }, {
    t({"\\begin{align}",
       "    "}),
    i(1, "equation 1"),
    t(" \\\\"),
    t({"",
       "    "}),
    i(2, "equation 2"),
    t({"",
       "\\end{align}",
       }),
    i(0),
  }),

  -- Itemize environment
  s({
    trig = "item",
  }, {
    t({"\\begin{itemize}",
       "    \\item "}),
    i(1, "First item"),
    t({"",
       "    \\item "}),
    i(2, "Second item"),
    t({"",
       "    \\item "}),
    i(3, "Third item"),
    t({"",
       "\\end{itemize}",
       }),
    i(0),
  }),

  -- Enumerate environment
  s({
    trig = "enum",
  }, {
    t({"\\begin{enumerate}",
       "    \\item "}),
    i(1, "First item"),
    t({"",
       "    \\item "}),
    i(2, "Second item"),
    t({"",
       "    \\item "}),
    i(3, "Third item"),
    t({"",
       "\\end{enumerate}",
       }),
    i(0),
  }),
  
  -- General begin environment
  s({
    trig = "beg",
  }, {
    t("\\begin{"),
    i(1, "environment"),
    t({"}",
       "    "}),
    i(2),
    t({"",
       "\\end{"}),
    f(function(args) return args[1][1] end, {1}),
    t("}"),
    i(0),
  }),
}

