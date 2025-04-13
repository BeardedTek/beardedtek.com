FROM hugomods/hugo:go-git-0.145.0 as builder

ARG GIT_REPO

RUN git clone $GIT_REPO /src

ARG HUGO_BASEURL
ARG HUGO_OUTPUT

RUN hugo build -d $HUGO_OUTPUT --minify