# Sistema de Gestão Comercial com Interface Responsiva

## Projeto Tecnológico em Sistemas para Internet

### Tatiane Valentine de Aguirres Nogueira


#### Instruções para utilizar o sistema:

* Instalação do Ruby
    1.	Acessar a página https://rubyinstaller.org/
    2.	Clicar no botão Download
    3.	Selecionar a última versão de do instalador de acordo com a plataforma (x86 ou x64)
    a.	Ruby 2.4.2-2 (x64)
    b.	Ruby 2.4.2-2 (x86)
    4.	Executar o instalador e seguir os passos propostos e aguardar até o final da instalação

* Instalação do RubyDev
    1.	Acessar a página https://rubyinstaller.org/downloads/
    2.	Encontrar a sessão Development Kit e efetuar o download do instalador de acordo com sua plataforma
    a.	DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe
    b.	DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe
    3.	Executar o instalador e descompactá-lo no C:\RubyDevKit
    4.	Após descompactar abra o Prompt de Comando e navegue até a pasta C:\RubyDevKit
    5.	Execute o comando ruby dk.rb init
    6.	Execute o comando ruby dk.rb install

* Instalação do MySQL
    1.	Acessar a página https://dev.mysql.com/downloads/
    2.	Clicar no link MySQL Community Server
    3.	Clicar no link Go To Download Page
    4.	Clicar no botão de Download para o segundo item do instalador
    5.	Executar o instalador e seguir os passos propostos
        1.	Na tela Choosing a Setup Type selecione a opção Developer Default
    6.	Aguardar até o final da instalação
    7.	Defina um usuário e senha para o banco
    8.	Siga o restante dos passos até o término da instalação

* Baixar o projeto
    1.	Acessar a página https://github.com/tatianeaguirres/tcc-sgc
    2.	Clicar no botão Clone or Download
    3.	Clicar no item Download ZIP
    4.	Descompactar o arquivo tcc-sgc-master no C:\


#### Configurações do Projeto

* Bibliotecas
    1.	Abra o Prompt de Comando e navegue até o a pasta C:\tcc-sgc-mater
    2.	Execute o comando gem install bundler e aguarde o termino da instalação do Bundler
    3.	Execute o comando bundle install e aguarde até o término da instalação das dependências do projeto (pode levar alguns minutos)
    4.	Execute o comando rake db:create

* Banco de dados
    1.	Abra o Prompt de Comando
    2.	Navegue até a pasta C:\Program Files\MySQL\MySQL Server 5.7\bin
    3.	Execute o seguinte comando para importar as tabelas do banco, subistituindo o <usuário> pelo usuário root do banco. Será necessário informar a senha via linha de comando
    mysql –u<usuario> -p -h localhost sgc_development < C:\tcc-sgc-master\sgc_db.sql


* Configuração banco no projeto
    1.	Abra o Prompt de Comando e navegue até o a pasta C:\tcc-sgc-mater
    2.	Execute o comando rails db:migrate


* Executar o projeto
    1.	Abra o Prompt de Comando e navegue até o a pasta C:\tcc-sgc-mater
    2.	Execute o comando rails s
    3.	Abra o browser web e digite o endereço: http://localhost:3000
    4.	Utilize as seguintes informações para autenticação:
        1.	Usuário: admin@exemplo.com
        2.	Senha: 12345678


