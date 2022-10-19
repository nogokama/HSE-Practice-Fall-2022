FROM debian:10.1

RUN apt update && apt install --yes  \
    git \
    build-essential \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-extra \
    texlive-fonts-extra \
    dvipng \
    texlive-latex-recommended \
    texlive-base \
    texlive-science \
    cm-super 

RUN apt install --yes \
    texlive-generic-extra \
    texlive-lang-cyrillic \
    texlive-bibtex-extra \
    biber

COPY Content/Bibliography /Content/Bibliography
COPY Content/Parts /Content/Parts
COPY Content/*.tex /Content/
COPY Content/*.sty /Content/

COPY build.sh /build.sh

CMD ["/bin/bash", "build.sh"]
