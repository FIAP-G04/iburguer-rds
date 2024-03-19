<!-- Permite  a funcionalidade de voltar ao topo -->
<a name="readme-top"></a>

<!-- Titulo do projeto -->
<div align="center" style="margin-bottom: 16px">
    <img src=".github/images/logo.png" alt="logo" />
</div>

___________________________________________________

<!-- Informações visuais do projeto -->
<div align="center">
    <img alt="Repository size" src="https://img.shields.io/github/repo-size/FIAP-G04/iburguer-eks?color=009bd9">
    <a href="https://github.com/FIAP-G04/iburguer-eks/commits/main">
        <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/FIAP-G04/iburguer-eks?color=009bd9">
    </a>
    <img alt="License" src="https://img.shields.io/badge/license-MIT-009db9">
    <a href="https://github.com/FIAP-G04/iburguer-eks/stargazers">
        <img alt="Stargazers" src="https://img.shields.io/github/stars/FIAP-G04/iburguer-eks?color=009db9&logo=github">
    </a>
    <img alt="Version" src="https://img.shields.io/badge/Version-8.0-3B19E5?logo=dotnet" />
</div>

<!-- Breve descrição sobre o projeto -->

<div align="center">
  <sub>Sistema com o objetivo de gerenciar os pedidos de uma lanchonete. Construído por <a href="https://github.com/CarlosEduAC">Carlos Cardoso</a>, <a href="https://github.com/LuanPCunha">Luan Cunha</a>, <a href="https://github.com/matheusantonio">Matheus Cardoso</a> e <a href="https://github.com/vinisaeta">Vinicius Saeta</a>.
  </sub>
</div>

<!-- Tabela de conteúdo do projeto -->

## Objetivo
Esse repositório tem por objetivo armazenar a estrutura em Terraform do **banco de dados relacional Postgres** através do recurso **RDS** da AWS.

# ➡️ Execução

<!-- Pré-requisitos para rodar o projeto -->

Para executar este projeto, é necessário possuir o [Terraform](https://www.terraform.io/) instalado, assim como as credenciais da [AWS](https://aws.amazon.com/pt/) configuradas.

Para incializar o projeto e instalar as dependências, é necessário executar o comando:

``` terraform ini ``` 

Para visualizar todos os recursos que serão provisionados na AWS, o comendo a seguir pode ser executado:

``` terraform plan ``` 

Por fim, para provisionar os recursos, é necessário executar o comando:

``` terraform apply ``` 

Durante a execução do comando anterior, será solicitada a confirmação do provisionamento dos recursos. É necessário digitar exatamente ***yes*** para seguir com o provisionamento.

# 📕 License

Lançado em 2023 📕 License

Construído por [Carlos Cardoso](https://github.com/CarlosEduAC), [Luan Cunha](https://github.com/LuanPCunha), [Matheus Cardoso](https://github.com/matheusantonio) e [Vinicius Saeta](https://github.com/vinisaeta) 🚀.
Esse projeto esta sobre [MIT license](./LICENSE).

<p align="right">(<a href="#readme-top">Volta ao topo</a>)</p>

[swaggerlogo]: .github/images/swagger.svg
[menufunc]: .github/images/func_menu.png
[customerfunc]: .github/images/func_customer.png
[shoppingcartfunc]: .github/images/func_shopping_cart.png
[checkoutfunc]: .github/images/func_checkout.png
[orderfunc]: .github/images/func_order.png
[diagramaimplantacaok8s]: .github/images/diagrama-de-implantacao-k8s.png
[visaoinfra1]: .github/images/visao-de-infraestrutura-parte-1.png
[visaoinfra2]: .github/images/visao-de-infraestrutura-parte-2.png
[visaomacro]: .github/images/visao-macro.png
