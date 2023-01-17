FROM klakegg/hugo:0.101.0-ext-alpine as quick-docs-basic-website

RUN apk update
RUN apk add git
COPY package.json /app/quick-docs-basic/website/
WORKDIR /app/quick-docs-basic/website/
RUN git config --global --add safe.directory /app/quick-docs-basic

CMD ["dev", "--cleanDestinationDir", "--themesDir", "../..", "--baseURL",  "http://localhost:1313/", "--buildDrafts", "--buildFuture", "--disableFastRender", "--ignoreCache", "--watch"]
