FROM ubuntu:22.04
RUN apt-get update -qq \
    && apt-get install -y curl
RUN apt-get install -y nginx
COPY start.sh /
RUN chmod +x start.sh
CMD [ "/start.sh" ]
ENV TITLE="use TITLE/COLOR env vars"
ENV COLOR=gray
#ENV BODY="use BODY env variable"
EXPOSE 80
