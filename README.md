# VTEX i18n

Dicionários de tradução para aplicativos e sistemas da VTEX

## Usando em desenvolvimento

Clone este repositório

    git clone git@github.com:vtex/i18n
    cd i18n

Instale as dependências com npm

    npm install

Rode o servidor de desenvolvimento com grunt

    grunt

Isso irá iniciar um servidor em `localhost:8081` servindo os arquivos de `src/` no caminho `i18n/`

Exemplo: http://localhost:8081/i18n/address/es.json

## Publicando uma nova versão em produção

Instale a ferramenta [Releasy](github.com/vtex/releasy)

    npm install -g releasy

Na pasta do i18n, após ter commitado todas suas modificações:

    releasy

Caso queira gerar uma versão stable, use a flag `--stable`

    releasy --stable

Para alterar minor, use o comando `minor`

    releasy minor --stable

Arquivo exemplo publicado: http://io.vtex.com.br/i18n/0.1.1/checkout/pt.json
