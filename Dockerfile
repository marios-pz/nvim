FROM alpine:latest

LABEL maintainer="marios-pz <papazogloy59@gmail.com>"

RUN apk --update --no-cache add neovim git python3 cargo go

RUN adduser -D nvimuser

USER nvimuser

COPY . /home/nvimuser/.config/nvim

WORKDIR /home/nvimuser

CMD ["nvim"]
