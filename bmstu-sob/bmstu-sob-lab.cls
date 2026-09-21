\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bmstu-sob-lab}[2026/09/21 v1.2.1 BMSTU laboratory-report profile]

% The laboratory profile deliberately does not force the legacy 10 mm margin:
% the current general BMSTU profile is 30/15/20/20. A department-specific
% instruction may request the older 30/10/20/20 profile explicitly with [legacy10].
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bmstu-sob}}
\PassOptionsToClass{lab}{bmstu-sob}
\ProcessOptions\relax
\LoadClass{bmstu-sob}

\endinput
