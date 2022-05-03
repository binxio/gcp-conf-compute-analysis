# GCP Confidential VM & Shielded VM Analysis

This repository contains the literature research on the current state
of Confidential Compute at Google Cloud Platform (GCP). 

## Goal
The goal of this document is to provide an overview 
of the Confidential Compute service 
and shielded VM provided by Google Cloud (GCP). 

This document includes: 
(1) the description of the trust-layers used by Google, 
(2) links to resources, 
(3) example code and 
(4) an explicit literature research into known vulnerabilities of the AMD EPYC CPU 
that is the main hardware component of the Google Confidential Compute. 

## use case of GCP and Confidential Compute
The perspective of this analysis is to determine,
the level of decoupling there can be realized between you as GCP user
and GCP as Cloud Service Provider (GCP).

A common use case for this requirement is the processing of 
[Personally identifiable information](https://en.wikipedia.org/wiki/Personal_data) (PII) 
that needs to be decoupled from parties under US law, 
when it concerns data of EU Citizens due to EU GDPR legislation.

## Content
Topics discussed in this document are:
- GCP Titan (TPM)
- GCP Shielded VM (vTPM)
- GCP Confidential VM (TEE)
- GCP Integrity Monitoring
- GCP Organizational Policies
- GCP Combining Encryption


## Quality Assurance
The goal is to have various Subject Matter Experts (SME) review 
(1) this document and (2) the Zotero reference library,  
and to provide feedback via for example adding issues in the GitHub tracker.

To achieve this, from a compliance viewpoint, 
is by not including information from any of our clients and employers. 
In addition the context of and in a company is very specific and unique 
and therefore difficult to comment on by SME’s not knowledgeable of this context.

## Open for contribution
This analysis is documented in the LaTeX format, 
so that versioning and contribution can
be facilitated via Git/ GitHub and is open for everybody to contribute.

The Confidential Compute technology and the offerings at GCP are continuously 
updated, so this analysis should also be continuously updated.

## License
The content of this document is a (re-)mix of available public sources. 
The original authors are Maarten Baijs, Laurens Knoll and Edzo Botjes. 
This document includes reference to these public sources. The license of this document is Creative Commons By Association 4.0. 
This implies that everybody is free to use, 
adapt and change the content of this document 
but needs to mention explicitly that this document is the source.

## Tool Support

### Zotero
* References are part of the public Zotero reference group  
“[confidential compute](https://www.zotero.org/groups/4612254/confidential_compute/library)”.
* [Zotero](https://www.zotero.org/support/zotero_support) is an open source reference manager.
* Zotero has great support in academia for example:
[Caltech University Library](https://libguides.caltech.edu/introacademicwriting/zotero),
[APA - Compatible reference tools](https://www.apa.org/science/about/psa/2013/12/reference-manager),
[How to use zotero in google docs](https://www.zotero.org/support/google_docs).

* This document **was** maintained as [Google Document](https://docs.google.com/document/d/11CT-7dBg7NQR0ziAiKCu-tyYEltH_gH-2bx-IZsZMuY/edit?usp=sharing) 
before but is now maintained on github.


### CI pipeline for LaTeX example

This repository contains examples from the blog post 
[How to annoy your co-authors: a Gitlab CI pipeline for LaTeX](https://blog.martisak.se/2020/05/11/gitlab-ci-latex-pipeline/).

This latex-pipeline is using 
[Docker](https://docs.docker.com/get-docker/) 
and 
[GNU make](https://www.gnu.org/software/make/)
together with 
[latexMK](https://ctan.org/pkg/latexmk?lang=en) 
in a the 
[texlive:latest container](https://hub.docker.com/r/texlive/texlive).

The [texlive:latest container](https://hub.docker.com/r/texlive/texlive).
is updated weekly by the texlive organisation.


When you need to change the (advanced) setting, y
ou can do this via the `Makefile` and `latexmkrc` files.

---

### Compile locally with 

```bash
make clean render
```

### Continiously Compile locally with 

to keep compiling the pdf when the input files are updated.
 

```bash
make clean render LATEXMK_OPTIONS_EXTRA=-pvc
```

### Continiously refresh PDF 

To refresh the PDF continuous:
```bash
evince paper/latexmk/main.pdf
```

This runs the PDF viewer [Evince](https://wiki.gnome.org/Apps/Evince) 
that refreshes automatically when the pdf is changed. 

## Documentation Conventions
1. Every sentence around 7 words.
1. After every '.' an \n (enter) in the source file.
1. Every \cite or \citep on a new line (\n).
1. When in landscape images to the right, text to the left.
1. Language setting is US_EN
1. Figures have as label prefix 'fig:'
1. All figures should have transparent background color.

## Backlog
1. Select Open Font (default roboto)
1. add organization, email, orcid and communicating to authors
1. migrate content from google doc to latex
1. copy references from Zotero to bib file
1. setup/ reserve an DOI in Zenodo
1. move backlog to github 
1. refactor gitlab-ci to github actions
1. adjust latex template design based on Binx based on Xebia
  1. Rotate whitepaper to landscape
1. use latex tooling (TODO EDZO) to fix abbreviation and glossary

### Font
* The google font familiy is well supported in LaTeX, new and free to use.

#### Noto
* The Noto font is part of google font familiy and has extensive math and unicode support
* [Noto@google_font](https://fonts.google.com/noto/use#faq)
* [Notomath@utwente](https://ftp.snt.utwente.nl/pub/software/tex/fonts/notomath/doc/notomath-doc.pdf)
* [Noto@Overleaf](https://www.overleaf.com/learn/latex/XeLaTeX#Fonts_installed_on_Overleaf.27s_servers:_Google_Noto_fonts)
* [Noto Sans@tug](https://tug.org/FontCatalogue/notosans/)

```latex    
\usepackage[sfdefault]{noto}
\usepackage[T1]{fontenc}
```

#### EB Garamond
* "The elegant EB Garamond is a fantastic alternative for Times New Roman." 
* [EB Garamond@google_font](https://fonts.google.com/specimen/EB+Garamond#standard-styles)
* [EB Garamond@tug](https://tug.org/FontCatalogue/ebgaramond/)

```latex    
\usepackage[cmintegrals,cmbraces]{newtxmath}
\usepackage{ebgaramond-maths}
\usepackage[T1]{fontenc}
```

#### Merriweather
* Merriweather is softer and more casual than Times New Roman, yet still distinguished.
* [Merriweather@google_font](https://fonts.google.com/specimen/Merriweather#license)
* [Merriweather@tug](https://tug.org/FontCatalogue/merriweather/)

```latex
\usepackage{merriweather} %% Option 'black' gives heavier bold face 
\usepackage[T1]{fontenc}
```

#### Roboto
* [Roboto font@tug](https://tug.org/FontCatalogue/roboto/)

```latex
\usepackage[sfdefault]{roboto}  %% Option 'sfdefault' only if the base font of the document is to be sans serif
\usepackage[T1]{fontenc}
```

* "The mission of the Scientific and Technical Information Exchange (STIX) font creation project is the preparation of a comprehensive set of fonts that serve the scientific and engineering community in the process from manuscript creation through final publication, both in electronic and print formats." 
* [stix2 homepage](https://www.stixfonts.org/)
* [Stix2@tug](https://tug.org/FontCatalogue/stix2/)

```latex    
\usepackage[T1]{fontenc}
%\usepackage{stix2} 
```

