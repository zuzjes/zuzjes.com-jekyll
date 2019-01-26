FROM ruby as build
MAINTAINER Ondrej Sika <ondrej@ondrejsika.com>
RUN gem install jekyll
WORKDIR /www
COPY . /www
RUN jekyll build

FROM nginx:alpine
MAINTAINER Ondrej Sika <ondrej@ondrejsika.com>
COPY --from=build /www/_site /usr/share/nginx/html

