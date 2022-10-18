FROM debian:10.1

RUN apt update && apt install --yes --no-install-recommends \
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
    cm-super \
    texlive-generic-extra

COPY Content /Content
COPY build.sh /build.sh

CMD ["/bin/bash", "build.sh"]