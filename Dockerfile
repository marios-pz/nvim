FROM alpine:3.18.4

LABEL maintainer="mario-pz <papazogloy59@gmail.com>"

<<<<<<< HEAD
RUN apk --update --no-cache add neovim git python3 cargo go
=======
RUN apk --update --no-cache add neovim git python3 npm cargo go
>>>>>>> origin

RUN adduser -D nvimuser

USER nvimuser

COPY . /home/nvimuser/.config/nvim

WORKDIR /home/nvimuser

CMD ["nvim"]

