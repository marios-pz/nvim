FROM alpine:latest

RUN apk --update --no-cache add neovim git python3 python3-dev cargo go npm luarocks

RUN adduser -D nvimuser

USER nvimuser

COPY . /home/nvimuser/.config/nvim


WORKDIR /home/nvimuser

CMD ["nvim"]
