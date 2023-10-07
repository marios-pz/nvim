FROM alpine:3.18.4

LABEL maintainer="mario-pz <papazogloy59@gmail.com>"

RUN apk --update --no-cache add neovim git python3 npm cargo go

RUN adduser -D nvimuser

USER nvimuser

COPY . /home/nvimuser/.config/nvim

WORKDIR /home/nvimuser

CMD ["nvim"]

