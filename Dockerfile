FROM klakegg/hugo:0.101.0-ext-alpine as quick-docs-basic-website

RUN apk update
RUN apk add git
WORKDIR /app/quick-docs-basic/website/
RUN git config --global --add safe.directory /app/quick-docs-basic

CMD ["server", "--cleanDestinationDir", "--themesDir", "../..", "--baseURL",  "http://:localhost1313/", "--buildDrafts", "--buildFuture", "--disableFastRender", "--ignoreCache", "--watch"]
